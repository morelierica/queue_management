import 'package:queue_management/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_management/src/queue/infra/adapters/json_to_order.dart';

class JsonToQueue {
  static QueueEntity fromMap(dynamic json) {
    return QueueEntity(
      id: json['id'],
      title: json['title'],
      abbreviation: json['abbreviation'],
      priority: json['priority'],
      orders: json.containsKey('orders')
          ? (json['orders'] as List).map(JsonToOrder.fromMap).toList()
          : [],
    );
  }
}
