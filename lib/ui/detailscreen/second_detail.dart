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

class SecondDetail extends StatefulWidget {
  final int malId;

  const SecondDetail({Key key, this.malId}) : super(key: key);

  @override
  _SecondDetailState createState() => _SecondDetailState();
}

class _SecondDetailState extends State<SecondDetail> {
  @override
  void initState() {
    super.initState();
    Provider.of<DetailByIdProvider>(context, listen: false)
        .getDetailById(widget.malId);
  }

  Widget alertDialogItems({String name, dynamic value}) {
    return RichText(
      text: TextSpan(
        text: name,
        style: TextStyle(color: BaseColor.grey),
        children: [
          TextSpan(
            text: ' :\t ${value ?? ' '}',
            style: TextStyle(
              color: BaseColor.baseColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        margin: const EdgeInsets.all(8),
        child: Consumer<DetailByIdProvider>(
          builder: (context, data, _) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String studios;
                      data.searchListDetail.studio.forEach((res) {
                        studios = res.name;
                      });
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        title: Text(
                          'Information',
                          style: TextStyle(
                            color: BaseColor.baseColor,
                            fontFamily: MyFonts.baloo,
                            fontSize: 30,
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              alertDialogItems(
                                name: 'Type',
                                value: data.searchListDetail.type.toString(),
                              ),
                              alertDialogItems(
                                name: 'Episodes',
                                value:
                                    data.searchListDetail.episodes.toString(),
                              ),
                              alertDialogItems(
                                name: 'Status',
                                value: data.searchListDetail.status,
                              ),
                              alertDialogItems(
                                name: 'Studios',
                                value: studios,
                              ),
                              alertDialogItems(
                                name: 'Source',
                                value: data.searchListDetail.source,
                              ),
                              alertDialogItems(
                                name: 'Duration',
                                value: data.searchListDetail.duration,
                              ),
                              alertDialogItems(
                                name: 'Opening Theme',
                                value: data.searchListDetail.openingThemes,
                              ),
                              alertDialogItems(
                                name: 'Ending Theme',
                                value: data.searchListDetail.endingThemes,
                              )
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: BaseColor.baseColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Close',
                              style: TextStyle(color: BaseColor.white),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
                child: Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 700.w as double,
                      color: BaseColor.baseColor,
                      child: Center(
                        child: Text(
                          'Information',
                          style: TextStyle(
                            fontFamily: MyFonts.baloo,
                            fontSize: 30,
                            color: BaseColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (data.searchListDetail?.trailerUrl != null)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YoutubeWebView(
                          url: data.searchListDetail.trailerUrl,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 200.w as double,
                        color: BaseColor.baseColor,
                        child: Center(
                          child: Icon(
                            Icons.play_circle_filled,
                            color: BaseColor.white,
                          ),
                        ),
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
            return const Center(
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
                    height: 1200.h as double,
                    decoration: BoxDecoration(
                      color: BaseColor.baseColor,
                      image: DecorationImage(
                        image: NetworkImage(data.searchListDetail.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  backButton(),
                  _whitelayer(),
                  imagePic(imageUrl: data.searchListDetail.imageUrl),
                  title(title: data.searchListDetail.title),
                  _genre(searchList: data.searchListDetail),
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
      padding: EdgeInsets.symmetric(
        horizontal: 30.w as double,
        vertical: 70.h as double,
      ),
      child: RaisedButton(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: BaseColor.baseColor,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: BaseColor.white,
        ),
      ),
    );
  }

  Widget _whitelayer() {
    ScreenUtil.init(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 1200.h as double,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          color: BaseColor.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: const Offset(-10, -10),
              blurRadius: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget imagePic({String imageUrl}) {
    ScreenUtil.init(context);
    return Positioned(
      left: 70.w as double,
      top: 380.h as double,
      child: Container(
        height: 500.h as double,
        width: 350.w as double,
        decoration: BoxDecoration(
          color: BaseColor.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: const Offset(10, 10),
              color: Colors.black26,
              blurRadius: 8,
            ),
            BoxShadow(
              offset: const Offset(-10, -10),
              color: Colors.black26,
              blurRadius: 8,
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget title({String title}) {
    ScreenUtil.init(context);
    return Positioned(
      top: 550.h as double,
      left: 470.w as double,
      child: Container(
        height: 100,
        width: 210,
        child: Center(
          child: Text(
            title ?? '',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: MyFonts.baloo,
              fontSize: title.length >= 20 ? 20 : 30,
            ),
          ),
        ),
      ),
    );
  }

  Widget _genre({SearchList searchList}) {
    ScreenUtil.init(context);
    return Padding(
      padding: EdgeInsets.only(top: 950.h as double),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100.h as double,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: searchList.genreList.length,
                  itemBuilder: (context, i) {
                    Color colorgen() {
                      switch (searchList.genreList[i].name) {
                        case 'Adventure':
                          return BaseColor.genreColorList[0] as Color;
                          break;
                        case 'Comedy':
                          return BaseColor.genreColorList[1] as Color;
                          break;
                        case 'Action':
                          return BaseColor.genreColorList[2] as Color;
                          break;
                        case 'Mystery':
                          return BaseColor.genreColorList[3] as Color;
                          break;
                        case 'Echi':
                          return BaseColor.genreColorList[4] as Color;
                          break;
                        case 'Fantasy':
                          return BaseColor.genreColorList[5] as Color;
                          break;
                        case 'Drama':
                          return BaseColor.genreColorList[6] as Color;
                          break;
                        case 'Horor':
                          return BaseColor.genreColorList[7] as Color;
                          break;
                        case 'School':
                          return BaseColor.genreColorList[8] as Color;
                          break;
                        case 'Sci Fi':
                          return BaseColor.genreColorList[1] as Color;
                          break;
                        case 'Shounen':
                          return BaseColor.genreColorList[2] as Color;
                          break;
                        case 'Super Power':
                          return BaseColor.genreColorList[3] as Color;
                          break;
                        case 'Harem':
                          return BaseColor.genreColorList[4] as Color;
                          break;
                        case 'Supernatural':
                          return BaseColor.genreColorList[5] as Color;
                          break;
                        case 'Psychological':
                          return BaseColor.genreColorList[6] as Color;
                          break;
                        case 'Romance':
                          return BaseColor.genreColorList[7] as Color;
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
                          searchList.genreList[i].name == null
                              ? ''
                              : '${searchList.genreList[i].name} ',
                          style: TextStyle(
                            color: BaseColor.white,
                            fontFamily: MyFonts.baloo,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40.h as double,
            ),
            _boxScore(searchList),
            SizedBox(
              height: 40.h as double,
            ),
            _synopsis(searchList.synopsis),
          ],
        ),
      ),
    );
  }

  Widget _boxScore(SearchList searchList) {
    final NumberFormat formatNumber =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '');
    ScreenUtil.init(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: BaseColor.baseColor,
      elevation: 8,
      child: Container(
        height: 350.h as double,
        width: 1000.w as double,
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    '${searchList.score ?? ''}',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: MyFonts.baloo,
                      color: BaseColor.white,
                    ),
                  ),
                  Text(
                    'Score',
                    style: TextStyle(
                      color: BaseColor.orange,
                      fontFamily: MyFonts.baloo,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Container(
                width: 3,
                height: 100,
                color: const Color(0xff818181),
              ),
              const SizedBox(width: 20),
              _rankPopuMembers(
                name: 'Rank',
                item: searchList.rank == null
                    ? ' '
                    : '${searchList.rank <= 100 ? searchList.rank : formatNumber.format(searchList.rank)}',
              ),
              const SizedBox(width: 20),
              _rankPopuMembers(
                name: 'Popularity',
                item: searchList.popularity == null
                    ? ' '
                    : '${searchList.popularity <= 100 ? searchList.popularity : formatNumber.format(searchList.popularity)}',
              ),
              const SizedBox(width: 20),
              _rankPopuMembers(
                name: 'Members',
                item: searchList.members == null
                    ? ''
                    : searchList.members <= 100
                        ? searchList.members
                        : formatNumber.format(searchList.members),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rankPopuMembers({item, String name}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          item.toString() ?? '',
          style: TextStyle(
            fontSize: 35,
            fontFamily: MyFonts.baloo,
            color: BaseColor.white,
          ),
        ),
        Text(
          name,
          style: TextStyle(
            color: BaseColor.orange,
            fontFamily: MyFonts.baloo,
            fontSize: 20,
          ),
        )
      ],
    );
  }

  Widget _synopsis(String item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Synopsis',
            style: TextStyle(
                color: BaseColor.orange,
                fontFamily: MyFonts.baloo,
                fontSize: 20),
          ),
          Text(
            item ?? '',
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
