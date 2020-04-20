import 'package:animku/environments/colors.dart';
import 'package:animku/environments/end_point_path.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:animku/providers/current_season_provider.dart';
import 'package:animku/ui/detailscreen/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class MyGridView extends StatefulWidget {
  final thisPath;
  const MyGridView({Key key, this.thisPath}) : super(key: key);
  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CurrentSeasonProvider>(context,listen: false).getCurrentSeason(EndPointPath.winter2020);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    var _getData = Provider.of<CurrentSeasonProvider>(context,listen: false).getCurrentSeason(widget.thisPath);
    return FutureBuilder(
      future: _getData ,
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SpinKitWave(
              color: BaseColor.lightPurple,
            ),
          );
        }
        return Consumer<CurrentSeasonProvider>(
          builder: (context,data,_)=>
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10
                ),
                itemCount: data.currentSeason.length,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,i){
                  return ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>DetailsScreen(title: data.currentSeason[i].animeList[i].title,)
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: BaseColor.white,
                            image: DecorationImage(
                            image: NetworkImage(data.currentSeason[i].animeList[i].imageUrl),fit: BoxFit.cover
                          )
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 56.h,
                            width: double.infinity,
                            color: BaseColor.purpleToBlue,
                            child: Center(
                              child: Text('${data.currentSeason[i].animeList[i].title}',style: TextStyle(color: BaseColor.white,fontFamily: MyFonts.baloo)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
        );
      },
    );
  }
}
