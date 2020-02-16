import 'package:flutter/material.dart';

class SubscriptionCard extends StatelessWidget {
  final int id;
  final String plan;
  final String sms;
  final String amount;
  final String package;

  SubscriptionCard({
    this.id,
    this.sms,
    this.plan,
    this.package,
    this.amount,
  });

  // String get id => _id;
  // String get plan => _plan;
  // String get sms => _sms;
  // String get amount => _amount;
  // String get package => _package;

  // Map<String, dynamic> toMap() {
  //   var map = new Map<String, dynamic>();

  //   map["id"] = _id;
  //   map["plan"] = _plan;
  //   map["sms"] = _sms;
  //   map["package"] = _package;
  //   map["amount"] = _amount;

  //   return map;
  // }

  // SubscriptionCard.map(dynamic obj) {
  //   this._id = obj['id'];
  //   this._plan = obj['plan'];
  //   this._sms = obj['sms'];
  //   this._amount = obj['amount'];
  //   this._package = obj['package'];
  // }

  // SubscriptionCard.fromMap(Map<String, dynamic> map) {
  //   this.id = map["id"];
  //   this.plan = map["plan"];
  //   this.sms = map["sms"];
  //   this.amount = map["amount"];
  //   this.package = map["package"];
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(this.id.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(this.plan),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(this.sms),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(this.package),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(this.amount),
            ),
          ],
        ),
      ),
    );
  }
}
