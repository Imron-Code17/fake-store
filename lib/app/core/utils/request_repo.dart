// import 'package:fpdart/fpdart.dart';
// import 'package:jet_market_seller/core/di/injection.dart';
// import 'package:jet_market_seller/core/error/exception/server_exception.dart';
// import 'package:jet_market_seller/core/error/failure/remote_failure.dart';
// import 'package:jet_market_seller/core/mappr/mappr.dart';

// Future<Either<RemoteFailure, Entity>> requestRemote<Entity, Model>(
//     Future<Model> computation) async {
//   try {
//     final result = await computation;
//     final mappr = getIt<Mappr>();
//     final isCanConvert = mappr.canConvert<Model, Entity>();
//     if (Model == List) {
//       return Right(mappr.convertList(result as List) as Entity);
//     } else if (isCanConvert) {
//       return Right(mappr.convert(result));
//     } else {
//       return Right(result as Entity);
//     }
//   } on ServerException catch (e) {
//     return Left(RemoteFailure(e));
//   }
// }

// Future<Either<String, Entity?>> requestLocal<Entity, Model>(
//     Future<Model> computation) async {
//   try {
//     final result = await computation;
//     if (result != null) {
//       final mappr = getIt<Mappr>();
//       final isCanConvert = mappr.canConvert<Model, Entity>();
//       if (Model == List) {
//         return Right(mappr.convertList(result as List) as Entity);
//       } else if (isCanConvert) {
//         return Right(mappr.convert(result));
//       } else {
//         return Right(result as Entity);
//       }
//     } else {
//       return const Right(null);
//     }
//   } catch (e) {
//     return Left(e.toString());
//   }
// }

// Future<Either<RemoteFailure, List<Entity>>> requestRemoteList<Entity, Model>(
//     Future<List<Model>> computation) async {
//   try {
//     final result = await computation;
//     final mappr = getIt<Mappr>();
//     return Right(mappr.convertList(result));
//   } on ServerException catch (e) {
//     return Left(RemoteFailure(e));
//   }
// }
