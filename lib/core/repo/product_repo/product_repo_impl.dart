import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/model/product_model.dart';
import 'package:e_commerce/core/repo/product_repo/product_repo.dart';
import 'package:e_commerce/core/services/database_service.dart';
import 'package:e_commerce/core/utils/backend_endpoint.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, ProductEntity>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getData(
                collectionPath: BackendEndpoint.getProducts,
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return Right(products);
    } catch (e) {
      return left(ServerFailure("Failed to get Products "));
    }
  }
}
