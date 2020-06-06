import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:animku/components/my_behavior.dart';
import 'package:animku/environments/colors.dart';
import 'package:animku/environments/my_fonts.dart';

class DetailsScreen extends StatefulWidget {
  final String title, imageUrl, airing, type, source, synopsis;
  final double score;
  final int episodes, members;
  final List<String> genre;
  final List<String> studio;

  const DetailsScreen({
    Key key,
    this.title,
    this.imageUrl,
    this.genre,
    this.score,
    this.type,
    this.episodes,
    this.source,
    this.studio,
    this.airing,
    this.members,
    this.synopsis,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _background(),
          DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.7,
            maxChildSize: 0.9,
            expand: true,
            builder: (context, controller) {
              return Container(
                height: widget.synopsis.length <= 100 != null
                    ? 500.h as double
                    : 1300.h as double,
                decoration: BoxDecoration(
                  color: BaseColor.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: const Offset(-10, -10),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView(
                    controller: controller,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            _title(),
                            _genre(),
                            _box1(),
                            _box2(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _background() {
    ScreenUtil.init(context);
    return Stack(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: widget.imageUrl,
          placeholder: (context, loading) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, error, _) => Icon(Icons.error),
          imageBuilder: (context, imageProvider) => Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                alignment: Alignment.center,
                color: Colors.grey.withOpacity(0.1),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          child: RaisedButton(
            color: BaseColor.baseColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: BaseColor.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _title() {
    return Center(
      child: Text(
        widget.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: BaseColor.baseColor,
          fontFamily: MyFonts.baloo,
          fontSize: widget.title.length >= 20 != null ? 20 : 30,
        ),
      ),
    );
  }

  Widget _genre() {
    return Text(
      widget.genre.toString(),
      textAlign: TextAlign.center,
    );
  }

  Widget _box1() {
    return Card(
      elevation: 8,
      color: BaseColor.baseColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        height: 340.h as double,
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 100.h as double,
                    width: 200.h as double,
                    color: BaseColor.white,
                    child: Center(
                      child: Text(
                        'Score',
                        style: TextStyle(
                            fontFamily: MyFonts.baloo,
                            fontSize: 25,
                            color: BaseColor.baseColor),
                      ),
                    ),
                  ),
                ),
                const Divider(),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: BaseColor.orange,
                      size: 25,
                    ),
                    Text(
                      widget.score == null ? '0' : widget.score.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        color: BaseColor.white,
                        fontFamily: MyFonts.baloo,
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              width: 5,
              height: 100,
              color: const Color(0xff818181),
            ),
            Column(
              children: <Widget>[
                Text(
                  'Type',
                  style: TextStyle(
                      fontFamily: MyFonts.baloo,
                      fontSize: 25,
                      color: BaseColor.white),
                ),
                Text(
                  widget.type.toString(),
                  style: TextStyle(
                      fontSize: 25,
                      color: BaseColor.orange,
                      fontFamily: MyFonts.baloo),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Eps',
                  style: TextStyle(
                      fontFamily: MyFonts.baloo,
                      fontSize: 25,
                      color: BaseColor.white),
                ),
                Text(
                  widget.episodes == null ? '0' : widget.episodes.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    color: BaseColor.orange,
                    fontFamily: MyFonts.baloo,
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Source',
                  style: TextStyle(
                    fontFamily: MyFonts.baloo,
                    fontSize: 25,
                    color: BaseColor.white,
                  ),
                ),
                Text(
                  widget.source.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    color: BaseColor.orange,
                    fontFamily: MyFonts.baloo,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _box2() {
    ScreenUtil.init(context);
    final NumberFormat formatNumber = NumberFormat('#,###');
    String studio;
    for (int i = 0; i < widget.studio.length; i++) {
      studio = widget.studio[i];
    }
    return Card(
      elevation: 8,
      color: BaseColor.baseColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        height: widget.synopsis.length <= 100 != null
            ? 1000.h as double
            : MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: 970.w as double,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _detailItems(
                      title: widget.airing == null
                          ? 'Unknown'
                          : widget.airing.substring(0, 10),
                      icon: Icons.date_range,
                    ),
                    _detailItems(
                      title: studio ?? '',
                      icon: FontAwesomeIcons.building,
                    ),
                    _detailItems(
                      title: widget.members == null
                          ? ''
                          : formatNumber.format(widget.members),
                      icon: Icons.people,
                    ),
                    SizedBox(
                      height: 100.h as double,
                    ),
                    Text(
                      'Synopsis',
                      style: TextStyle(
                          color: BaseColor.orange,
                          fontSize: 20,
                          fontFamily: MyFonts.baloo),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: 950.w as double,
                      child: Text(
                        widget.synopsis,
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: BaseColor.white),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 600.w as double,
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    errorWidget: (context, error, _) => Text(error),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageBuilder: (context, imageProvider) => Container(
                      height: 430.h as double,
                      width: 350.h as double,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(5, 5),
                            color: Colors.black12,
                          ),
                          BoxShadow(
                            offset: const Offset(-5, -5),
                            color: Colors.black12,
                          )
                        ],
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Row _detailItems({IconData icon, String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          icon,
          color: BaseColor.white,
        ),
        const Text(' '),
        Text(
          title,
          style: TextStyle(
            color: BaseColor.white,
            fontFamily: MyFonts.baloo,
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
