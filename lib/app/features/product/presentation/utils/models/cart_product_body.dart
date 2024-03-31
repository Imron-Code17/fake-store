class CartBody {
  int? id;
  String? title;
  double? price;
  String? image;
  int? qty;

  CartBody({this.id, this.title, this.price, this.image, this.qty});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['image'] = image;
    data['qty'] = qty;
    return data;
  }
}
