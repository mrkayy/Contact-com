class SubscriptionsList {
  int id;
  String sms;
  String plan;
  String description;
  String amount;

  SubscriptionsList({
    this.id,
    this.sms,
    this.plan,
    this.description,
    this.amount,
  });

  // int get id => _sid;
  // String get sms => _sms;
  // String get plan => _plan;
  // String get description => _description;
  // String get amount => _amount;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["id"] = id;
    map["sms"] = sms;
    map["plan"] = plan;
    map["description"] = description;
    map["amount"] = amount;

    return map;
  }

  SubscriptionsList.map(dynamic obj) {
    this.id = obj['id'];
    this.sms = obj['sms'];
    this.plan = obj['plan'];
    this.description = obj['description'];
    this.amount = obj['amount'];
  }

  SubscriptionsList.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.sms = map["sms"];
    this.plan = map["plan"];
    this.description = map["description"];
    this.amount = map["amount"];
  }
}
