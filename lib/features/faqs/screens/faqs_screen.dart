import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/features/faqs/logic/faqs_cubit/faqs_cubit.dart';
import 'package:ecommerce/features/faqs/logic/faqs_cubit/faqs_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqsCubit, FaqsState>(
      bloc: getIt<FaqsCubit>()..getFaqs(),
      builder: (context, state) {
        // var cubit = FaqsCubit.get(context);
        return getIt<FaqsCubit>().faqsModel == null
            ? const SizedBox()
            : ExpansionTile(
                title: const Text("Most Popular questions"),
                children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: getIt<FaqsCubit>().faqsModel?.data?.faqsAnswerItem?.length,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            title: Text(getIt<FaqsCubit>().faqsModel?.data?.faqsAnswerItem?[index].question ?? ""),
                            children: [
                              ListTile(
                                title: Text(getIt<FaqsCubit>().faqsModel?.data?.faqsAnswerItem?[index].answer ?? ""),
                              )
                            ],
                          );
                        }),
                  ]);
      },
    );
  }
}
