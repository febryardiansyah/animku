import 'dart:ui'show Color;
import 'package:flutter/material.dart';

class BaseColor{

  //color pallate
  static final lightPurple = Color(0xffBEADFF);
  static final greyPurple = Color(0xff965D7B);
  static final baseColor = Color(0xff444053);
  static final purpleToBlue = Color(0xff6C63FF);
  static final orange = Color(0xffFFC700);
  static final red = Color(0xffF25959);
  static final white = Color(0xffFFFFFF);
  static final grey = Color(0xff9C9C9C);
  static final transparent = Colors.transparent;

  //genre color list
  static final List genreColorList = [
    gen1,gen2,gen3,gen4,gen5,gen6,gen7,gen8,gen9
  ];

  static Color gen1 = Color(0xff00FF29);
  static Color gen2 = Color(0xffF25959);
  static Color gen3 = Color(0xffFFC700);
  static Color gen4 = Color(0xff00C2FF);
  static Color gen5 = Color(0xffFF7A00);
  static Color gen6 = Color(0xff0094FF);
  static Color gen7 = Color(0xffCC80C4);
  static Color gen8 = Color(0xff7EB66A);
  static Color gen9 = Color(0xff4200FF);
}