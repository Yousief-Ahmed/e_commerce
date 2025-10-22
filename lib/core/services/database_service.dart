abstract class DatabaseService {
  Future<void> addData({
    required String collectionPath,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<dynamic> getData({
    required String collectionPath,
    String? documentId,
    Map<String, dynamic>? query,
  });

  Future<bool> isUserExist({
    required String collectionPath,
    required String documentId,
  });
}
