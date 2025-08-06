import 'dart:developer';

import 'package:common/l10n/build_context_extension.dart';
import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/base_loader_builder.dart';
import 'package:common/widgets/custom_functions.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/model/cars/car_step.dart';
import 'package:domain/model/location/point_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:main/my_cars/create_car/cubit_page1.dart';
import 'package:navigation/my_cars_intents.dart';

class Page1 extends StatefulWidget {
  final ValueChanged<String> onChangedMake;
  final ValueChanged<String> onChangedModel;
  final ValueChanged<String> onChangedRegNumber;
  final ValueChanged<String> onChangedCity;
  final ValueChanged<String> onChangedTransmission;
  final ValueChanged<String> onChangedPassengerCapacity;
  final Function(double latitude, double longitude) onChangedLocations;

  const Page1({
    super.key,
    required this.onChangedMake,
    required this.onChangedModel,
    required this.onChangedRegNumber,
    required this.onChangedCity,
    required this.onChangedTransmission,
    required this.onChangedPassengerCapacity,
    required this.onChangedLocations,
  });

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String location = "";
  final CarPage1Cubit cubit = CarPage1Cubit(inject());
  final _formKey = GlobalKey<FormState>();
  final RegExp carNumberRegExp = RegExp(
    r'^(\d{2} [A-Z] \d{3} [A-Z]{2}|\d{2}  \d{3} [A-Z]{3})$',
  );

  final TextEditingController regNumberController = TextEditingController();

  int markId = 0;
  String markName = "";

  ///
  ///
  List<Model> modelPage1 = [];
  int modelId = 0;
  String modelName = "";

  ///
  ///
  String cityName = "";
  int cityId = 0;

  ///
  /// count set
  String countSet = "";

  ///
  /// transmission
  String transmissionName = "";
  String transmissionId = "";

