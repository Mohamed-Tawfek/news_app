import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_cubit.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:news_app/shared/network/local/cash_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import 'bloc/bloc_observer.dart';
import 'modules/splash_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await CashHelper.init();
      NewsCubit.isDark = CashHelper.getData(key: 'isDark') ?? false;
      NewsCubit.onBoarding = CashHelper.getData(key: 'onBoarding') ?? false;
      DioHelper.init();
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News',
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                    color: Colors.white,
                    elevation: 0.0,
                    titleTextStyle:
                        TextStyle(color: Colors.black, fontSize: 25),
                    actionsIconTheme: IconThemeData(color: Colors.black)),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    selectedItemColor: Colors.deepOrange)),
            darkTheme: ThemeData(
                appBarTheme: const AppBarTheme(
                  color: Color(0xFF15202B),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
                ),
                scaffoldBackgroundColor: const Color(0xFF15202B),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Color(0xFF15202B),
                    unselectedItemColor: Colors.white)),
            themeMode:
                NewsCubit.isDark == true ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
                textDirection: TextDirection.rtl, child: SplashScreen()),
          );
        },
      ),
    );
  }
}
