import 'package:flutter_test/flutter_test.dart';
import 'package:queue_management/src/queue/domain/value_objects/order.dart';
import 'package:queue_management/src/queue/infra/adapters/json_to_order.dart';

void main() {
  test('Should convert a map into an object of type Order', () {
    final order = JsonToOrder.fromMap({
      'id': 'aabbcc',
      'position': 1,
      'timestamp': '2022-07-30 11:53:35',
      'status': 'attending',
    });

    expect(order, isA<Order>());
    expect(order.status, OrderStatus.attending);
  });
}
