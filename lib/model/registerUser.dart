//Create new user class
class CreateAccount {
  String company;
  String address;
  String email;
  String phone;
  String password;
  int sid;

  CreateAccount({
    this.sid,
    this.email,
    this.phone,
    this.company,
    this.address,
    this.password,
  });

  // String get companyname => _company;
  // String get address => _address;
  // String get email => _email;
  // String get phone => _phone;
  // String get password => _password;
  // int get sid => _sid;

  CreateAccount.map(dynamic obj) {
    this.company = obj['companyname'];
    this.address = obj['address'];
    this.email = obj['email'];
    this.phone = obj['phone'];
    this.password = obj['password'];
    this.sid = obj['sid'];
  }

  //Creating the data toMap
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["companyname"] = company;
    map["address"] = address;
    map["email"] = email;
    map["phone"] = phone;
    map["password"] = password;
    map["id"] = sid;

    return map;
  }

  factory CreateAccount.fromMap(Map<String, dynamic> map) {
    return CreateAccount(
      company: map["companyname"],
      address: map["address"],
      email: map["email"],
      phone: map["phone"],
      password: map["password"],
      sid: map["id"],
    );
  }
}
