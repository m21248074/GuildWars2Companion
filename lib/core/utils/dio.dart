import 'package:dio/dio.dart';
import 'package:guildwars2_companion/core/utils/chinese_converter.dart';
import 'package:guildwars2_companion/core/utils/urls.dart';
import 'package:guildwars2_companion/features/configuration/services/configuration.dart';
import 'package:guildwars2_companion/features/account/services/token.dart';
import 'package:meta/meta.dart';

class DioUtil {
  final TokenService tokenService;
  final ConfigurationService configurationService;

  DioUtil({
    @required this.tokenService,
    @required this.configurationService
  });

  Dio getDioInstance({
    bool includeTokenInterceptor = true
  }) {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        followRedirects: false,
        validateStatus: (status) => status < 500,
        connectTimeout: 20000,
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        if (configurationService.apiLanguage != 'en') {
          options.headers.addAll({'Accept-Language': configurationService.apiLanguage});
        }

        return options;
      },
      onResponse: (Response response) async {
        if (configurationService.convertToTraditional) {
          await ChineseConverter.ensureLoaded();
          response.data = ChineseConverter.convertJson(response.data);
        }

        return response;
      }
    ));

    if (includeTokenInterceptor) {
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          return options..headers.addAll({
            'Authorization': 'Bearer ${await tokenService.getToken()}',
          });
        }
      ));
    }

    return dio;
  }
}