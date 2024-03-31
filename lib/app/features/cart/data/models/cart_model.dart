class CartModel {
  int? id;
  String? title;
  double? price;
  String? image;
  int? qty;

  CartModel({this.id, this.title, this.price, this.image, this.qty});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    image = json['image'];
    qty = json['qty'];
  }

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
