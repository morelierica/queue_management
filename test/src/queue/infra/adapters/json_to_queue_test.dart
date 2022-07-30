import 'package:flutter_test/flutter_test.dart';
import 'package:queue_management/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_management/src/queue/domain/value_objects/order.dart';
import 'package:queue_management/src/queue/infra/adapters/json_to_queue.dart';

void main() {
  test('Should convert a map into an object of type QueueEntity', () {
    final queue = JsonToQueue.fromMap({
      'id': 'aabbcc',
      'title': 'title',
      'abbreviation': 'aa',
      'priority': 1,
      'orders': [
        {
          'id': 'aabbcc',
          'position': 1,
          'timestamp': '2022-07-30 11:53:35',
          'status': 'attending',
        },
      ],
    });

    expect(queue, isA<QueueEntity>());
    expect(queue.title, 'title');
    expect(queue.abbreviation, 'aa');
    expect(queue.priority, 1);
    expect(queue.orders.first.id, 'aabbcc');
    expect(queue.orders.first.position, 1);
    expect(queue.orders.first.timestamp, DateTime.parse('2022-07-30 11:53:35'));
    expect(queue.orders.first.status, OrderStatus.attending);
  });
}
