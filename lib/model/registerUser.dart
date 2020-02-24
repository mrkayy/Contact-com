//Create new user class
class RegisterNewUser {
  String company;
  String address;
  String email;
  String phone;
  String password;
  int sid;

  RegisterNewUser({
    this.sid,
    this.email,
    this.phone,
    this.company,
    this.address,
    this.password,
  });

//   String get companyname => _company;
//   String get address => _address;
//   String get email => _email;
//   String get phone => _phone;
//   String get password => _password;
//   int get sid => _sid;

//   RegisterNewUser.map(dynamic obj) {
//     this._company = obj['companyname'];
//     this._address = obj['address'];
//     this._email = obj['email'];
//     this._phone = obj['phone'];
//     this._password = obj['password'];
//     this._sid = obj['sid'];
//   }

//   //Creating the data toMap
//   Map<String, dynamic> toMap() {
//     var map = new Map<String, dynamic>();

//     map["companyname"] = _company;
//     map["address"] = _address;
//     map["email"] = _email;
//     map["phone"] = _phone;
//     map["password"] = _password;
//     map["sid"] = _sid;

//     return map;
//   }

//   Factory RegisterNewUser.fromMap(Map<String, dynamic> map) {
//     return RegisterNewUser(
//       map["companyname"],
//       map["address"],
//       map["email"],
//       map["phone"],
//       map["password"],
//       map["sid"],
//     );
//   }
// }
}
