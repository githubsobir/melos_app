import 'dart:convert';

import 'package:common/l10n/build_context_extension.dart';
import 'package:common/widgets/base_loader_builder.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:main/payment_details/payment_detail_cubit.dart';

void showHtmlBottomDialog(BuildContext context, String jsonData) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: HtmlDialogContent(jsonData: jsonData),
      );
    },
  );
}

class HtmlDialogContent extends StatefulWidget {
  final String jsonData;

  const HtmlDialogContent({Key? key, required this.jsonData}) : super(key: key);

  @override
  _HtmlDialogContentState createState() => _HtmlDialogContentState();
}

class _HtmlDialogContentState extends State<HtmlDialogContent> {
  late ScrollController _scrollController;
  bool _isButtonVisible = false;
  String _htmlContent = '';
  bool _isLoading = true;

  final PaymentDetailCubit cubit = PaymentDetailCubit(inject(), inject());

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _loadHtmlData();
  }

  /// Cubit orqali HTML ma'lumotlarini yuklash
  Future<void> _loadHtmlData() async {
    try {
      setState(() {
        _isLoading = true;
      });

      // Cubit dan HTML ma'lumotlarini olish
      String htmlData = await cubit.getData();

      if (htmlData.isNotEmpty) {
        setState(() {
          _htmlContent = htmlData;
          _isLoading = false;
        });
      } else {
        // Agar cubit dan ma'lumot bo'sh kelsa, jsonData dan parse qilish
        _parseJsonData();
      }
    } catch (e) {
      print('HTML yuklashda xatolik: $e');
      // Xatolik holida jsonData dan parse qilish
      _parseJsonData();
    }
  }

  void _parseJsonData() {
    try {
      final Map<String, dynamic> data = json.decode(widget.jsonData);
      setState(() {
        _htmlContent = data['html'] ?? data['content'] ?? '';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _htmlContent = 'HTML ma\'lumotini yuklashda xatolik yuz berdi';
        _isLoading = false;
      });
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 50) {
      if (!_isButtonVisible) {
        setState(() {
          _isButtonVisible = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentDetailCubit, PaymentDetailState>(
      bloc: cubit,
      builder: (context, state) => BaseLoaderBuilder(
        hasLoading: _isLoading || state.isButtonLoading,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    child: Html(
                      data: _htmlContent,
                      style: {
                        "body": Style(
                          fontSize: FontSize(16),
                          lineHeight: const LineHeight(1.5),
                        ),
                        "h1": Style(
                          fontSize: FontSize(24),
                          fontWeight: FontWeight.bold,
                          margin: Margins.only(bottom: 16),
                        ),
                        "h2": Style(
                          fontSize: FontSize(20),
                          fontWeight: FontWeight.bold,
                          margin: Margins.only(bottom: 12),
                        ),
                        "p": Style(
                          margin: Margins.only(bottom: 12),
                        ),
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: _isButtonVisible,
                  child: Container(
                    padding: const EdgeInsets.only(right: 16, left: 16, bottom: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isButtonVisible
                            ? () {
                                Navigator.of(context).pop();

                                // ScaffoldMessenger.of(context).showSnackBar(
                                //
                                //    SnackBar(
                                //        backgroundColor: Colors.black,
                                //        content: Text( context.translations.acquainted, style: TextStyle(color: Colors.white),)),
                                // );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          context.translations.acquainted,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
            Visibility(
              visible: !_isButtonVisible&&!_isLoading,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Opacity(
                    opacity: 0.7,
                    child: InkWell(
                      onTap: (){
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent+30,
                          duration:const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                        );

                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(16, 10, 16, 30),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            context.translations.scrollDown,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
      listener: (BuildContext context, PaymentDetailState state) {},
    );
  }
}
