abstract class RssEvent {
  RssEvent([List event = const []]) : super();
}

class RssListEvent extends RssEvent {
  RssListEvent() : super([]);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class RssTrendingEvent extends RssEvent {
  RssTrendingEvent() : super([]);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
