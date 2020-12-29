import 'dart:async';

import 'package:dio/dio.dart';
import 'package:e_mobiz/common/build/build_config.dart';
import 'package:e_mobiz/dj/injection/injection.dart';

class ApiModule extends DIModule {
  @override
  provides() async {
    final dio = await setup();
    Injection.getIt.registerSingleton(dio);
  }

  static FutureOr<Dio> setup() async {
    final options = BaseOptions(
      connectTimeout: BuildConfig.get().connectTimeout,
      receiveTimeout: BuildConfig.get().receiveTimeout,
      responseType: ResponseType.json,
      contentType: "application/json",
      validateStatus: (status) {
        return true;
      },
      baseUrl: BuildConfig.get().baseUrl,
    );
    final Dio dio = Dio(options);

    /// Unified add authentication request header
    // dio.interceptors.add(AuthInterceptor());

    /// Adapt data (according to your own data structure, you can choose to add it)
//    dio.interceptors.add(TokenInterceptor());

    /// Print Log (production mode removal)
    if (BuildConfig.get().flavor != Flavor.RELEASE) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return dio;
  }
}