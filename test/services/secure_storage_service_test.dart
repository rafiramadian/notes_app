import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/data/services/secure_storage_service.dart';

import '../mocks/mocks.mocks.dart';

void main() {
  late SecureStorageService secureStorageService;
  late MockFlutterSecureStorage mockFlutterSecureStorage;

  setUp(() {
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    secureStorageService = SecureStorageService(
      secureStorageService: mockFlutterSecureStorage,
    );
  });

  group('SecureStorageService', () {
    const String key = 'testKey';
    const String data = 'testData';

    test('write stores data successfully', () async {
      when(mockFlutterSecureStorage.write(key: key, value: data))
          .thenAnswer((_) async => Future.value());

      await secureStorageService.write(key: key, data: data);

      verify(mockFlutterSecureStorage.write(key: key, value: data)).called(1);
    });

    test('read retrieves data successfully', () async {
      when(mockFlutterSecureStorage.read(key: key))
          .thenAnswer((_) async => data);

      final result = await secureStorageService.read(key: key);

      expect(result, equals(data));
      verify(mockFlutterSecureStorage.read(key: key)).called(1);
    });

    test('delete removes data successfully', () async {
      when(mockFlutterSecureStorage.delete(key: key))
          .thenAnswer((_) async => Future.value());

      await secureStorageService.delete(key: key);

      verify(mockFlutterSecureStorage.delete(key: key)).called(1);
    });
  });
}
