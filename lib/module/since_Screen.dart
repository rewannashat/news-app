import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widget/businessWidget.dart';
class SinceScreen extends StatefulWidget {
  const SinceScreen({Key? key}) : super(key: key);

  @override
  _SinceScreenState createState() => _SinceScreenState();
}

class _SinceScreenState extends State<SinceScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    NewsCubit cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) => {},
      builder: (BuildContext context, state) {
        var scienceData = cubit.since["articles"];
        return ConditionalBuilder(
          condition:cubit.since.length > 0,
          fallback: (context) =>
              Center(
                child: CircularProgressIndicator(),
              ),
          builder: (context) {
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    Business(
                        w: media.size.width * 0.3,
                        h: media.size.height * 0.1,
                        ctx: context,
                        artical: scienceData[index]),
                separatorBuilder: (context, index) =>
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      color: Colors.grey,
                      margin: EdgeInsets.all(15),
                    ),
                itemCount: cubit.since.length);
          },
        );
      },
    );
  }
}