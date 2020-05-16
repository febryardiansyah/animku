import 'dart:async';

import 'package:animku/components/youtube_webview.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:animku/models/search_model_results.dart';
import 'package:animku/repository/detail_by_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SecondDetail extends StatefulWidget {
  final malId;

  const SecondDetail({Key key, this.malId}) : super(key: key);

  @override
  _SecondDetailState createState() => _SecondDetailState();
}

class _SecondDetailState extends State<SecondDetail> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DetailByIdProvider>(context, listen: false)
        .getDetailById(widget.malId);
  }
  _launchUrl(url)async{
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }
  Widget alertDialogItems({name,value}){
    return RichText(
      text: TextSpan(
        text: name,style: TextStyle(color: BaseColor.grey),
        children: [
          TextSpan(text: ' :\t ${value == null?' ':value}',style: TextStyle(color: BaseColor.baseColor))
        ]
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        margin: EdgeInsets.all(8),
        child: Consumer<DetailByIdProvider>(
          builder: (context,data,_)=>
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  showDialog(context: (context),
                  builder: (BuildContext context){
                    String studios;
                    data.searchListDetail.studio.forEach((res){
                      studios = res.name;
                    });
                    return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        title: Text('Information',style: TextStyle(color: BaseColor.baseColor,
                        fontFamily: MyFonts.baloo,fontSize: 30),),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              alertDialogItems(name: 'Type',value: data.searchListDetail.type.toString()),
                              alertDialogItems(name: 'Episodes',value: data.searchListDetail.episodes.toString()),
                              alertDialogItems(name: 'Status',value: data.searchListDetail.status),
                              alertDialogItems(name: 'Studios',value: studios),
                              alertDialogItems(name: 'Source',value: data.searchListDetail.source),
                              alertDialogItems(name: 'Duration',value: data.searchListDetail.duration),
                              alertDialogItems(name: 'Opening Theme',value: data.searchListDetail.opening_themes),
                              alertDialogItems(name: 'Ending Theme',value: data.searchListDetail.ending_themes)
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          RaisedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                              color: BaseColor.baseColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text('Close',style: TextStyle(color: BaseColor.white),)
                          )
                        ],
                      );
                  });
                },
                child: Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 700.w,
                      color: BaseColor.baseColor,
                      child: Center(child: Text('Information',style: TextStyle(fontFamily: MyFonts.baloo,
                      fontSize: 30,color: BaseColor.white),),),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
