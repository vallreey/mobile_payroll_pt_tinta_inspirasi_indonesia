import 'package:flutter_test/flutter_test.dart';

import 'package:payroll_pt_tinta_inspirasi_indonesia_mobile/main.dart';

void main() {
  testWidgets('Dashboard shows attendance, quick menu, and summary', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Adhi Puspito 👋'), findsOneWidget);
    expect(find.text('Absensi Hari Ini'), findsOneWidget);
    expect(find.text('Menu Cepat'), findsOneWidget);
    expect(find.text('Ringkasan Hari Ini'), findsOneWidget);
    expect(find.text('Aktivitas Terbaru'), findsOneWidget);
    expect(find.text('Beranda'), findsOneWidget);
  });
}
