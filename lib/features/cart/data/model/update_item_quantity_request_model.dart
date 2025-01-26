class UpdateQuantityRequest {
  final int productId;
  final int quantity;

  UpdateQuantityRequest({required this.productId, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}
