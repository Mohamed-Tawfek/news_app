import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_cubit.dart';

import '../bloc/news_state.dart';
import '../shared/component/component.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsCubit.get(context).getSportData();
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: NewsCubit.get(context).sport != null,
            builder: (context) {
              return buildUiScreen(
                model: NewsCubit.get(context).sport,
              );
            },
            fallback: (context) {
              return const Center(child: CircularProgressIndicator());
            });
      },
    );
  }
}
