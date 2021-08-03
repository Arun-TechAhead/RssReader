import 'package:flutter/material.dart';

import 'color_constant.dart';

class Styles {
  //! PINK COLOUR
  static lightPink({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w300,
      color: ColorConstant.PRIMARY,
    );
  }

  static mediumPink({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: ColorConstant.PRIMARY,
    );
  }

  static regularPink({double size = 14, bool underLineNeeded = false}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      height: 1.3,
      decoration:
          underLineNeeded ? TextDecoration.underline : TextDecoration.none,
      color: ColorConstant.PRIMARY,
    );
  }

  static semiBoldPink({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: ColorConstant.PRIMARY,
    );
  }

  static boldPink({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: ColorConstant.PRIMARY,
    );
  }

  //! GREY COLOR

  static lightGrey({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w300,
      color: ColorConstant.GRAY,
    );
  }

  static mediumGrey({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: ColorConstant.GRAY,
    );
  }

  static boldGrey({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: ColorConstant.GRAY,
    );
  }

  static regularGrey2withOpacity({double size = 14, double opacity = 1}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: ColorConstant.GRAY2.withOpacity(opacity),
    );
  }

  //! BLACK COLOR
  static lightBlack({double size = 14}) {
    return TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w300,
        color: ColorConstant.BLACK,
        height: 1.1);
  }

  static lightBlackWithHeight({double size = 14, double height = 1.1}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w300,
      height: height,
      color: ColorConstant.BLACK,
    );
  }

  static mediumBlack({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: ColorConstant.BLACK,
    );
  }

  static regularBlack({double size = 14, bool underLineNeeded = false}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      decoration:
          underLineNeeded ? TextDecoration.underline : TextDecoration.none,
      color: ColorConstant.BLACK,
    );
  }

  static regularBlackWithHeight({double size = 14, double height = 1.3}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      height: height,
      color: ColorConstant.BLACK,
    );
  }

  static semiBlackWithHeight({double size = 14, double height = 1.3}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      height: height,
      color: ColorConstant.BLACK,
    );
  }

  static boldBlack({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: ColorConstant.BLACK,
    );
  }

  static semiBoldBlack({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: ColorConstant.BLACK,
    );
  }

  //!WHITE COLOR
  static lightWhite({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w300,
      color: ColorConstant.WHITE,
    );
  }

  static mediumWhite({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: ColorConstant.WHITE,
    );
  }

  static regularWhite({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: ColorConstant.WHITE,
    );
  }

  static semiWhite({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: ColorConstant.WHITE,
    );
  }

  static boldWhite({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: ColorConstant.WHITE,
    );
  }

  //! RED COLOR
  static lightRed({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w300,
      color: ColorConstant.ERROR_RED,
    );
  }

  static mediumRed({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: ColorConstant.RED,
    );
  }

  //! YELLOW COLOR
  static semiboldYellow({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: ColorConstant.Yellow,
    );
  }

  //!BlUE COLOR
  static mediumBlue({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: ColorConstant.TAG_BLUE_TEXT,
    );
  }

  static regularBlue({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: ColorConstant.TAG_BLUE_TEXT,
    );
  }

  static semiBoldBlue({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: ColorConstant.TAG_BLUE_TEXT,
    );
  }

//! ORANGE COLOR
  static regularOrange({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: ColorConstant.ORANGE,
    );
  }

//! dynamic color semibold style
  static semiBoldColor({double size = 14, Color color}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

//! STYLE WITH OPACITY
  static regularBlackwithOpacity({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: ColorConstant.BLACK.withOpacity(.6),
    );
  }

  static semiBoldBlackwithOpacity({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: ColorConstant.BLACK.withOpacity(.5),
    );
  }

  static lightDarkGray({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: ColorConstant.GRAY2,
    );
  }

  static regularTabInactive({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.INACTIVE_TAB,
    );
  }

  static regularGray({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.GRAY,
    );
  }

  static regularDarkGray({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.GRAY2,
    );
  }

  static regularGreen({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.BG_TAG,
    );
  }

//! Dynamic color change styles

  static boldDynamicColor(
      {double size = 14, Color color = ColorConstant.BG_TAG}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }
}
