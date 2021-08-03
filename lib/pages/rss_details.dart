import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rss/utils/resource/color_constant.dart';
import 'package:flutter_rss/utils/resource/styles.dart';
import 'package:flutter_rss/widgets/sliver_app_bar_delegates.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/domain/rss_item.dart';

class RssDetails extends StatefulWidget {
  RssItem data;

  RssDetails({Key key, this.data}) : super(key: key);

  @override
  _RssDetailsState createState() => _RssDetailsState();
}

class _RssDetailsState extends State<RssDetails> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: true,
                  centerTitle: true,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      centerTitle: true,
                      title: Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          widget.data.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.regularWhite(size: 14),
                        ),
                      ),
                      background: Image.network(
                        widget.data.enclosure.url,
                        fit: BoxFit.cover,
                      )),
                ),
                SliverPersistentHeader(
                  delegate: SliverAppBarDelegate(
                    TabBar(
                      labelColor: Colors.black87,
                      onTap: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(icon: Icon(Icons.info), text: "Info"),
                        Tab(icon: Icon(Icons.link), text: "Link"),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: _selectedIndex == 0 ? getInfoBody() : getLinkBody()),
      ),
    );

    /* Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).maybePop();
            }),
        title: Text(
          "${widget.data.title}",
          style: Styles.regularBlack(size: 18),
        ),
      ),
      body: getBody(),
    );*/
  }

  Widget getInfoBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Description",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.GRAY2),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${widget.data.description}",
                style: TextStyle(fontSize: 16.0, color: ColorConstant.GRAY2),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget getLinkBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Source Link",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.GRAY2),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () => openFeed(widget.data.link),
                child: Text(
                  "${widget.data.link}",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: ColorConstant.BLUE,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
      );
      return;
    }
  }
}
