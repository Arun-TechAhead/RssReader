import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rss/utils/resource/color_constant.dart';
import 'package:flutter_rss/utils/resource/styles.dart';

class ScreenWithLoader extends StatefulWidget {
  final bool isLoading;
  final Color color;
  final Widget body;

  ScreenWithLoader({this.isLoading, this.body, this.color = Colors.white38});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScreenWithLoader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: widget.body,
        ),
        Visibility(
          visible: widget.isLoading,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: widget.color,
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: new BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Loading...",
                      style: Styles.regularPink(size: 16),
                    ),
                    CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(ColorConstant.PRIMARY),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
