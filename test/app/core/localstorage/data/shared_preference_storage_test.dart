import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/local_storage_mock.dart';

void main() {
  test('LocalStorage interface has required methods', () {
    final localStorage = LocalStorageMock();

    expect(localStorage.saveData('key', 'value'), isA<Future<void>>());
    expect(localStorage.getData('key'), completion(equals('value')));
  });

  test('LocalStorage deleteData removes data', () async {
    final localStorage = LocalStorageMock();
    await localStorage.saveData('key', 'value');
    expect(await localStorage.getData('key'), equals('value'));

    await localStorage.deleteData('key');
    expect(await localStorage.getData('key'), isNull);
  });
}
