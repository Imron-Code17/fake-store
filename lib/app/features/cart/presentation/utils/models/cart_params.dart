import '../typedef.dart';

class CartParams {
  final ProductId? productId;
  final ProductQuantity? quantity;
  CartParams({
    this.productId,
    this.quantity,
  });
}
