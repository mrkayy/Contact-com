class SubscriptionOfList {
  int sid;
  String sms;
  String plan;
  String package;
  String amount;

  SubscriptionOfList({
    this.sid,
    this.sms,
    this.plan,
    this.package,
    this.amount,
  });

  // int get sid => _sid;
  // String get sms => _sms;
  // String get plan => _plan;
  // String get package => _package;
  // String get amount => _amount;

/*
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["sid"] = _sid;
    map["sms"] = _sms;
    map["plan"] = _plan;
    map["package"] = _package;
    map["amount"] = _amount;

    return map;
  }

  SubscriptionOfList.map(dynamic obj) {
    this._sid = obj['sid'];
    this._sms = obj['sms'];
    this._plan = obj['plan'];
    this._package = obj['package'];
    this._amount = obj['amount'];
  }

  SubscriptionOfList.fromMap(Map<String, dynamic> map) {
    this._sid = map["sid"];
    this._sms = map["sms"];
    this._plan = map["plan"];
    this._package = map["package"];
    this._amount = map["amount"];
  }*/
}
