import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_management/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_management/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue_management/src/queue/domain/usecases/get_all_queues.dart';

class QueueRepositoryMock extends Mock implements IQueueRepository {}

class QueueEntityMock extends Mock implements QueueEntity {}

void main() {
  test('Should return a list of QueueEntity', () {
    final repository = QueueRepositoryMock();
    final entity = QueueEntityMock();

    when(() => repository.getAllQueues())
        .thenAnswer((_) => Stream.value([entity]));

    final usecase = GetAllQueues(repository);
    final result = usecase.call();

    expect(result, emits(isA<List<QueueEntity>>()));
  });
}
