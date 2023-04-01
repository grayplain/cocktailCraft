import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:booy/main.dart';
import 'package:booy/View/CockTailList.dart';
import 'package:booy/ViewParts/CockTailListCard.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Home Screen Tests', () {
    testWidgets('BottomNavigationBar and CockTailList tests',
        (WidgetTester tester) async {
      // 1. アプリを起動する
      await tester.pumpWidget(MyApp());

      // 2. 画面下部に bottomNavigationBar が表示されていることを確認する
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // 3. CocktailList が表示されていることを確認する
      expect(find.byType(CockTailList), findsOneWidget);

      // 4. CocktailList に CocktailListCard が表示されていることを確認する
      // 注意: このテストは、CocktailListがCocktailListCardを動的にロードすることを前提としています
      await tester.pumpAndSettle(); // ウィジェットがロードされるまで待つ
      expect(find.byType(CockTailListCard), findsWidgets);
    });
  });
}
