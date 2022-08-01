import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queue_management/src/queue/datasource/queue_datasource.dart';

class QueueFirestoreDatasource implements IQueueDataSource {
  final FirebaseFirestore firebaseFirestore;

  QueueFirestoreDatasource(this.firebaseFirestore);

  @override
  Stream<List<Map>> getAllQueues() {
    final ref = firebaseFirestore.collection('queue');

    final snapshot = ref.snapshots();

    return snapshot.map((e) => e.docs).map((_convert));
  }

  List<Map> _convert(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    return docs
        .map((document) => {
              'id': document.id,
              ...document.data(),
            })
        .toList();
  }
}
