import 'package:animku/environments/colors.dart';
import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BaseColor.baseColor,
        centerTitle: true,
        title: Text(
          'About',
          style: TextStyle(fontSize: 30, fontFamily: MyFonts.horizon),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          height: 200.h as double,
          color: BaseColor.baseColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _iconbtn(
                  icon: FontAwesomeIcons.instagram,
                  onPressed: () {
                    launch('https://www.instagram.com/febry_ardiansyah24/');
                  }),
              _iconbtn(
                  icon: FontAwesomeIcons.github,
                  onPressed: () {
                    launch('https://github.com/febryardiansyah');
                  }),
              _iconbtn(
                  icon: FontAwesomeIcons.youtube,
                  onPressed: () {
                    launch('https://www.youtube.com/muhammadfebry');
                  }),
              _iconbtn(
                  icon: FontAwesomeIcons.firefoxBrowser,
                  onPressed: () {
                    launch('https://febryardiansyah.github.io/');
                  }),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Text(
            'About Developer',
            style: TextStyle(color: BaseColor.grey),
          ),
          const Divider(),
          _aboutDeveloper(context),
          const SizedBox(height: 20),
          Text(
            'About this App',
            style: TextStyle(color: BaseColor.grey),
          ),
          const Divider(),
          _aboutApp(context),
        ],
      ),
    );
  }

  Widget _iconbtn({VoidCallback onPressed, IconData icon}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: BaseColor.white,
      ),
    );
  }

  Widget _aboutDeveloper(BuildContext context) {
    ScreenUtil.init(context);
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(Dictionary.me),
          radius: 150.h as double,
          backgroundColor: BaseColor.grey,
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Febry Ardiansyah',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: MyFonts.baloo,
                  color: BaseColor.baseColor),
            ),
            undeName(icon: Icons.email, name: 'febryardiansyah27@gmail.com'),
            undeName(icon: FontAwesomeIcons.discord, name: 'Febry#4750')
          ],
        )
      ],
    );
  }

  Widget undeName({IconData icon, String name}) {
    return Row(
      children: [
        Icon(
          icon,
          color: BaseColor.grey,
        ),
        const SizedBox(width: 10),
        Text(
          name,
          style: TextStyle(
            color: BaseColor.grey,
            fontSize: 12.5,
          ),
        ),
      ],
    );
  }

  Widget _aboutApp(BuildContext context) {
    ScreenUtil.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DetailsApp.details,
          textAlign: TextAlign.justify,
          style: TextStyle(color: BaseColor.baseColor),
        ),
        const SizedBox(height: 10),
        Text(
          DetailsApp.thanks,
          textAlign: TextAlign.center,
          style: TextStyle(color: BaseColor.baseColor),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            launch('https://jikan.docs.apiary.io/');
          },
          child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: TextStyle(color: BaseColor.baseColor),
              text: DetailsApp.readDocs,
              children: [
                TextSpan(
                  text: ' Here',
                  style: TextStyle(
                    color: Colors.red,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class DetailsApp {
  static const String details =
      'Animku is Unofficial MyAnimelist.net Application that has many '
      'features such as Schedule every season in current year, canceled '
      'anime (season later), schedule in current season, and search anime by name.';
  static const String thanks =
      '~~Thanks to JikanApi team that has been provided the API or backend for public/free. ~~';
  static const String readDocs = 'You can read the api documentation ';
}
