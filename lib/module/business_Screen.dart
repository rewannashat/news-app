import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';

import '../cubit/cubit.dart';
import '../style/custom_text.dart';
import '../widget/businessWidget.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  _BusinessScreenState createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    NewsCubit cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) => {},
      builder: (BuildContext context, state) {
        var businessData = cubit.business["articles"];
        return ConditionalBuilder(
          condition: state is! Loading,
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
          builder: (context) {
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => Business(
                    w: media.size.width * 0.3,
                    h: media.size.height * 0.1,
                    ctx: context,
                    artical: businessData[index]),
                separatorBuilder: (context, index) => Container(
                      width: double.infinity,
                      height: 1.0,
                      color: Colors.grey,
                      margin: EdgeInsets.all(15),
                    ),
                itemCount: cubit.business.length);
          },
        );
      },
    );
  }
}
