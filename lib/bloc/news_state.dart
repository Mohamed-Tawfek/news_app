abstract class NewsState {}

class NewsInitial extends NewsState {}
class ChangeAppMode extends NewsState {}
class ChangeBottomNavigationBarState extends NewsState {}

class GetBusinessDataSuccessState extends NewsState {}

class GetBusinessDataLoadingState extends NewsState {}

class GetBusinessDataErrorState extends NewsState {}

class GetSportDataSuccessState extends NewsState {}

class GetSportDataLoadingState extends NewsState {}

class GetSportDataErrorState extends NewsState {}

class GetScienceDataSuccessState extends NewsState {}

class GetScienceDataLoadingState extends NewsState {}

class GetScienceDataErrorState extends NewsState {}

class GetSearchDataSuccessState extends NewsState {}

class GetSearchDataLoadingState extends NewsState {}

class GetSearchDataErrorState extends NewsState {}
