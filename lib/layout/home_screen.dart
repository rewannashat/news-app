import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Network/dio_helper.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../module/search_Screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => {},
      builder: (BuildContext context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          //key: scaffoldKey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              cubit.title[cubit.pages],
              style: TextStyle(
                fontSize: media.size.height * 0.03,
              ),
            ),
            actions: [
              IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
              }, icon: Icon(Icons.search)),
              IconButton(onPressed: () {
                NewsCubit.get(context).changeTheme();
              }, icon: Icon(Icons.brightness_4_outlined)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 30,
            currentIndex: cubit.pages,
            onTap: (v) {
              cubit.botoomChange(v);
            },
            items: cubit.bottom,
          ),
          body: cubit.Screens[cubit.pages],
        );
      },
    );
  }
}
