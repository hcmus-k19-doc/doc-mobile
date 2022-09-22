import 'package:flutter/material.dart';

import 'color_const.dart';

class FontConst {
  static const regular = TextStyle(
    fontFamily: SF_PRO_TEXT,
    fontWeight: FontWeight.w400,
  );

  static const medium = TextStyle(
    fontFamily: SF_PRO_TEXT,
    fontWeight: FontWeight.w500,
  );

  static const semiBold = TextStyle(
    fontFamily: SF_PRO_TEXT,
    fontWeight: FontWeight.w600,
  );

  //REGULAR
  static final REGULAR_DEFAULT =
      regular.copyWith(color: ColorConst.defaultColor);
  static final REGULAR_DEFAULT_10 = REGULAR_DEFAULT.copyWith(fontSize: 10);
  static final REGULAR_DEFAULT_12 = REGULAR_DEFAULT.copyWith(fontSize: 12);

  static final REGULAR_WHITE = regular.copyWith(color: ColorConst.white);
  static final REGULAR_WHITE_8 = REGULAR_WHITE.copyWith(fontSize: 8);
  static final REGULAR_WHITE_10 = REGULAR_WHITE.copyWith(fontSize: 10);
  static final REGULAR_WHITE_12 = REGULAR_WHITE.copyWith(fontSize: 12);
  static final REGULAR_WHITE_14 = REGULAR_WHITE.copyWith(fontSize: 14);

  static final REGULAR_GRAY1 = regular.copyWith(color: ColorConst.grey);
  static final REGULAR_GRAY1_10 = REGULAR_GRAY1.copyWith(fontSize: 10);
  static final REGULAR_GRAY1_12 = REGULAR_GRAY1.copyWith(fontSize: 12);

  static final REGULAR_GRAY1_50 =
      regular.copyWith(color: ColorConst.greyOpacity);
  static final REGULAR_GRAY1_50_9 = REGULAR_GRAY1_50.copyWith(fontSize: 9);
  static final REGULAR_GRAY1_50_12 = REGULAR_GRAY1_50.copyWith(fontSize: 12);

  static final REGULAR_BLACK2 = regular.copyWith(color: ColorConst.darkGrey);
  static final REGULAR_BLACK2_10 = REGULAR_BLACK2.copyWith(fontSize: 10);
  static final REGULAR_BLACK2_12 = REGULAR_BLACK2.copyWith(fontSize: 12);
  static final REGULAR_BLACK2_14 = REGULAR_BLACK2.copyWith(fontSize: 14);

  static final REGULAR_GRAY4 = regular.copyWith(color: ColorConst.dimGrey);
  static final REGULAR_GRAY4_8 = REGULAR_GRAY4.copyWith(fontSize: 8);
  static final REGULAR_GRAY4_10 = REGULAR_GRAY4.copyWith(fontSize: 10);
  static final REGULAR_GRAY4_12 = REGULAR_GRAY4.copyWith(fontSize: 12);
  static final REGULAR_GRAY4_14 = REGULAR_GRAY4.copyWith(fontSize: 14);

  static final REGULAR_GRAY4_40 =
      regular.copyWith(color: ColorConst.dimGreyOpacity);
  static final REGULAR_GRAY4_40_12 = REGULAR_GRAY4_40.copyWith(fontSize: 12);

  static final REGULAR_GRAY5 = regular.copyWith(color: ColorConst.silverGrey);
  static final REGULAR_GRAY5_10 = REGULAR_GRAY5.copyWith(fontSize: 10);

  static final REGULAR_GRAY6 = regular.copyWith(color: ColorConst.lightGrey);
  static final REGULAR_GRAY6_10 = REGULAR_GRAY6.copyWith(fontSize: 10);
  static final REGULAR_GRAY6_12 = REGULAR_GRAY6.copyWith(fontSize: 12);
  static final REGULAR_GRAY6_14 = REGULAR_GRAY6.copyWith(fontSize: 14);

