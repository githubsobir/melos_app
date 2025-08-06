import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Future<void> init() async {
    if (!kIsWeb) {
      Directory dir = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(dir.path);
    } else {
      await Hive.initFlutter(); // Web uchun
    }

    // Adapterlar shu yerda ro‘yxatdan o‘tadi:
    // Hive.registerAdapter(UserAdapter());

    await Hive.openBox('myBox');
  }
}