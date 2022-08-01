import 'package:mocktail/mocktail.dart';
import 'package:queue_management/src/queue/datasource/queue_datasource.dart';
import 'package:queue_management/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_management/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue_management/src/queue/domain/usecases/get_all_queues.dart';

class QueueRepositoryMock extends Mock implements IQueueRepository {}

class QueueEntityMock extends Mock implements QueueEntity {}

class IQueueDataSourceMock extends Mock implements IQueueDataSource {}

class IGetAllQueuesMock extends Mock implements IGetAllQueues {}
