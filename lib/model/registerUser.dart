class RegisterNewUser {
  String _company;
  String _address;
  String _email;
  String _phone;
  String _password;
  String _subscriptionID;

  RegisterNewUser(
    this._company,
    this._address,
    this._email,
    this._password,
    this._phone,
    this._subscriptionID,
  );

  String get company => _company;
  String get address => _address;
  String get email => _email;
  String get phone => _phone;
  String get password =>_password;
  String get subscriptionID => _subscriptionID;

  RegisterNewUser.map(dynamic obj) {
    this._company = obj['company'];
    this._address = obj['address'];
    this._email = obj['email'];
    this._phone = obj['phone'];
    this._password = obj['password'];
    this._subscriptionID = obj['_subscriptionID'];
  }

  //Creating the data toMap
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["company"] = _company;
    map["address"] = _address;
    map["email"] = _email;
    map["phone"] = _phone;
    map["password"] = _password;
    map["_subscriptionID"] = _subscriptionID;

    return map;
  }

  RegisterNewUser.fromMap(Map<String, dynamic> map) {
    this._company = map["company"];
    this._address = map["lName"];
    this._email = map["email"];
    this._phone = map["phone"];
    this._password = map["password"];
    this._subscriptionID = map["subscriptionID"];
  }
}
