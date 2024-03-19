import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:unittesting_flutter/article.dart';
import 'package:unittesting_flutter/news_change_notifier.dart';
import 'package:unittesting_flutter/news_page.dart';
import 'package:unittesting_flutter/news_service.dart';

class MockNewsService extends Mock implements NewsService {}

void main() {
  late MockNewsService mockNewsService;
  setUp(() {
    mockNewsService = MockNewsService();
  });
  Widget createWidgetUnderTest() {
    return MaterialApp(
      title: 'News App',
      home: ChangeNotifierProvider(
        create: (_) => NewsChangeNotifier(mockNewsService),
        child: const NewsPage(),
      ),
    );
  }

  final articlesFromService = [
    Article(title: 'Test 1', content: 'Test 1 content'),
    Article(title: 'Test 2', content: 'Test 2 content'),
    Article(title: 'Test 3', content: 'Test 3 content')
  ];
  void arrangeNewsServiceWith3Articles() {
    when(
      () => mockNewsService.getArticles(),
    ).thenAnswer((_) async => articlesFromService);
  }

  testWidgets('title is displayed', (widgetTester) async {
    arrangeNewsServiceWith3Articles();
    await widgetTester.pumpWidget(createWidgetUnderTest());
    expect(find.text('News'), findsOneWidget);
  });
}