  final List<TypeName> passengerCapacity = [
    TypeName("2", "2"),
    TypeName("4", "4"),
    TypeName("6", "6"),
    TypeName("8+", "8+"),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.getCarStep1();
    });
  }

  @override
  void dispose() {
    regNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarPage1Cubit, CarPage1State>(
      bloc: cubit,
      listener: (context, state) {},
      builder: (context, state) {
        return BaseLoaderBuilder(
          hasLoading: state.isLoading,
          child: Container(
            margin: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProgressIndicator(context),

                  /// #mark
                 _buildFieldRow(
                    context: context,
                    label: context.translations.brand,
                    child: _buildDropdownField0(
                      hint: markName.isNotEmpty
                          ? markName
                          : context.translations.select2,
                      items: state.carModel.makes,
                      onSelected: (value, item) {
                        /// mark
                        markName = value;
                        markId = item.id;
                        widget.onChangedMake(markId.toString());

                        /// model default
                        modelName = '';
                        modelId = 0;
                        modelPage1.clear();

                        /// city default
                        cityName = "";
                        cityId = 0;

                        /// count
                        countSet = "";

                        final filteredModels = state.carModel.models
                            .where((element) => element.makeId == markId)
                            .toList();
                        modelPage1.addAll(filteredModels);
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  /// #model
                  _buildFieldRow(
                    context: context,
                    label: context.translations.model,
                    child: _buildDropdownField(
                      hint: modelName.isNotEmpty
                          ? modelName
                          : context.translations.select2,
                      items: modelPage1,
                      onSelected: (value, item) {
                        modelName = value;
                        modelId = item.id;
                        widget.onChangedModel(modelId.toString());
                        /// city
                        cityName = "";
                        cityId = 0;
                        ///
                        countSet = "";

                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  /// #Textformfield
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: _buildFieldRow(
                      context: context,
                      label: context.translations.state_number,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null) {
                            if (value.length == 11) {
                              if (!carNumberRegExp.hasMatch(value)) {
                                return context.translations.checkInfo;
                                return null; // ✅ Hamma narsa to‘g‘ri}
                              } else {
                                return null;
                              }
                            }
                          } else {
                            return null;
                          }
                        },
                        maxLines: 1,
                        maxLength: 11,
                        controller: regNumberController,
                        onChanged:(val){
                          var value = val.replaceAll(" ", '');
                          widget.onChangedRegNumber(value);
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9A-Za-z ]')),
                          CarNumberFormatter()
                        ],
                        keyboardType: TextInputType.text,
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          errorStyle:
                              const TextStyle(fontSize: 12, color: Colors.red),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 1)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 1)),
                          counter: const SizedBox.shrink(),
                          isDense: true,
                          contentPadding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 12,
                            bottom: 12,
                          ),
                          filled: true,
                          hintText: "01 | A 001 AA",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF658DF1)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF658DF1)),
                          ),
                          suffixIconConstraints:
                              const BoxConstraints(maxHeight: 40),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  /// #city
                  _buildFieldRow(
                    context: context,
                    label: context.translations.city,
                    child: _buildDropdownField2(
                      hint: cityName.isNotEmpty
                          ? cityName
                          : context.translations.select2,
                      items: state.carModel.cities,
                      onSelected: (value, item) {
                        if (modelName.isNotEmpty) {
                          cityName = value;
                          cityId = item.id;
                          countSet = "";
                          widget.onChangedCity(cityId.toString());
                          log( widget.onChangedCity.runtimeType.toString());

                        } else {
                          showToastSms(context.translations.chooseBrand);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// #transmission
                  _buildFieldRow(
                      context: context,
                      label: context.translations.transmission,
                      child: Container(
                        padding: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1, color: const Color(0xFF658DF1))),
                        child: ListTile(
                          leading: Text(
                            transmissionName.isNotEmpty
                                ? transmissionName
                                : context.translations.select2,
                            style: transmissionName.isEmpty
                                ? TextStyle(
                                    color: Colors.grey.shade500, fontSize: 16)
                                : TextTheme.of(context).bodyMedium,
                          ),
                          trailing: GestureDetector(
                            onTapDown: (details) {
                              if (cityName.isNotEmpty) {
                                _showDropdownMenu4(
                                  context: context,
                                  items: state.carModel.transmission,
                                  onSelected: (value, item) {
                                    if (cityName.isNotEmpty) {
                                      transmissionName = value;
                                      transmissionId = item;
                                      widget.onChangedTransmission(transmissionId);
                                    } else {
                                      showToastSms(
                                          context.translations.chooseCity);
                                    }
                                  },
                                  details: details,
                                );
                              } else {
                                showToastSms(context.translations.chooseCity);
                              }

                            },
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff7498F2),
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
                        ),
                      )
                      ),
                  const SizedBox(height: 16),

                  /// count
                  _buildFieldRow(
                    context: context,
                    label: context.translations.passenger_capacity,
                    child: _buildPassengerCapacityDropdownField(),
                  ),

                  const SizedBox(height: 16),
                  BaseButton(
                    width: 200,
                    onPressed: () => _handleLocationSelection(context),
                    title: context.translations.location,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    location,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProgressIndicator(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                height: 55,
                width: 55,
                child: CircularProgressIndicator(
                  value: 0.25,
                  backgroundColor: Color(0xFFD9D9D9),
                  strokeWidth: 8.0,
                ),
              ),
              Text(
                '1/4',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: const Color(0xFF658DF1),
                    ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  context.translations.fill_in_the_details_below,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldRow({
    required BuildContext context,
    required String label,
    required Widget child,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        SizedBox(width: 170, child: child),
      ],
    );
  }



  Widget _buildDropdownField({
    required String hint,
    required List<dynamic> items,
    required Function(String, dynamic) onSelected,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 5, bottom: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: const Color(0xFF658DF1))),
      child: ListTile(
        leading: SizedBox(
          width: 120,
          child: Text(
            hint,
            maxLines: 2,
            style: markName.isEmpty
                ? TextStyle(color: Colors.grey.shade500, fontSize: 16)
                : TextTheme.of(context).bodyMedium,
          ),
        ),
        trailing: GestureDetector(
          onTapDown: (details) {

            if (markName.isNotEmpty) {
              _showDropdownMenu(
                context: context,
                details: details,
                items: items,
                onSelected: onSelected,
              );
            } else {
              showToastSms(context.translations.chooseBrand);
            }


          },
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xff7498F2),
          ),
        ),
        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildDropdownField0({
    required String hint,
    required List<dynamic> items,
    required Function(String, dynamic) onSelected,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 5, bottom: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: const Color(0xFF658DF1))),
      child: ListTile(
        leading: SizedBox(
          width: 120,
          child: Text(
            hint,
            maxLines: 2,
            style: markName.isEmpty
                ? TextStyle(color: Colors.grey.shade500, fontSize: 16)
                : TextTheme.of(context).bodyMedium,
          ),
        ),
        trailing: GestureDetector(
          onTapDown: (details) {


              _showDropdownMenu(
                context: context,
                details: details,
                items: items,
                onSelected: onSelected,
              );

          },
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xff7498F2),
          ),
        ),
        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildDropdownField2({
    required String hint,
    required List<City> items,
    required Function(String, dynamic) onSelected,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: const Color(0xFF658DF1))),
      child: ListTile(
        leading: Text(
          hint,
          style: cityName.isEmpty
              ? TextStyle(color: Colors.grey.shade500, fontSize: 16)
              : TextTheme.of(context).bodyMedium,
        ),
        trailing: GestureDetector(
          onTapDown: (details)

          {

            if (modelName.isNotEmpty) {
              _showDropdownMenu2(
                context: context,
                details: details,
                items: items,
                onSelected: onSelected,
              );
            } else {
              showToastSms(context.translations.chooseModel);
            }
          },
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xff7498F2),
          ),
        ),
        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  void _showDropdownMenu4({
    required BuildContext context,
    required TapDownDetails details,
    required List<Transmission> items,
    required Function(String, dynamic) onSelected,
  }) {
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    showMenu(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy+25,
        17,
        overlay.size.height - details.globalPosition.dy + 50,
      ),
      items: items.map((e) {
        return PopupMenuItem(
          value: e.label,
          height: 35,
          child: Container(
            width: 120,
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
            ),
            child: Text(e.label, style: Theme.of(context).textTheme.bodyMedium),
          ),
          onTap: () => onSelected(e.label, e.key),
        );
      }).toList(),
    );
  }

  Widget _buildPassengerCapacityDropdownField() {
    return Container(
        padding: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: const Color(0xFF658DF1))),
        child: ListTile(
            leading: Text(
              countSet.isNotEmpty ? countSet : context.translations.select2,
              style: countSet.isEmpty
                  ? TextStyle(color: Colors.grey.shade500, fontSize: 16)
                  : TextTheme.of(context).bodyMedium,
            ),
            trailing: GestureDetector(
              onTapDown: (details)
              {

                if (transmissionName.length > 4) {
                  _showDropdownMenu3(
                    context: context,
                    details: details,
                    items: passengerCapacity,
                    onSelected: (value, item) {
                      countSet = item;
                      widget.onChangedPassengerCapacity(countSet);
                    },
                  );
                } else {
                  showToastSms(context.translations.chooseCarTransmission);
                }
                },
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xff7498F2),
              ),
            ),
            visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
            contentPadding: EdgeInsets.zero));
  }

  void _showDropdownMenu3({
    required BuildContext context,
    required TapDownDetails details,
    required List<TypeName> items,
    required Function(String, dynamic) onSelected,
  }) {
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    showMenu(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy+25,
        17,
        overlay.size.height - details.globalPosition.dy + 50,
      ),
      items: items.map((e) {
        return PopupMenuItem(
          value: e.type,
          height: 35,
          child: Container(
            width: 120,
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
            ),
            child: Text(e.type,
                maxLines: 1, style: Theme.of(context).textTheme.bodyMedium),
          ),
          onTap: () => onSelected(e.name, e.type),
        );
      }).toList(),
    );
  }

  void _showDropdownMenu2({
    required BuildContext context,
    required TapDownDetails details,
    required List<dynamic> items,
    required Function(String, dynamic) onSelected,
  }) {
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    showMenu(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy+25,
        17,
        overlay.size.height - details.globalPosition.dy + 50,
      ),
      items: items.map((e) {
        final name = context.languageCode == "uz" ? e.nameUz : e.nameRu;
        return PopupMenuItem(
          value: name,
          height: 35,
          child: Container(
            width: 120,
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
            ),
            child: Text(name,
                maxLines: 1, style: Theme.of(context).textTheme.bodyMedium),
          ),
          onTap: () => onSelected(name, e),
        );
      }).toList(),
    );
  }

  void _showDropdownMenu({
    required BuildContext context,
    required TapDownDetails details,
    required List<dynamic> items,
    required Function(String, dynamic) onSelected,
  }) {
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    showMenu(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy+20,
        17,
        overlay.size.height - details.globalPosition.dy + 50,
      ),
      items: items.map((e) {
        final name = context.languageCode == "uz" ? e.name : e.name;
        return PopupMenuItem(
          // padding: EdgeInsets.zero,
          height: 35,
          value: name,
          child: Container(
            width: 120,
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
            ),
            child: Text(name, style: Theme.of(context).textTheme.bodyMedium),
          ),
          onTap: () => onSelected(name, e),
        );
      }).toList(),
    );
  }

  void _handleLocationSelection(BuildContext context) {
    context.openScreen(SelectLocationScreenIntent()).then((value) {
      if (value is PointModel) {
        widget.onChangedLocations(value.latitude, value.longitude);
        setState(() {
          location = value.address;
        });
      }
    });
  }
}

