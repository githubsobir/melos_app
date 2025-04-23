import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile/check/check_cubit.dart';

class CheckScreen extends StatelessWidget {
  CheckScreen({super.key});

  final cubit = CheckCubit(inject())..checkInvoice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      appBar: AppBar(
        title: const Text("Счет"),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          cubit.checkInvoice();
          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: BlocBuilder<CheckCubit, CheckState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is CheckInfoState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Card(
                        elevation: 0,
                        // color: const Color(0xff3563E9),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16,
                            bottom: 16,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                PathImages.walletIcon,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.brightness ==
                                          Brightness.light
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Jami hisoblangan",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        // color: Colors.white,
                                        ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                child: Text(
                                  "${state.info.total} ${context.translations.sum}",
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        // color: Colors.white,
                                        fontSize: 14,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                // side: BorderSide(
                                //     color:
                                //         Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(
                                  12.0,
                                ), // Adjust radius as needed
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    right: 12,
                                    top: 12,
                                    bottom: 12,
                                  ),
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "Jarayonda",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 10,
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "${state.info.totalsByStatus?.pending} ${context.translations.sum}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10,
                                            ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Adjust radius as needed
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    right: 12,
                                    top: 12,
                                    bottom: 12,
                                  ),
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "Hamyonda",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 10,
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "${state.info.totalsByStatus?.approved} ${context.translations.sum}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10,
                                            ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Adjust radius as needed
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                  top: 12,
                                  bottom: 12,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Qabul qilingan",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 10,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "${state.info.totalsByStatus?.rejected} ${context.translations.sum}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 10,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        itemCount: (state.info.invoices ?? []).length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = (state.info.invoices ?? [])[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                            ),
                            child: Card(
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            "${item.amount} ${context.translations.sum}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                  // color: const Color(0xff5164BF),
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "${item.createdAt}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: item.status == "pending" || item.status == "approved",
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          PathImages.applyIcon,
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: item.status == "rejected" || item.status == "pending",
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          PathImages.cancelIcon,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is LoaderState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: const SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
