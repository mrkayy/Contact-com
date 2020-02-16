import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/apiResponse.dart';
import '../model/subscriptions.dart';

class NetWorkServices {
  static const String baseUrl = "http://192.168.43.225:8000/api";
  static const String getSubscription = "$baseUrl/subscription";
//   final String validateUserUrl = "/account/exit/data";
//   final String createUserUrl = "/account/exit/data";

  Future<APIResponse<List<SubscriptionList>>> getSubscriptionList() {
    return http.get(Uri.encodeFull(getSubscription),
        headers: {"Accept": "application/json"}).then((data) {
      if (data.statusCode == 200) {
        var jsonData = jsonDecode(data.body);
        var subscriptionPlans = <SubscriptionList>[];

        for (var item in jsonData) {
          final subPlans = SubscriptionList(
            item['id'],
            item['sms'],
            item['plan'],
            item['package'],
            item['amount'],
          );
          subscriptionPlans.add(subPlans);
        }
        return APIResponse<List<SubscriptionList>>(data: subscriptionPlans);
      }
      return APIResponse<List<SubscriptionList>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((onError) => APIResponse<List<SubscriptionList>>(
        errorMessage: onError, error: true));
  }
}