extension ListExtension<T> on List<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }
}

class TypeName {
  final String type;
  final String name;

  TypeName(this.type, this.name);
}

class CarNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Kichik harfni katta qilish va bo'sh joylarni olib tashlash
    String raw = newValue.text.toUpperCase().replaceAll(RegExp(r'\s+'), '');

    String formatted = '';

    // Format tanlash
    if (raw.length >= 3 && RegExp(r'^\d{2}[A-Z]').hasMatch(raw)) {
      // Format: 01 A 123 AA
      if (raw.length <= 2) {
        formatted = raw;
      } else if (raw.length <= 3) {
        formatted = '${raw.substring(0, 2)} ${raw.substring(2)}';
      } else if (raw.length <= 6) {
        formatted =
            '${raw.substring(0, 2)} ${raw.substring(2, 3)} ${raw.substring(3)}';
      } else {
        formatted =
            '${raw.substring(0, 2)} ${raw.substring(2, 3)} ${raw.substring(3, 6)} ${raw.substring(6)}';
      }
    } else {
      // Format: 01 123 AAA
      if (raw.length <= 2) {
        formatted = raw;
      } else if (raw.length <= 5) {
        formatted = '${raw.substring(0, 2)}  ${raw.substring(2)}';
      } else {
        formatted =
            '${raw.substring(0, 2)}  ${raw.substring(2, 5)} ${raw.substring(5)}';
      }
    }

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
