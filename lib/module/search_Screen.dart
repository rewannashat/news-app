import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';

import '../cubit/states.dart';
import '../style/custom_text_field.dart';
import '../style/defaultFromField.dart';
import '../widget/businessWidget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController text = TextEditingController();
    MediaQueryData media = MediaQuery.of(context);
    NewsCubit cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var searchData = cubit.search["articles"] ;
        return SafeArea(
            child: Scaffold(
              appBar: AppBar(),
              body: Container(
                child: Column(
                  children: [
                    defaultFromField(
                      typeInput: TextInputType.text,
                      validate: (String v) {
                        if (v.isEmpty){
                          return 'The Search is not be empty';
                        }
                        return null;
                      },

                      controller: text,
                      prefIcon: Icons.search,
                      label: 'Search',
                      hint: 'Search',
                      onChange: (val) {
                        cubit.getSearchData(v: val);
                      } ,

                    ),


                    Expanded(
                      child: ConditionalBuilder(
                        condition: cubit.search.length>0,
                        fallback: (context) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        builder:(context) {
                          return ListView.separated(
                            itemCount:cubit.search.length ,
                            itemBuilder: (context,index) {
                              return Business(
                                w: media.size.width * 0.3,
                                h: media.size.height * 0.1,
                                ctx: context,
                                artical: searchData[index]  ,
                              );
                            },
                            separatorBuilder: (context, index) => Container(
                              width: double.infinity,
                              height: 1.0,
                              color: Colors.grey,
                              margin: EdgeInsets.all(15),
                            ),
                            physics: BouncingScrollPhysics(),

                          );
                        }
                      ),
                    ),

                  ],
                ),
              ),
            ));
      },
    );
  }
}
