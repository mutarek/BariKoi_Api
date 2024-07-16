import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:recepi_app_with_dio/screen/home/models/response/district_response.dart';

import '../../../network/dio_client.dart';
import '../../../network/dio_exceptions.dart';
import '../../../utils/url_utils.dart';

class HomeRepo {
  Future<DistrictResponse> getAllDistrictList() async {
    try {
      Response response = await DioClient().dio.get(
            UrlUtils.baseUrl + UrlUtils.getDistrictListUrl,
            options: Options(
              headers: {
                'Content-Type': 'application/json',
              },
            ),
          );
      return DistrictResponse.fromJson(response.data);
    } catch (e) {
      var errorMessage = e.toString();
      if (e is DioException) {
        errorMessage = DioExceptions.fromDioError(e).toString();
      }
      if (kDebugMode) {
        print(errorMessage);
      }

      return DistrictResponse(status: 0);
    }
  }

  Future<DistrictResponse> getSubDistrcits(String district) async {
    try {
      Response response = await DioClient().dio.get(
            UrlUtils.baseUrl + UrlUtils.getSubDistrictsUrl + district,
            options: Options(
              headers: {
                'Content-Type': 'application/json',
              },
            ),
          );
      return DistrictResponse.fromJson(response.data);
    } catch (e) {
      var errorMessage = e.toString();
      if (e is DioException) {
        errorMessage = DioExceptions.fromDioError(e).toString();
      }
      if (kDebugMode) {
        print(errorMessage);
      }

      return DistrictResponse(status: 0);
    }
  }
}
