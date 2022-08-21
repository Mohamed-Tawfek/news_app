import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_cubit.dart';

import '../bloc/news_state.dart';
import '../shared/component/component.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsCubit.get(context).getScienceData();
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: NewsCubit.get(context).science != null,
            builder: (context) {
              return buildUiScreen(
                model: NewsCubit.get(context).science,
              );
            },
            fallback: (context) {
              return const Center(child: CircularProgressIndicator());
            });
      },
    );
  }
}
