import 'package:news_app_clean_arch/core/resources/data_state.dart';
import 'package:news_app_clean_arch/features/daily_news/data/models/article.dart';
import 'package:news_app_clean_arch/features/daily_news/domain/entities/aticle.dart';
import 'package:news_app_clean_arch/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    
  }

}