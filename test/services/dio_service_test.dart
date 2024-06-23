import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:notes_app/data/services/dio_service.dart';

import '../mocks/mocks.mocks.dart';

void main() {
  late DioService dioService;
  late MockDio mockDio;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockDio = MockDio();
    mockConnectivity = MockConnectivity();
    dioService = DioService(dio: mockDio, connectivity: mockConnectivity);
  });

  group('DioService', () {
    const String path = '/test';
    const String baseUrl = 'https://667623b4a8d2b4d072f285f0.mockapi.io/api/v4';
    final testData = {'id': '1', 'title': 'Test'};

    void setUpMockConnectivitySuccess() {
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.mobile);
    }

    void setUpMockConnectivityFailure() {
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);
    }

    test('get makes a GET request and returns data on success', () async {
      final response = Response(
        requestOptions: RequestOptions(path: path),
        data: testData,
        statusCode: 200,
      );
      setUpMockConnectivitySuccess();
      when(mockDio.get('$baseUrl$path'))
          .thenAnswer((_) async => Future.value(response));

      final result = await dioService.get(path);

      expect(result, equals(testData));
      verify(mockDio.get('$baseUrl$path')).called(1);
    });

    test('get throws an exception when there is no internet connectivity',
        () async {
      setUpMockConnectivityFailure();

      expect(() => dioService.get(path), throwsA('No Internet Connection'));
    });

    test('post makes a POST request and returns data on success', () async {
      setUpMockConnectivitySuccess();
      final response = Response(
        requestOptions: RequestOptions(path: path),
        data: testData,
        statusCode: 200,
      );
      when(mockDio.post('$baseUrl$path', data: testData))
          .thenAnswer((_) async => response);

      final result = await dioService.post(path, testData);

      expect(result, equals(testData));
      verify(mockDio.post('$baseUrl$path', data: testData)).called(1);
    });

    test('put makes a PUT request and returns data on success', () async {
      setUpMockConnectivitySuccess();
      final response = Response(
        requestOptions: RequestOptions(path: path),
        data: testData,
        statusCode: 200,
      );
      when(mockDio.put('$baseUrl$path', data: testData))
          .thenAnswer((_) async => response);

      final result = await dioService.put(path, testData);

      expect(result, equals(testData));
      verify(mockDio.put('$baseUrl$path', data: testData)).called(1);
    });

    test('delete makes a DELETE request and returns data on success', () async {
      setUpMockConnectivitySuccess();
      final response = Response(
        requestOptions: RequestOptions(path: path),
        data: testData,
        statusCode: 200,
      );
      when(mockDio.delete('$baseUrl$path')).thenAnswer((_) async => response);

      final result = await dioService.delete(path);

      expect(result, equals(testData));
      verify(mockDio.delete('$baseUrl$path')).called(1);
    });

    test('handles DioException correctly', () async {
      setUpMockConnectivitySuccess();
      when(mockDio.get('$baseUrl$path')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: path),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      expect(() => dioService.get(path), throwsA('Connection Timeout'));
    });
  });
}
