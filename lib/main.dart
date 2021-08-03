import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rss/blocs/auth/rss_state.dart';
import 'package:flutter_rss/pages/home_page.dart';
import 'package:flutter_rss/utils/resource/color_constant.dart';

import 'blocs/auth/rss_bloc.dart';
import 'dependency_injections.dart';

void main() {
  setupDependencyInjections();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RssBloc>(
            create: (context) => RssBloc(
                  RssStateInitial(),
                )),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: ColorConstant.PRIMARY,
            scaffoldBackgroundColor: ColorConstant.WHITE,
            textSelectionTheme: TextSelectionThemeData(
                selectionColor: Colors.transparent,
                selectionHandleColor: Colors.transparent),
            primaryColorDark: ColorConstant.PRIMARY),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
