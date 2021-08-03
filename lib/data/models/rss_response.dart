import 'package:webfeed/domain/rss_feed.dart';

class RssResponse {
  RssFeed result;
  bool status;
  String message;

  RssResponse({this.result, this.status, this.message});
}
