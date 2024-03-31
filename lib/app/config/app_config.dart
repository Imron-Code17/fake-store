import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../core/constant/constant.dart';
import '../core/utils/app_storage/app_storage.dart';
import '../injection_containers.dart';

class AppConfig {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await dotenv.load(fileName: envPath).then((value) {
      kBaseUrl = dotenv.env['BASE_URL']!;
    });
    await initializeDepedencies();
    await AppStorage.init();
  }
}
