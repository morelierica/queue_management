import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:queue_management/src/queue/external/queue_firestore_datasource.dart';

void main() {
  test('description', () async {
    final firebaseFirestore = FakeFirebaseFirestore();

    await firebaseFirestore.collection('queue').add(
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
    );

    final dataSource = QueueFirestoreDatasource(firebaseFirestore);
    final result = dataSource.getAllQueues();

    expect(result, emits(isA<List<Map>>()));
  });
}
