import 'package:http/http.dart' as https;
import 'dart:async';
import 'dart:convert';

import '../model/apiResponse.dart';
import '../model/subscriptions.dart';

class ApiServices {
  static const baseUrl = "";
  static const header = {"Accept": "application/json"};

  Future<APIResponse<List<SubscriptionOfList>>> getSubscriptions() {
    return https
        .get(Uri.encodeFull(baseUrl), headers: header)
        .then((data) {
          if(data.statusCode == 200){
            final jsonData = json.decode(data.body);
            final subscriptions = <SubscriptionOfList>[];
            for(var item in jsonData){
              final subscription = SubscriptionOfList(
                sid: item.sid,
              );
              subscriptions.add(subscription);
            }
            return APIResponse<List<SubscriptionOfList>>(data: subscriptions);
          }
           return APIResponse<List<SubscriptionOfList>>(error: true,errorMessage: "oops! an error occured");
        }).catchError((err){
          return APIResponse<List<SubscriptionOfList>>(error: true,errorMessage: "oops! an error occured {$err}");
        });
  }
}
