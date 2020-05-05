import 'package:animku/bloc/seasonLaterBloc/season_later_bloc.dart';
import 'package:animku/components/build_error.dart';
import 'package:animku/components/build_loading.dart';
import 'package:animku/components/my_app_bar.dart';
import 'package:animku/components/my_grid.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/repository/season_later_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeasonLaterScreen extends StatefulWidget {
  @override
  _SeasonLaterScreenState createState() => _SeasonLaterScreenState();
}

class _SeasonLaterScreenState extends State<SeasonLaterScreen> {
  SeasonLaterBloc seasonLaterBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seasonLaterBloc = BlocProvider.of<SeasonLaterBloc>(context);
    seasonLaterBloc.add(FetchSeasonLaterEvent());
  }
  bool cleartext = false;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MySecondAppBar(
      onRefresh: (){
        seasonLaterBloc = BlocProvider.of<SeasonLaterBloc>(context);
        seasonLaterBloc.add(FetchSeasonLaterEvent());
      },
      body: Container(
        child: BlocBuilder<SeasonLaterBloc,SeasonLaterState>(
          builder: (context,state){
           if(state is SeasonLaterInitialState){
             return BuildLoading();
           } else if(state is SeasonLaterLoadedState){
             return MyGrid(
               animeList: state.animeList,
               judul: Dictionary.seasonLater,
               searchBar: Center(
                 child: Container(
                   padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                   height: 70,
                   child: TextField(
                     controller: textEditingController,
                     onChanged: (s){
                       if(textEditingController.text.isEmpty){
                         setState(() {
                           cleartext = false;
                         });
                       }else if(textEditingController.text.isNotEmpty){
                         setState(() {
                           cleartext = true;
                         });
                       }
                     },
                     decoration: InputDecoration(
                       filled: true,
                       fillColor: BaseColor.white,
                       hintText: 'Search Anime',
                       prefixIcon: Icon(Icons.search),
                       suffixIcon: cleartext?IconButton(
                         color: BaseColor.baseColor,
                         icon: Icon(Icons.clear),
                         onPressed: (){
                           textEditingController.clear();
                         },
                       ):null,
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20)
                       ),
                     ),
                   ),
                 ),
               )
             );
           }else if(state is SeasonLaterErrorState){
             return BuildError(errorMsg: state.message,);
           }
           return null;
          }
        ),
      ),
    );
  }
}
