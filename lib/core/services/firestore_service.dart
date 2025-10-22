import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/database_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String collectionPath,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      firestore.collection(collectionPath).doc(documentId).set(data);
    } else {
      await firestore.collection(collectionPath).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String collectionPath,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await firestore
          .collection(collectionPath)
          .doc(documentId)
          .get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(collectionPath);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> isUserExist({
    required String collectionPath,
    required String documentId,
  }) async {
    var data = await firestore.collection(collectionPath).doc(documentId).get();
    return data.exists;
  }
}
