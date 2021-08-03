import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rss/data/api/api_service.dart';
import 'package:flutter_rss/data/repositories/rss_repository.dart';
import 'package:flutter_rss/utils/Log.dart';
import 'package:injector/injector.dart';

import 'rss_event.dart';
import 'rss_state.dart';

class RssBloc extends Bloc<RssEvent, RssState> {
  final rssRepository = Injector.appInstance.get<RssRepository>();

  RssBloc(RssState initialState) : super(initialState);

  @override
  Stream<RssState> mapEventToState(RssEvent event) async* {
    if (event is RssListEvent) {
      try {
        yield RssListState(ApiStatus.LOADING);
        final response = await rssRepository.getRssList();
        if (response.status == true) {
          yield RssListState(ApiStatus.SUCCESS, response: response);
        } else {
          Log.v("ERROR DATA ::: ${response.message}");
          yield RssListState(ApiStatus.ERROR, error: response.message);
        }
      } catch (e) {
        Log.v("ERROR DATA : ${e}");
        yield RssListState(ApiStatus.ERROR, error: 'Something went wrong');
      }
    } else if (event is RssTrendingEvent) {
      try {
        yield RssTrendingState(ApiStatus.LOADING);
        final response = await rssRepository.getTrendingRssList();
        if (response.status == true) {
          yield RssTrendingState(ApiStatus.SUCCESS, response: response);
        } else {
          Log.v("ERROR DATA ::: ${response.message}");
          yield RssTrendingState(ApiStatus.ERROR, error: response.message);
        }
      } catch (e) {
        Log.v("ERROR DATA : ${e}");
        yield RssTrendingState(ApiStatus.ERROR, error: 'Something went wrong');
      }
    }
  }
}
