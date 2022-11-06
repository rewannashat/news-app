
abstract class NewsStates {}

class InitialState extends NewsStates {}
class AppChangeBottomNavState extends NewsStates {}

class Loading extends NewsStates {}

class GetBusinessDataSucess extends NewsStates {}

class GetBusinessDataError extends NewsStates {
  final String error ;

  GetBusinessDataError(this.error);

}


class LoadingSports extends NewsStates {}

class GetSportsDataSucess extends NewsStates {}

class GetSportsDataError extends NewsStates {
  final String error ;

  GetSportsDataError(this.error);

}

class LoadingSince extends NewsStates {}

class GetSinceDataSucess extends NewsStates {}

class GetSinceDataError extends NewsStates {
  final String error ;

  GetSinceDataError(this.error);

}

class AppChangeTheme extends NewsStates {}
class LoadingSearch extends NewsStates {}

class GetSearchDataSucess extends NewsStates {}

class GetSearchDataError extends NewsStates {
  final String error ;

  GetSearchDataError(this.error);

}