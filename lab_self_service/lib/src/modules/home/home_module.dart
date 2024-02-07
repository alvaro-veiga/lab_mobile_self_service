
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_self_service/src/modules/home/home_page.dart';

class HomeModule extends FlutterGetItModule{
  @override
  // TODO: implement moduleRouteName
  String get moduleRouteName => '/home';

  @override
  // TODO: implement pages
  Map<String, WidgetBuilder> get pages => {
    '/': (_) => const HomePage()
  };
}