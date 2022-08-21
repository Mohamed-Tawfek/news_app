import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/shared/component/constans.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import '../shared/network/local/cash_helper.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeCategoryInBottomNavigationBar({required int index}) {
    currentIndex = index;
    emit(ChangeBottomNavigationBarState());
  }

  NewsModel? business;
  NewsModel? science;
  NewsModel? sport;
  NewsModel? search;
  static bool isDark = false;
  static bool? onBoarding;
  Future getBusinessData() async {
    emit(GetBusinessDataLoadingState());
    await DioHelper.get(url: url, queryParameters: {
      'country': countryEndPoint,
      'category': businessEndPoint,
      'apiKey': apiKey
    }).then((value) {
      business = NewsModel.fromJson(value.data);
      emit(GetBusinessDataSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        print('Error when getBusinessData is ${onError.toString()} ');
      }
      emit(GetBusinessDataErrorState());
    });
  }

  Future getScienceData() async {
    emit(GetScienceDataLoadingState());
    await DioHelper.get(url: url, queryParameters: {
      'country': countryEndPoint,
      'category': scienceEndPoint,
      'apiKey': apiKey
    }).then((value) {
      science = NewsModel.fromJson(value.data);
      emit(GetScienceDataSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        print('Error when ScienceData is ${onError.toString()} ');
      }
      emit(GetScienceDataErrorState());
    });
  }

  Future getSportData() async {
    emit(GetSportDataLoadingState());
    await DioHelper.get(url: url, queryParameters: {
      'country': countryEndPoint,
      'category': sportEndPoint,
      'apiKey': apiKey
    }).then((value) {
      sport = NewsModel.fromJson(value.data);
      emit(GetSportDataSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        print('Error when getSportData is ${onError.toString()} ');
      }
      emit(GetSportDataErrorState());
    });
  }

  Future getSearchData({required String searchKeyword}) async {
    search = null;
    emit(GetSearchDataLoadingState());
    await DioHelper.get(url: url, queryParameters: {
      'country': countryEndPoint,
      'q': searchKeyword,
      'apiKey': apiKey
    }).then((value) {
      search = NewsModel.fromJson(value.data);
      emit(GetSearchDataSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        print('Error when getBusinessData is ${onError.toString()} ');
      }
      emit(GetSearchDataErrorState());
    });
  }

  Future changeAppMode() async {
    NewsCubit.isDark = !NewsCubit.isDark;
    await CashHelper.setData(key: 'isDark', value: NewsCubit.isDark)
        .then((value) {
      emit(ChangeAppMode());
    });
  }
}
