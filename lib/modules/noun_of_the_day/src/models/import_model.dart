import 'package:meta/meta.dart';

class ImportModel {
  final List<String> order;
  final DateTime startDate;

  ImportModel({
    @required this.order,
    @required this.startDate,
  });

  factory ImportModel.fromJson(Map<String, dynamic> json) => ImportModel(
        order: List<String>.from(json['order']),
        startDate: DateTime.fromMillisecondsSinceEpoch(json['startDate'] * 1000, isUtc: true),
      );

  Map<String, dynamic> toJson() => {
        'order': List<dynamic>.from(order.map((x) => x)),
        'startDate': startDate,
      };

  @override
  String toString() => toJson().toString();
}
