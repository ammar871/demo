class FavoraiteModel{


  String _id2 ;
  String _orderId2 ;
  String _pricefav ;
  String _pricewithcurrencyfav ;
  String _productIdfav ;
  String __imageProductfav ;
  String __nameProductfav;

  FavoraiteModel(this._orderId2, this._pricefav, this._pricewithcurrencyfav,
      this._productIdfav, this.__imageProductfav, this.__nameProductfav);

  FavoraiteModel.withId(
      this._id2,
      this._orderId2,
      this._pricefav,
      this._pricewithcurrencyfav,
      this._productIdfav,
      this.__imageProductfav,
      this.__nameProductfav);

  String get _nameProductfav => __nameProductfav;

  set _nameProductfav(String value) {
    __nameProductfav = value;
  }

  String get _imageProductfav => __imageProductfav;

  set _imageProductfav(String value) {
    __imageProductfav = value;
  }

  String get productIdfav => _productIdfav;

  set productIdfav(String value) {
    _productIdfav = value;
  }

  String get pricewithcurrencyfav => _pricewithcurrencyfav;

  set pricewithcurrencyfav(String value) {
    _pricewithcurrencyfav = value;
  }

  String get pricefav => _pricefav;

  set pricefav(String value) {
    _pricefav = value;
  }

  String get orderId2 => _orderId2;

  set orderId2(String value) {
    _orderId2 = value;
  }

  String get id2 => _id2;

  set id2(String value) {
    _id2 = value;
  }
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = this._id2;
    map["orderId"] = this._orderId2;
    map["price"] = this._pricefav;
    map["priceWithCurrency"] = this._pricewithcurrencyfav;
    map["productId"] = this._productIdfav;
    map["imageProduct"] = this.__imageProductfav;
    map["nameProduct"] = this.__nameProductfav;

    return map;
  }
  FavoraiteModel.getMap(Map<String, dynamic> map) {
    this._id2 = map["id"];
    this._orderId2 = map["orderId"];

    this._pricefav = map["price"];
    this._pricewithcurrencyfav = map["priceWithCurrency"];

    this._productIdfav = map["productId"];
    this.__imageProductfav = map["imageProduct"];
    this.__nameProductfav = map["nameProduct"];


  }
}