//                  _launchUrl(data.searchListDetail.trailer_url);
                  print(data.searchListDetail.trailer_url);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => YoutubeWebView(url: data.searchListDetail.trailer_url,)));
                },
                child: Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 200.w,
                        color: BaseColor.baseColor,
                        child: Center(child: Icon(Icons.play_circle_filled,color: BaseColor.white,),),
                      ),
                    ),
                  ),

              )
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<DetailByIdProvider>(context, listen: false)
            .getDetailById(widget.malId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading...'),
            );
          }
          return Consumer<DetailByIdProvider>(
            builder: (context, data, _) {
              return Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1200.h,
                    decoration: BoxDecoration(
                      color: BaseColor.baseColor,
                      image: DecorationImage(
                          image: NetworkImage(data.searchListDetail.imageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                  backButton(),
                  _whitelayer(),
                  ImagePic(imageUrl: data.searchListDetail.imageUrl),
                  title(title: data.searchListDetail.title),
                  _genre(genre: data.searchListDetail),
                ],
              );
            },
          );
        },
      ),

    );
  }
  Widget backButton() {
    ScreenUtil.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
      child: RaisedButton(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Icon(
          Icons.arrow_back_ios,
          color: BaseColor.white,
        ),
        color: BaseColor.baseColor,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
  Widget _whitelayer() {
    ScreenUtil.init(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 1200.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: BaseColor.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(-10, -10),
                  blurRadius: 8),
            ]),
      ),
    );
  }
  Widget ImagePic({imageUrl}) {
    ScreenUtil.init(context);
    return Positioned(
      left: 70.w,
      top: 380.h,
      child: Container(
        height: 180,
        width: 140,
        decoration: BoxDecoration(
          color: BaseColor.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: Offset(10, 10), color: Colors.black26, blurRadius: 8),
            BoxShadow(
                offset: Offset(-10, -10), color: Colors.black26, blurRadius: 8)
          ],
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }
  Widget title({title}) {
    ScreenUtil.init(context);
    return Positioned(
      top: 550.h,
      left: 470.w,
      child: Container(
        height: 100,
        width: 210,
        child: Center(
          child: Text(
            title==null?'':title,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: MyFonts.baloo,
                fontSize: title.length >= 20 ? 20 : 30),
          ),
        ),
      ),
    );
  }
  Widget _genre({SearchList genre}) {
    ScreenUtil.init(context);
    return Padding(
      padding: EdgeInsets.only(top:900.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100.h,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: genre.genreList.length,
                  itemBuilder: (context, i) {
                    colorgen() {
                      switch (genre.genreList[i].name) {
                        case 'Adventure':
                          return BaseColor.genreColorList[0];
                          break;
                        case 'Comedy':
                          return BaseColor.genreColorList[1];
                          break;
                        case 'Action':
                          return BaseColor.genreColorList[2];
                          break;
                        case 'Mystery':
                          return BaseColor.genreColorList[3];
                          break;
                        case 'Echi':
                          return BaseColor.genreColorList[4];
                          break;
                        case 'Fantasy':
                          return BaseColor.genreColorList[5];
                          break;
                        case 'Drama':
                          return BaseColor.genreColorList[6];
                          break;
                        case 'Horor':
                          return BaseColor.genreColorList[7];
                          break;
                        case 'School':
                          return BaseColor.genreColorList[8];
                          break;
                        case 'Sci Fi':
                          return BaseColor.genreColorList[1];
                          break;
                        case 'Shounen':
                          return BaseColor.genreColorList[2];
                          break;
                        case 'Super Power':
                          return BaseColor.genreColorList[3];
                          break;
                        case 'Harem':
                          return BaseColor.genreColorList[4];
                          break;
                        case 'Supernatural':
                          return BaseColor.genreColorList[5];
                          break;
                        case 'Psychological':
                          return BaseColor.genreColorList[6];
                          break;
                        case 'Romance':
                          return BaseColor.genreColorList[7];
                          break;
                        default:
                          return BaseColor.baseColor;
                      }
                    }
                    return Card(
                      color: colorgen(),
                      child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          child: Text(
                            genre.genreList[i].name ==null?'':genre.genreList[i].name+ ' ',
                            style: TextStyle(
                                color: BaseColor.white,
                                fontFamily: MyFonts.baloo),
                          )),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            _boxScore(genre),
            SizedBox(
              height: 40.h,
            ),
            _synopsis(genre.synopsis)
          ],
        ),
      ),
    );
  }
  Widget _boxScore(SearchList searchList){
    var formatNumber = NumberFormat.compactCurrency(decimalDigits: 2,symbol: '');
    ScreenUtil.init(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: BaseColor.baseColor,
      elevation: 8,
      child: Container(
        height: 350.h,
        width: 1000.w,
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(searchList.score.toString() == null?'':searchList.score.toString(),style: TextStyle(
                  fontSize: 40,fontFamily: MyFonts.baloo,color: BaseColor.white
                ),),
                Text('Score',style: TextStyle(
                  color: BaseColor.orange,fontFamily: MyFonts.baloo,fontSize: 20
                ),),
              ],
            ),
            Container(
              width: 3,
              height: 100,
              color: Color(0xff818181),
            ),
            _rankPopuMembers(
              name: 'Rank',
              item: searchList.rank == null?' ':'${formatNumber.format(searchList.rank)}'
            ),
            _rankPopuMembers(
              name: 'Popularity',
              item: searchList.popularity == null? ' ': '${formatNumber.format(searchList.popularity)}'
            ),
            _rankPopuMembers(
              name: 'Members',
              item: formatNumber.format(searchList.members)
            )
          ],
        ),
      ),
    );
  }
  Widget _rankPopuMembers({item,name}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(item.toString()==null?'':item.toString(),style: TextStyle(
          fontSize: 35,fontFamily: MyFonts.baloo,color: BaseColor.white
        ),),
        Text(name,style: TextStyle(
          color: BaseColor.orange,fontFamily: MyFonts.baloo,fontSize: 20
        ),)
      ],
    );
  }
  Widget _synopsis(item){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Synopsis',style: TextStyle(color: BaseColor.orange,fontFamily: MyFonts.baloo,
          fontSize: 20),),
          Text(item==null?'':item,textAlign: TextAlign.justify,)
        ],
      ),
    );
  }
}
