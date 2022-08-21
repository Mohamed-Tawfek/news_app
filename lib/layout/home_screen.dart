import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_cubit.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/search_screen.dart';
import 'package:news_app/modules/sport_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../bloc/news_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      BusinessScreen(),
      ScienceScreen(),
      SportScreen(),
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'اخبار',
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: SearchScreen()));
                    },
                    icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () async {
                      await NewsCubit.get(context).changeAppMode();
                    },
                    icon: Icon(NewsCubit.isDark == true
                        ? Icons.sunny
                        : Icons.nightlight_sharp))
              ],
            ),
            body: screens[NewsCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: NewsCubit.get(context).currentIndex,
              onTap: (int index) {
                NewsCubit.get(context)
                    .changeCategoryInBottomNavigationBar(index: index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: 'اعمال'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), label: 'علوم'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: 'رياضة'),
              ],
            ),
          );
        },
      ),
    );
  }
}
