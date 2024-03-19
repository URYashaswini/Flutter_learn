import 'package:apicalling/data/mobile_data_interceptor.dart';
import 'package:chopper/chopper.dart';
part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response> getPosts();
  @Get(path: '/{id}')
  Future<Response> getPost(@Path('id') int id);

  @Post()
  Future<Response> postPost(@Body() Map<String, dynamic> body);

  static PostApiService create() {
    final client = ChopperClient(
        baseUrl: Uri.parse('https://jsonplaceholder.typicode.com'),
        services: [_$PostApiService()],
        interceptors: [
          const HeadersInterceptor({'Cache-Control': 'no-cache'}),
          //  HttpLoggingInterceptor(),
          CurlInterceptor(),
          (Request request) async {
            if (request.method == HttpMethod.Post) {
              chopperLogger.info('Perfromed a POST Request');
            }
            return request;
          },
          (Response response) async {
            if (response.statusCode == 404) {
              chopperLogger.info('404 NOT FOUND');
            } else if (response.statusCode == 200) {
              chopperLogger.info('2002 DATA FETCHED');
            }
            return response;
          },
          MobileDataInterceptor(),
        ],
        converter: const JsonConverter());
    return _$PostApiService(client);
  }
}
