import 'package:demo/pojo/data/data_home.dart';

class CartModel {
  int _id;
  String _orderId;
  String _qty;
  String _price;
  String _priceWithCurrency;
  String _total;

  String _productId;
  String _imageProduct;
  String _nameProduct;
  int _sizeProduct;
  String _comment;

  String get nameProduct => _nameProduct;

  set nameProduct(String value) {
    _nameProduct = value;
  }

  CartModel(
      this._orderId,
      this._qty,
      this._price,
      this._priceWithCurrency,
      this._total,
      this._productId,
      this._imageProduct,
      this._nameProduct,
      this._sizeProduct,
      this._comment);

  CartModel.name(
    this._id,
    this._orderId,
    this._qty,
    this._price,
    this._total,
  );

  String get priceWithCurrency => _priceWithCurrency;

  set priceWithCurrency(String value) {
    _priceWithCurrency = value;
  }

  String get productId => _productId;

  set productId(String value) {
    _productId = value;
  }

  String get total => _total;

  set total(String value) {
    _total = value;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  String get qty => _qty;

  set qty(String value) {
    _qty = value;
  }

  String get orderId => _orderId;

  set orderId(String value) {
    _orderId = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  // this._orderId,
  // this._qty,
  // this._price,
  // this._priceWithCurrency,
  // this._total,
  // this._productId,
  // this._imageProduct,
  // this._nameProduct,
  // this._sizeProduct,
  // this._comment);
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = this._id;
    map["orderId"] = this._orderId;
    map["qty"] = this._qty;
    map["price"] = this._price;
    map["priceWithCurrency"] = this._priceWithCurrency;
    map["total"] = this._total;
    map["productId"] = this._productId;
    map["imageProduct"] = this._imageProduct;
    map["nameProduct"] = this._nameProduct;
    map["sizeProduct"] = this._sizeProduct;
    map["comment"] = this._comment;
    return map;
  }

  CartModel.getMap(Map<String, dynamic> map) {
    this._id = map["id"];
    this._orderId = map["orderId"];
    this._qty = map["qty"];
    this._price = map["price"];
    this._priceWithCurrency = map["priceWithCurrency"];
    this._total = map["total"];
    this._productId = map["productId"];
    this._imageProduct = map["imageProduct"];
    this._nameProduct = map["nameProduct"];

    this._sizeProduct = map["sizeProduct"];
    this._comment = map["comment"];
  }

  int get sizeProduct => _sizeProduct;

  set sizeProduct(int value) {
    _sizeProduct = value;
  }


  String get imageProduct => _imageProduct;

  set imageProduct(String value) {
    _imageProduct = value;
  }

  String get comment => _comment;

  set comment(String value) {
    _comment = value;
  }
}

// class SubTotal {
//   int _price;
//   double _formatted;
//
//   int get price => _price;
//
//   set price(int value) {
//     _price = value;
//   }
//
//   SubTotal(this._price, this._formatted);
//
//   double get formatted => _formatted;
//
//   set formatted(double value) {
//     _formatted = value;
//   }
// }
