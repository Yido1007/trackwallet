import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:trackwallet/service/storage.dart';

abstract class ApiConstant {
  static const baseUrl = "https://gelir-gider-backend.onrender.com/api";
  static const String login = "/auth/google";
  static const String profile = "/auth/profile";
  static const String categories = "/categories";
  static const String transactions = "/transactions";
  static const String serverClientId =
      "'450435484678-5ph6ljrtatan2819jv4cmdg47e0d2cgp.apps.googleusercontent.com'";
}

// GetX service class:
class ApiService extends GetxService {
  late Storage _storage;
  late Dio _dio;

  // Function that starts the service and makes Dio systems
  Future<ApiService> init() async {
    //Start Dio and storage with basic settings
    Get.find<Storage>();
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl, // API adress
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        contentType: "application/json",
      ),
    );
    // Interceptor that will run on every request
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = _storage.getValue<String>(StorageKeys.userToken);
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await _storage.remove(StorageKeys.userToken);
          }
          return handler.next(error);
        },
      ),
    );

    return this;
  }

  // Method to send GET request
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      print("Dio get error $e");
      rethrow;
    }
  }

  // Method to send Post request
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      print("Dio post error $e");
      rethrow;
    }
  }

  // Method to send Put request
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      print("Dio put error $e");
      rethrow;
    }
  }

  // Method to send Delete request
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      print("Dio delete error $e");
      rethrow;
    }
  }
}
