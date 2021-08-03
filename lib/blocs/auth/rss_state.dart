import 'package:flutter_rss/data/api/api_service.dart';
import 'package:flutter_rss/data/models/rss_response.dart';

abstract class RssState {
  RssState([List states = const []]) : super();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

//create initial State
class RssStateInitial extends RssState {
  RssStateInitial() : super([]);
}

//create state
class RssListState extends RssState {
  ApiStatus state;

  ApiStatus get apiState => state;
  RssResponse response;
  String error;

  RssListState(this.state, {this.response, this.error});
}

class RssTrendingState extends RssState {
  ApiStatus state;

  ApiStatus get apiState => state;
  RssResponse response;
  String error;

  RssTrendingState(this.state, {this.response, this.error});
}
