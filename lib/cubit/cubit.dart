
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';

import '../Network/dio_helper.dart';
import '../module/business_Screen.dart';
import '../module/setting_Screen.dart';
import '../module/since_Screen.dart';
import '../module/sport_Screen.dart';
import '../shared/local/sharedPref.dart';

class NewsCubit extends Cubit <NewsStates> {
    NewsCubit() : super(InitialState());
    static NewsCubit get (context) => BlocProvider.of(context);

    List <Widget> Screens = [
        BusinessScreen () ,
        SportScreen () ,
        SinceScreen () ,
      //  SettingScreen ()
    ] ;
    List <BottomNavigationBarItem> bottom = [
        BottomNavigationBarItem(icon: Icon(Icons.business) , label: 'Business') ,
        BottomNavigationBarItem(icon: Icon(Icons.sports) , label: 'Sport') ,
        BottomNavigationBarItem(icon: Icon(Icons.opacity) , label: 'Science') ,
      //  BottomNavigationBarItem(icon: Icon(Icons.settings) , label: 'Setting') ,
    ] ;
    List <String> title = [
        'Business' , ' Sport', 'Science' ,
    ] ;
    int pages = 0 ;
     void botoomChange (int num ) {
         pages = num ;
         // if (pages == 0) getBusinessData () ;
         // if (pages == 1 ) getSportsData() ;
         // if (pages == 2) getSinceData ();
         emit(AppChangeBottomNavState());
     }

    Map<String , dynamic> business = {};
     void getBusinessData () async {
          emit(Loading());
         DioHelper.getData(
             url: 'v2/top-headlines',
             query: {
                 'country' : 'us' ,
                 'category' : 'business',
                 'apiKey' : 'be4687266a9b430b94ed17bbad466127',
             }
         ).then((value) async {
             business = value?.data;
             emit(GetBusinessDataSucess());
         }).catchError((error){
           emit(GetBusinessDataError(error.toString()));
           print(error.toString());
         });

     }

    Map<String , dynamic> sports = {};
    void getSportsData () async {
      emit(LoadingSports());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country' : 'us' ,
            'category' : 'sports',
            'apiKey' : 'be4687266a9b430b94ed17bbad466127',
          }
      ).then((value) async {
        sports = value?.data;
        emit(GetSportsDataSucess());
      }).catchError((error){
        emit(GetSportsDataError(error.toString()));
        print(error.toString());
      });

    }

    Map<String , dynamic> since = {};
    void getSinceData () async {
      emit(LoadingSince());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country' : 'us' ,
            'category' : 'science',
            'apiKey' : 'be4687266a9b430b94ed17bbad466127',
          }
      ).then((value) async {
        since = value?.data;
        emit(GetSinceDataSucess());
      }).catchError((error){
        emit(GetSinceDataError(error.toString()));
        print(error.toString());
      });

    }

    bool isDark = false ;
    void changeTheme({bool? formator}) {
      if (formator != null) {
         isDark = formator ;
        emit(AppChangeTheme());
      } else if (formator == null) {
        isDark = !isDark ;
        SharedPref.putBoolean('isDark' , isDark);
        emit(AppChangeTheme());
      }

    }

    Map<String , dynamic> search = {};
    void getSearchData ({String? v}) async {
      emit(LoadingSearch());
      DioHelper.getData(
          url: 'v2/everything',
          query: {
            'q' : '$v',
            'apiKey' : 'be4687266a9b430b94ed17bbad466127',
          }
      ).then((value) async {
        search = value?.data;
        emit(GetSearchDataSucess());
      }).catchError((error){
        emit(GetSearchDataError(error.toString()));
        print(error.toString());
      });

    }

}