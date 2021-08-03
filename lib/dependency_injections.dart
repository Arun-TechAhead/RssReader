import 'package:injector/injector.dart';

import 'data/api/api_service.dart';
import 'data/providers/rss_provider.dart';
import 'data/repositories/rss_repository.dart';

void setupDependencyInjections() async {
  Injector injector = Injector.appInstance;
  injector.registerSingleton<ApiService>(() => ApiService());

  _rssProviderDI(injector);
  _rssRepositoryDI(injector);
}

void _rssProviderDI(Injector injector) {
  injector.registerDependency<RssProvider>(() {
    var api = injector.get<ApiService>();
    return RssProvider(api: api);
  });
}

void _rssRepositoryDI(Injector injector) {
  injector.registerDependency<RssRepository>(() {
    var authProvider = injector.get<RssProvider>();
    return RssRepository(rssProvider: authProvider);
  });
}
