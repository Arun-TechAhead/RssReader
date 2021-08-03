import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rss/blocs/auth/rss_bloc.dart';
import 'package:flutter_rss/blocs/auth/rss_event.dart';
import 'package:flutter_rss/blocs/auth/rss_state.dart';
import 'package:flutter_rss/blocs/bloc_manager.dart';
import 'package:flutter_rss/data/api/api_service.dart';
import 'package:flutter_rss/pages/rss_details.dart';
import 'package:flutter_rss/utils/Log.dart';
import 'package:flutter_rss/utils/next_page_routing.dart';
import 'package:flutter_rss/utils/resource/color_constant.dart';
import 'package:flutter_rss/utils/resource/image_path.dart';
import 'package:flutter_rss/utils/resource/styles.dart';
import 'package:flutter_rss/widgets/screen_with_loader.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RssFeed _feed, _trendingFeed;

  bool _isLoading = true;

  @override
  void initState() {
    getRssFeed();
    getTrendingFeed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rss Feed",
          style: Styles.regularWhite(size: 18),
        ),
      ),
      body: BlocManager(
        initState: (BuildContext context) {},
        child: BlocListener<RssBloc, RssState>(
          listener: (context, state) {
            if (state is RssListState) _handleResponse(state);
            if (state is RssTrendingState) _handleTrendingResponse(state);
          },
          child: ScreenWithLoader(
            isLoading: _isLoading,
            body: _feed == null || _trendingFeed == null
                ? Container()
                : list(_feed),
          ),
        ),
      ),
    );
  }

  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  list(RssFeed _feed) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Container displaying RSS feed info.
          Expanded(
            flex: 2,
            child: PageView(
              controller: _pageController,
              children: _trendingFeed.items
                  .map((e) => InkWell(
                        onTap: () => Navigator.push(
                            context,
                            NextPageRoute(RssDetails(
                              data: e,
                            ))),
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 2.5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: new NetworkImage(e.enclosure.url),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                height: 80,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.centerLeft,
                                color: Colors.black.withOpacity(0.7),
                                child: Text(
                                  e.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.regularWhite(size: 18),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // ListView that displays the RSS data.
          Expanded(
            flex: 3,
            child: Container(
              child: ReorderableListView(
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final RssItem item = _feed.items.removeAt(oldIndex);
                    _feed.items.insert(newIndex, item);
                  });
                },
                padding: EdgeInsets.all(5.0),
                children: _feed.items
                    .map((item) => Container(
                          key: Key('${item.guid}'),
                          margin: EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          decoration: customBoxDecoration(),
                          child: ListTile(
                            title: title(item.title),
                            subtitle: subtitle(item.pubDate ?? ""),
                            leading: thumbnail(item.enclosure.url),
                            trailing: rightIcon(),
                            contentPadding: EdgeInsets.all(5.0),
                            onTap: () => Navigator.push(
                                context,
                                NextPageRoute(RssDetails(
                                  data: item,
                                ))),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ]);
  }

  // Method that returns the Text Widget for the title of our RSS data.
  title(title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: ColorConstant.GRAY),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  // Method that returns the Text Widget for the subtitle of our RSS data.
  subtitle(subTitle) {
    return Text(
      subTitle,
      style: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w300,
        color: ColorConstant.GRAY2,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  // Method that returns Icon Widget.
  rightIcon() {
    return Icon(
      Icons.keyboard_arrow_right,
      color: ColorConstant.GRAY,
      size: 30.0,
    );
  }

  // Custom box decoration for the Container Widgets.
  BoxDecoration customBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: ColorConstant.GRAY, // border color
        width: 1.0,
      ),
    );
  }

  thumbnail(imageUrl) {
    return CachedNetworkImage(
      placeholder: (context, url) => Image.asset(ImagePath.PLACE_HOLDER),
      imageUrl: imageUrl,
      height: 80,
      width: 80,
      alignment: Alignment.center,
      fit: BoxFit.cover,
    );
  }

  void _handleResponse(RssListState state) {
    setState(() {
      switch (state.apiState) {
        case ApiStatus.LOADING:
          Log.v("Loading....................");
          _isLoading = true;

          break;
        case ApiStatus.SUCCESS:
          _isLoading = false;
          if (state.response.result != null) {
            _feed = state.response.result;
          }
          break;
        case ApiStatus.ERROR:
          _isLoading = false;
          Log.v("Error..........................${state.response.toString()}");
          break;
        case ApiStatus.INITIAL:
          _isLoading = false;
          // TODO: Handle this case.
          break;
      }
    });
  }

  void getRssFeed() {
    BlocProvider.of<RssBloc>(context).add(
      RssListEvent(),
    );
  }

  void getTrendingFeed() {
    BlocProvider.of<RssBloc>(context).add(
      RssTrendingEvent(),
    );
  }

  void _handleTrendingResponse(RssTrendingState state) {
    setState(() {
      switch (state.apiState) {
        case ApiStatus.LOADING:
          Log.v("Loading....................");
          _isLoading = true;

          break;
        case ApiStatus.SUCCESS:
          _isLoading = false;
          if (state.response.result != null) {
            _trendingFeed = state.response.result;
            startTimer();
          }
          break;
        case ApiStatus.ERROR:
          _isLoading = false;
          Log.v("Error..........................${state.response.toString()}");
          break;
        case ApiStatus.INITIAL:
          _isLoading = false;
          // TODO: Handle this case.
          break;
      }
    });
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }
}
