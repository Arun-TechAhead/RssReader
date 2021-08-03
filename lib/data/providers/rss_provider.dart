import 'package:dio/dio.dart';
import 'package:flutter_rss/data/api/api_constants.dart';
import 'package:flutter_rss/data/api/api_response.dart';
import 'package:flutter_rss/data/api/api_service.dart';
import 'package:flutter_rss/utils/utility.dart';

class RssProvider {
  RssProvider({this.api});

  ApiService api;

  Map<String, dynamic> get defaultParams => {
        "key": api.env.apiKey, // all
      };

  Future<ApiResponse> getRssList() async {
    Utility.hideKeyboard();
    try {
      final response = await api.dio.get(ApiConstants.RSS_FEED,
          options: Options(
              method: 'GET',
              contentType: "application/xml",
              responseType: ResponseType.json // or ResponseType.JSON
              ));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse.success(response);
      } else {
        return ApiResponse.failure(null);
      }
    } catch (e) {
      print(" Error $e");
      //return ApiResponse.failure(error: e);
    }
  }

  Future<ApiResponse> getTrendingRssList() async {
    Utility.hideKeyboard();
    try {
      final response = await api.dio.get(ApiConstants.RSS_TRENDING_FEED,
          options: Options(
              method: 'GET',
              contentType: "application/xml",
              responseType: ResponseType.json // or ResponseType.JSON
              ));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse.success(response);
      } else {
        return ApiResponse.failure(null);
      }
    } catch (e) {
      print(" Error $e");
      //return ApiResponse.failure(error: e);
    }
  }
}
