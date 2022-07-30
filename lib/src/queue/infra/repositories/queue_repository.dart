import 'package:queue_management/src/queue/datasource/queue_datasource.dart';
import 'package:queue_management/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_management/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue_management/src/queue/infra/adapters/json_to_queue.dart';

class QueueRepository implements IQueueRepository {
  final IQueueDataSource dataSource;

  QueueRepository(this.dataSource);

  @override
  Stream<List<QueueEntity>> getAllQueues() {
    final stream = dataSource.getAllQueues();

    return stream.map(_convert);
  }

  List<QueueEntity> _convert(List<Map> list) {
    return list.map(JsonToQueue.fromMap).toList();
  }
}
