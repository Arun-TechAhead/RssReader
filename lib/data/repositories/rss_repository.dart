import 'package:flutter_rss/data/models/rss_response.dart';
import 'package:flutter_rss/data/providers/rss_provider.dart';
import 'package:webfeed/domain/rss_feed.dart';

class RssRepository {
  RssRepository({this.rssProvider});

  final RssProvider rssProvider;

  Future<RssResponse> getRssList() async {
    final response = await rssProvider.getRssList();
    if (response.success) {
      RssResponse _response = RssResponse(
          result: RssFeed.parse(response.body),
          message: "Success",
          status: true);
      return _response;
    } else {
      return RssResponse(
          status: false, result: null, message: 'Something went wrong');
    }
  }

  Future<RssResponse> getTrendingRssList() async {
    final response = await rssProvider.getTrendingRssList();
    if (response.success) {
      RssResponse _response = RssResponse(
          result: RssFeed.parse(response.body),
          message: "Success",
          status: true);
      return _response;
    } else {
      return RssResponse(
          status: false, result: null, message: 'Something went wrong');
    }
  }
}
