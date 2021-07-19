class Product {
  int _id;
  double _price;
  String _name;
  String _status;
  String _image;
  int _count;
  int _backendid;

  Product(this._count, this._image, this._name, this._price, this._status,
      this._backendid);

  Product.withId(this._id, this._count, this._image, this._name, this._price,
      this._backendid, this._status);

  int get id => _id;

  double get price => _price;

  String get name => _name;

  int get count => _count;
  int get backendid => _backendid;

  String get status => _status;
  String get image => _image;

  set name(String newTitle) {
    if (newTitle.length <= 255) {
      this._name = newTitle;
    }
  }

  set backendid(int newTitle) {
    this._backendid = newTitle;
  }

  set image(String newDescription) {
    if (newDescription.length <= 255) {
      this._image = newDescription;
    }
  }

  set price(double newPriority) {
    this._price = newPriority;
  }

  set count(int newPriority) {
    {
      this._count = newPriority;
    }
  }

  set status(String newDate) {
    this._status = newDate;
  }

  // Convert a product object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['status'] = _status;
    map['count'] = _count;
    map['price'] = _price;
    map['image'] = _image;
    map['backendid'] = _backendid;

    return map;
  }

  // Extract a product object from a Map object
  Product.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._status = map['status'];
    this._price = map['price'];
    this._count = map['count'];
    this._image = map['image'];
    this._backendid = map['backendid'];
  }
}
