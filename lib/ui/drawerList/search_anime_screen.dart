import 'package:animku/components/build_loading.dart';
import 'package:animku/components/my_app_bar.dart';
import 'package:animku/components/my_drawer.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:animku/models/search_model_results.dart';
import 'package:animku/repository/detail_by_id.dart';
import 'package:animku/repository/search_anime_repo.dart';
import 'package:animku/ui/detailscreen/second_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchAnimeScreen extends StatefulWidget {
  @override
  _SearchAnimeScreenState createState() => _SearchAnimeScreenState();
}

class _SearchAnimeScreenState extends State<SearchAnimeScreen> {
  TextEditingController textCtrl = TextEditingController();
  var res;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BaseColor.baseColor,
        elevation: 0,
        title: TextField(
          controller: textCtrl,
          style: TextStyle(color: BaseColor.white),
          decoration: InputDecoration(
            hintText: 'Search Anime...',
            hintStyle: TextStyle(color: BaseColor.white),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: (){
              print(textCtrl.text);
              Provider.of<SearchAnimeProvider>(context,listen: false).getSearchAnime(textCtrl.text).then((f){
                res = f;
                if(!res){
                  isLoading = true;
                }else{
                  isLoading = false;
                }
              });
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
        ],
      ),
      body: Consumer<SearchAnimeProvider>(
        builder: (context, data, _) {
          return ListView.builder(
            itemCount: data.listSearch.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondDetail(
                    malId:data.listSearch[i].malId,
                  )));
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: Container(
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(
                                    data.listSearch[i].imageUrl),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: const EdgeInsets.all(8.0),
                          width: 300,
                          child: Text(data.listSearch[i].title,
                            style: TextStyle(
                                fontFamily: MyFonts.baloo, fontSize: 20),),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      )
    );
  }
}
