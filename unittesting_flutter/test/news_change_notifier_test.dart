import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unittesting_flutter/article.dart';
import 'package:unittesting_flutter/news_change_notifier.dart';
import 'package:unittesting_flutter/news_service.dart';

class MockNewsService extends Mock implements NewsService {}

void main() {
  late NewsChangeNotifier sut;
  late MockNewsService mockNewsService;
  setUp(() {
    mockNewsService = MockNewsService();
    sut = NewsChangeNotifier(mockNewsService);
  });
  test("initial values are correct", () {
    expect(sut.articles, []);
    expect(sut.isLoading, false);
  });
  group('get Articles', () {
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

    test(
      'get articles using the NewsService',
      () async {
        arrangeNewsServiceWith3Articles();
        await sut.getArticles();
        verify(
          () => mockNewsService.getArticles(),
        ).called(1);
      },
    );
    test(
      """indicates loading of data,
        sets articles to ones from service,
        indicates that data is not beign loaded anymore""",
      () async {
        arrangeNewsServiceWith3Articles();
        final future = sut.getArticles();
        expect(sut.isLoading, true);
        await future;
        expect(sut.articles, articlesFromService);
        expect(sut.isLoading, false);
      },
    );
  });
}
