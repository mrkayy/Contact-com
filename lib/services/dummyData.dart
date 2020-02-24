import '../model/subscriptions.dart';

class DummyData {
  List<SubscriptionOfList> getSubscriptionsList() {
    return [
      SubscriptionOfList(sid:1, sms:"40", plan:"Premium", package:"Full Package", amount:"20,000"),
      SubscriptionOfList(sid:2, sms:"30", plan:"Gold", package:"Full Package", amount:"15,000"),
      SubscriptionOfList(sid:3, sms:"25", plan:"Silver", package:"Normal", amount:"10,000"),
      SubscriptionOfList(sid:4, sms:"20", plan:"Nickel", package:"Medium", amount:"8,000"),
      SubscriptionOfList(sid:5, sms:"10", plan:"Copper", package:"Minimum", amount:"5,000"),
    ];
  }
}
