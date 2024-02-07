
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_self_service/src/modules/scan/scan_page.dart';

class ScanModule extends FlutterGetItModule{
  @override
  String get moduleRouteName => '/scan';

  @override
  Map<String, WidgetBuilder> get pages => {
    '/': (_) => const ScanPage()
    };
  
}