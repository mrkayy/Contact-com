class RegisterNewUser {
  String _company;
  String _address;
  String _email;
  String _phone;
  String _password;
  int _sid;

  RegisterNewUser(
    this._sid,
    this._email,
    this._phone,
    this._company,
    this._address,
    this._password,
  );

  String get companyname => _company;
  String get address => _address;
  String get email => _email;
  String get phone => _phone;
  String get password =>_password;
  int get sid => _sid;

  RegisterNewUser.map(dynamic obj) {
    this._company = obj['companyname'];
    this._address = obj['address'];
    this._email = obj['email'];
    this._phone = obj['phone'];
    this._password = obj['password'];
    this._sid = obj['sid'];
  }

  //Creating the data toMap
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["companyname"] = _company;
    map["address"] = _address;
    map["email"] = _email;
    map["phone"] = _phone;
    map["password"] = _password;
    map["sid"] = _sid;

    return map;
  }

  RegisterNewUser.fromMap(Map<String, dynamic> map) {
    this._company = map["companyname"];
    this._address = map["address"];
    this._email = map["email"];
    this._phone = map["phone"];
    this._password = map["password"];
    this._sid = map["sid"];
  }
}
