import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:queue_management/src/queue/datasource/queue_datasource.dart';
import 'package:queue_management/src/queue/domain/usecases/get_all_queues.dart';
import 'package:queue_management/src/queue/external/queue_firestore_datasource.dart';
import 'package:queue_management/src/queue/infra/repositories/queue_repository.dart';

import 'domain/repositories/queue_repository.dart';

final queueModule = [
  Provider.value(value: FirebaseFirestore.instance),
  Provider<IQueueDataSource>(
      create: (context) => QueueFirestoreDatasource(context.read())),
  Provider<IQueueRepository>(
      create: (context) => QueueRepository(context.read())),
  Provider<IGetAllQueues>(create: (context) => GetAllQueues(context.read())),
];
