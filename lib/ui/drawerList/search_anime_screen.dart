import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:animku/models/search_model_results.dart';
import 'package:animku/repository/search_anime_repo.dart';
import 'package:animku/ui/detailscreen/second_detail.dart';

class SearchAnimeScreen extends StatefulWidget {
  @override
  _SearchAnimeScreenState createState() => _SearchAnimeScreenState();
}

class _SearchAnimeScreenState extends State<SearchAnimeScreen> {
  TextEditingController textCtrl = TextEditingController();
  bool isLoading = false;
  List<SearchModelResult> temp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BaseColor.baseColor,
        elevation: 0,
        title: TextField(
          controller: textCtrl,
          style: TextStyle(color: BaseColor.white),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
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
            icon: Icon(Icons.search),
            onPressed: () {
              if (!isLoading) {
                setState(
                  () {
                    isLoading = true;
                  },
                );
              }
              Provider.of<SearchAnimeProvider>(context, listen: false)
                  .getSearchAnime(textCtrl.text)
                  .then(
                (resultList) {
                  setState(
                    () {
                      temp = resultList;
                      isLoading = false;
                    },
                  );
                },
              );
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
        ],
      ),
      body: isLoading == true
          ? LinearProgressIndicator(
              backgroundColor: BaseColor.purpleToBlue,
            )
          : Consumer<SearchAnimeProvider>(
              builder: (context, data, _) {
                return ListView.builder(
                  itemCount: data.listSearch.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondDetail(
                              malId: data.listSearch[i].malId,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
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
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(8.0),
                                width: 300,
                                child: Text(
                                  data.listSearch[i].title.length <= 25
                                      ? data.listSearch[i].title
                                      : '${data.listSearch[i].title.substring(0, 25)}..',
                                  style: TextStyle(
                                    fontFamily: MyFonts.baloo,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