  static final REGULAR_MEDIUM_GREY =
      regular.copyWith(color: ColorConst.textMediumGreyColor);
  static final REGULAR_MEDIUM_GREY_10 =
      REGULAR_MEDIUM_GREY.copyWith(fontSize: 10);
  static final REGULAR_MEDIUM_GREY_12 =
      REGULAR_MEDIUM_GREY.copyWith(fontSize: 12);
  static final REGULAR_MEDIUM_GREY_14 =
      REGULAR_MEDIUM_GREY.copyWith(fontSize: 14);
  static final REGULAR_MEDIUM_GREY_16 =
      REGULAR_MEDIUM_GREY.copyWith(fontSize: 16);

  static final REGULAR_BLUE = regular.copyWith(color: ColorConst.blue);
  static final REGULAR_BLUE_14 = REGULAR_BLUE.copyWith(fontSize: 14);
  static final REGULAR_BLUE_16 = REGULAR_BLUE.copyWith(fontSize: 16);
  static final REGULAR_BLUE_12 = REGULAR_BLUE.copyWith(fontSize: 12);

  //MEDIUM
  static final MEDIUM_WHITE = medium.copyWith(color: ColorConst.white);
  static final MEDIUM_WHITE_12 = MEDIUM_WHITE.copyWith(fontSize: 12);
  static final MEDIUM_WHITE_14 = MEDIUM_WHITE.copyWith(fontSize: 14);
  static final MEDIUM_WHITE_16 = MEDIUM_WHITE.copyWith(fontSize: 16);
  static final MEDIUM_WHITE_22 = MEDIUM_WHITE.copyWith(fontSize: 22);

  static final MEDIUM_DEFAULT = medium.copyWith(color: ColorConst.defaultColor);
  static final MEDIUM_DEFAULT_10 = MEDIUM_DEFAULT.copyWith(fontSize: 10);
  static final MEDIUM_DEFAULT_12 = MEDIUM_DEFAULT.copyWith(fontSize: 12);
  static final MEDIUM_DEFAULT_14 = MEDIUM_DEFAULT.copyWith(fontSize: 14);
  static final MEDIUM_DEFAULT_16 = MEDIUM_DEFAULT.copyWith(fontSize: 16);

  static final MEDIUM_WHITE_70 =
      medium.copyWith(color: ColorConst.whiteOpacity);
  static final MEDIUM_WHITE_70_14 = MEDIUM_WHITE_70.copyWith(fontSize: 14);

  static final MEDIUM_GRAY4 = medium.copyWith(color: ColorConst.dimGrey);
  static final MEDIUM_GRAY4_10 = MEDIUM_GRAY4.copyWith(fontSize: 10);

  static final MEDIUM_BLACK2 = medium.copyWith(color: ColorConst.darkGrey);
  static final MEDIUM_BLACK2_14 = MEDIUM_BLACK2.copyWith(fontSize: 14);
  static final MEDIUM_BLACK2_16 = MEDIUM_BLACK2.copyWith(fontSize: 16);

  static final MEDIUM_BLUE = medium.copyWith(color: ColorConst.blue);
  static final MEDIUM_BLUE_14 = MEDIUM_BLUE.copyWith(fontSize: 14);
  static final MEDIUM_BLUE_16 = MEDIUM_BLUE.copyWith(fontSize: 16);

  //SEMI_BOLD
  static final SEMIBOLD_WHITE = semiBold.copyWith(color: ColorConst.white);
  static final SEMIBOLD_WHITE_10 = SEMIBOLD_WHITE.copyWith(fontSize: 10);
  static final SEMIBOLD_WHITE_12 = SEMIBOLD_WHITE.copyWith(fontSize: 12);
  static final SEMIBOLD_WHITE_16 = SEMIBOLD_WHITE.copyWith(fontSize: 16);
  static final SEMIBOLD_WHITE_18 = SEMIBOLD_WHITE.copyWith(fontSize: 18);

  static final SEMIBOLD_BLACK =
      semiBold.copyWith(color: ColorConst.textBlackColor);
  static final SEMIBOLD_BLACK_10 = SEMIBOLD_BLACK.copyWith(fontSize: 10);
  static final SEMIBOLD_BLACK_12 = SEMIBOLD_BLACK.copyWith(fontSize: 12);
  static final SEMIBOLD_BLACK_16 = SEMIBOLD_BLACK.copyWith(fontSize: 16);
  static final SEMIBOLD_BLACK_14 = SEMIBOLD_BLACK.copyWith(fontSize: 14);
  static final SEMIBOLD_BLACK_18 = SEMIBOLD_BLACK.copyWith(fontSize: 18);
  static final SEMIBOLD_BLACK_24 = SEMIBOLD_BLACK.copyWith(fontSize: 24);

