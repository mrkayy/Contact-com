class SubscriptionList {
  int _id;
  String _sms;
  String _plan;
  String _package;
  String _amount;

  SubscriptionList(
    this._id,
    this._sms,
    this._plan,
    this._package,
    this._amount,
  );

  int get id => _id;
  String get sms => _sms;
  String get plan => _plan;
  String get package => _package;
  String get amount => _amount;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["id"] = _id;
    map["sms"] = _sms;
    map["plan"] = _plan;
    map["package"] = _package;
    map["amount"] = _amount;

    return map;
  }

  SubscriptionList.map(dynamic obj) {
    this._id = obj['id'];
    this._sms = obj['sms'];
    this._plan = obj['plan'];
    this._package = obj['package'];
    this._amount = obj['amount'];
  }

  SubscriptionList.fromMap(Map<String, dynamic> map) {
    this._id = map["id"];
    this._sms = map["sms"];
    this._plan = map["plan"];
    this._package = map["package"];
    this._amount = map["amount"];
  }
}
