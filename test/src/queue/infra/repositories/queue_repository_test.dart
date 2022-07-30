import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_management/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_management/src/queue/infra/repositories/queue_repository.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('Should return a list of objects of type QueueEntity', () {
    final dataSource = IQueueDataSourceMock();
    when(() => dataSource.getAllQueues()).thenAnswer(
      (_) => Stream.value(
        [
          {
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
          },
        ],
      ),
    );

    final repository = QueueRepository(dataSource);
    final result = repository.getAllQueues();

    expect(result, emits(isA<List<QueueEntity>>()));
  });
}
