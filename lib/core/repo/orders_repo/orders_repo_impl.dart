import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/repo/orders_repo/orders_repo.dart';
import 'package:e_commerce/core/services/database_service.dart';
import 'package:e_commerce/core/utils/backend_endpoint.dart';
import 'package:e_commerce/features/checkout/data/model/order_model.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService fireStoreService;
  OrdersRepoImpl({required this.fireStoreService});
  @override
  Future<Either<Failure, void>> addOrder({required OrderEntity order}) async {
    try {
      await fireStoreService.addData(
        collectionPath: BackendEndpoint.addOrder,
        data: OrderModel.fromEntity(order).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
