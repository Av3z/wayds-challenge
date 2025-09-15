class CacheEntryModel {
  final int timestamp;
  final dynamic data;

  CacheEntryModel({required this.timestamp, required this.data});

  factory CacheEntryModel.fromMap(Map<String, dynamic> map) {
    return CacheEntryModel(timestamp: map['timestamp'] as int, data: map['data']);
  }

  Map<String, dynamic> toMap() {
    return {'timestamp': timestamp, 'data': data};
  }
}
