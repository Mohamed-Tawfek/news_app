import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_cubit.dart';

import '../bloc/news_state.dart';
import '../shared/component/component.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsCubit.get(context).getBusinessData();
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: NewsCubit.get(context).business != null,
            builder: (context) {
              return buildUiScreen(
                model: NewsCubit.get(context).business,
              );
            },
            fallback: (context) {
              return const Center(child: CircularProgressIndicator());
            });
      },
    );
  }
}