  static final REGULAR_BLACK =
      regular.copyWith(color: ColorConst.textBlackColor);
  static final REGULAR_BLACK_10 = REGULAR_BLACK.copyWith(fontSize: 10);
  static final REGULAR_BLACK_12 = REGULAR_BLACK.copyWith(fontSize: 12);
  static final REGULAR_BLACK_14 = REGULAR_BLACK.copyWith(fontSize: 14);
  static final REGULAR_BLACK_16 = REGULAR_BLACK.copyWith(fontSize: 16);

  static final SEMIBOLD_DEFAULT =
      semiBold.copyWith(color: ColorConst.defaultColor);
  static final SEMIBOLD_DEFAULT_16 = SEMIBOLD_DEFAULT.copyWith(fontSize: 16);
  static final SEMIBOLD_DEFAULT_24 = SEMIBOLD_DEFAULT.copyWith(fontSize: 24);

  static final SEMIBOLD_MEDIUM_GREY =
      semiBold.copyWith(color: ColorConst.textMediumGreyColor);
  static final SEMIBOLD_MEDIUM_GREY_10 =
      SEMIBOLD_MEDIUM_GREY.copyWith(fontSize: 10);
  static final SEMIBOLD_MEDIUM_GREY_12 =
      SEMIBOLD_MEDIUM_GREY.copyWith(fontSize: 12);
  static final SEMIBOLD_MEDIUM_GREY_16 =
      SEMIBOLD_MEDIUM_GREY.copyWith(fontSize: 16);
  static final SEMIBOLD_MEDIUM_GREY_14 =
      SEMIBOLD_MEDIUM_GREY.copyWith(fontSize: 14);
  static final SEMIBOLD_MEDIUM_GREY_18 =
      SEMIBOLD_MEDIUM_GREY.copyWith(fontSize: 18);
  static final SEMIBOLD_MEDIUM_GREY_24 =
      SEMIBOLD_MEDIUM_GREY.copyWith(fontSize: 24);

  static final SEMIBOLD_LIGHT_GREY =
      semiBold.copyWith(color: ColorConst.textLightGreyColor);
  static final SEMIBOLD_LIGHT_GREY_10 =
      SEMIBOLD_LIGHT_GREY.copyWith(fontSize: 10);
  static final SEMIBOLD_LIGHT_GREY_12 =
      SEMIBOLD_LIGHT_GREY.copyWith(fontSize: 12);
  static final SEMIBOLD_LIGHT_GREY_16 =
      SEMIBOLD_LIGHT_GREY.copyWith(fontSize: 16);
  static final SEMIBOLD_LIGHT_GREY_14 =
      SEMIBOLD_LIGHT_GREY.copyWith(fontSize: 14);
  static final SEMIBOLD_LIGHT_GREY_18 =
      SEMIBOLD_LIGHT_GREY.copyWith(fontSize: 18);
  static final SEMIBOLD_LIGHT_GREY_24 =
      SEMIBOLD_LIGHT_GREY.copyWith(fontSize: 24);

  static final REGULAR_LIGHT_GREY =
      regular.copyWith(color: ColorConst.textLightGreyColor);
  static final REGULAR_LIGHT_GREY_10 =
      REGULAR_LIGHT_GREY.copyWith(fontSize: 10);
  static final REGULAR_LIGHT_GREY_12 =
      REGULAR_LIGHT_GREY.copyWith(fontSize: 12);
  static final REGULAR_LIGHT_GREY_16 =
      REGULAR_LIGHT_GREY.copyWith(fontSize: 16);
  static final REGULAR_LIGHT_GREY_14 =
      REGULAR_LIGHT_GREY.copyWith(fontSize: 14);
  static final REGULAR_LIGHT_GREY_18 =
      REGULAR_LIGHT_GREY.copyWith(fontSize: 18);
  static final REGULAR_LIGHT_GREY_24 =
      REGULAR_LIGHT_GREY.copyWith(fontSize: 24);

  static const SF_PRO_TEXT = "SF-Pro-Text";
}
