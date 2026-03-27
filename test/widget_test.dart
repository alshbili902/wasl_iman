import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasl_iman/app.dart';
import 'package:wasl_iman/data/services/local_storage_service.dart';

void main() {
  testWidgets('App boots successfully', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await LocalStorageService.instance.init();

    await tester.pumpWidget(const WaslImanApp());
    await tester.pumpAndSettle();

    expect(find.byType(WaslImanApp), findsOneWidget);
  });
}
