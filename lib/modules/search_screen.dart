import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_cubit.dart';
import 'package:news_app/bloc/news_state.dart';

import '../shared/component/component.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color:
                        NewsCubit.isDark == true ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: const Text('بحث'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                          color: NewsCubit.isDark == true
                              ? Colors.white
                              : Colors.black),
                      cursorColor: Colors.white,
                      controller: controller,
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          hintText: 'اكتب هنا للبحث',
                          hintStyle: TextStyle(
                            color: NewsCubit.isDark == true
                                ? Colors.white
                                : Colors.black,
                          )),
                      onChanged: (data) {
                        NewsCubit.get(context)
                            .getSearchData(searchKeyword: data);
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (NewsCubit.get(context).search != null)
                      Expanded(
                          child: buildUiScreen(
                              model: NewsCubit.get(context).search)),
                    if (NewsCubit.get(context).search == null &&
                        controller.text.isEmpty)
                      Expanded(
                        child: Center(
                          child: Text(
                            'اكتب شئ للبحث عنه !',
                            style: TextStyle(
                                color: NewsCubit.isDark == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    if (NewsCubit.get(context).search != null &&
                        controller.text.isNotEmpty &&
                        state is! GetSearchDataLoadingState)
                      if (NewsCubit.get(context).search!.news.isEmpty)
                        Expanded(
                          child: Center(
                            child: Text(
                              'لا توجد نتائج !',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  color: NewsCubit.isDark == true
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
