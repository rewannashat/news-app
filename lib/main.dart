import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/local/sharedPref.dart';

import 'Network/dio_helper.dart';
import 'cubit/cubit.dart';
import 'layout/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await SharedPref.init();
  bool? isFormate = SharedPref.getBoolean('isDark');
  runApp(MyApp(isFormate!));

}

class MyApp extends StatelessWidget {
final bool formator ;
MyApp(this.formator);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..changeTheme(formator: formator)..getBusinessData()..getSportsData()..getSinceData()..getSearchData(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                )),
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  //Color(0xff558daa)
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  titleTextStyle: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                      //  fontSize:  media.size.height * 0.03,
                      ),
                  iconTheme: IconThemeData(color: Colors.black),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Color(0xff3BADC4),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Color(0xff3BADC4),
                )),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: HexColor('333739'),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                )),
                appBarTheme: AppBarTheme(
                  backgroundColor: HexColor('333739'),
                  //Color(0xff558daa)
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light),
                  titleTextStyle: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                      //  fontSize:  media.size.height * 0.03,
                      ),
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Color(0xff3BADC4),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Color(0xff3BADC4),
                )),
            themeMode: NewsCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
            home: Home(),
          );
        },
      ),
    );
  }
}
