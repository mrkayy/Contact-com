import '../model/subscription.dart';

class DummyData {
  List<SubscriptionsList> getSubscriptionsList() {
    return [
      SubscriptionsList(
          id: 1,
          sms: "40",
          plan: "Premium",
          description: "Full Package",
          amount: "20,000"),
      SubscriptionsList(
          id: 2,
          sms: "30",
          plan: "Gold",
          description: "Full Package",
          amount: "15,000"),
      SubscriptionsList(
          id: 3,
          sms: "25",
          plan: "Silver",
          description: "Normal",
          amount: "10,000"),
      SubscriptionsList(
          id: 4,
          sms: "20",
          plan: "Nickel",
          description: "Medium",
          amount: "8,000"),
      SubscriptionsList(
          id: 5,
          sms: "10",
          plan: "Copper",
          description: "Minimum",
          amount: "5,000"),
    ];
  }
}
