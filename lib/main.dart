import 'package:flutter/widgets.dart';
import 'package:wasl_iman/app.dart';
import 'package:wasl_iman/data/services/local_storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.instance.init();
  runApp(const WaslImanApp());
}
