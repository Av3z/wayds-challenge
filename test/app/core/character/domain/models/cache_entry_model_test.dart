import 'package:flutter_test/flutter_test.dart';
import 'package:wayds_challenge/app/core/character/domain/models/cache_entry_model.dart';

void main() {
  group('CacheEntryModel', () {
    test('constructor assigns values', () {
      final entry = CacheEntryModel(timestamp: 123456, data: 'testdata');
      expect(entry.timestamp, 123456);
      expect(entry.data, 'testdata');
    });

    test('toMap returns correct map', () {
      final entry = CacheEntryModel(timestamp: 987654, data: {'foo': 'bar'});
      final map = entry.toMap();
      expect(map['timestamp'], 987654);
      expect(map['data'], {'foo': 'bar'});
    });

    test('fromMap creates correct instance', () {
      final map = {
        'timestamp': 555,
        'data': [1, 2, 3],
      };
      final entry = CacheEntryModel.fromMap(map);
      expect(entry.timestamp, 555);
      expect(entry.data, [1, 2, 3]);
    });
  });
}
