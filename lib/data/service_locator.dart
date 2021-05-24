import 'package:get_it/get_it.dart';
import 'package:docnews/data/db.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerSingleton(AppDatabase());
}
