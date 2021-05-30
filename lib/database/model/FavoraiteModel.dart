class FavoraiteModel {

  int _id;
  String _price;
  String _priceWithCurrency;
  String _productId;
  String _imageProduct;
  String _nameProduct;
  String _descProduct;
  String get nameProduct => _nameProduct;

  set nameProduct(String value) {
    _nameProduct = value;
  }

  FavoraiteModel(
    this._price,
    this._priceWithCurrency,
    this._productId,
    this._imageProduct,
    this._nameProduct
      ,this._descProduct
  );

  FavoraiteModel.withId(
    this._id,
    this._price,
    this._priceWithCurrency,
    this._productId,
    this._imageProduct,
    this._nameProduct,
      this._descProduct
  );

  String get descProduct => _descProduct;

  set descProduct(String value) {
    _descProduct = value;
  }

  String get priceWithCurrency => _priceWithCurrency;

  set priceWithCurrency(String value) {
    _priceWithCurrency = value;
  }

  String get productId => _productId;

  set productId(String value) {
    _productId = value;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = this._id;

    map["price"] = this._price;
    map["priceWithCurrency"] = this._priceWithCurrency;

    map["productId"] = this._productId;
    map["imageProduct"] = this._imageProduct;
    map["nameProduct"] = this._nameProduct;
    map["descProduct"] = this._descProduct;
    return map;
  }

  FavoraiteModel.getMap(Map<String, dynamic> map) {
    this._id = map["id"];

    this._price = map["price"];
    this._priceWithCurrency = map["priceWithCurrency"];

    this._productId = map["productId"];
    this._imageProduct = map["imageProduct"];
    this._nameProduct = map["nameProduct"];
 this._descProduct=   map["descProduct"];
  }

  String get imageProduct => _imageProduct;

  set imageProduct(String value) {
    _imageProduct = value;
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
