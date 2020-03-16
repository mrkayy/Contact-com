import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as https;

import '../model/registerUser.dart';
import '../model/apiResponse.dart';
import '../model/create_institution.dart';
import '../model/subscription.dart';

class ApiServices {
  static const baseUrl = "http://caresity.com/api";
  static const header = {"Accept": "application/json"};
  static const getSubscriptionsApi = "$baseUrl/subscription";
  static const createAccountApi = "$baseUrl/account";

//Get available subscriptions form api
  Future<APIResponse<List<SubscriptionsList>>> getSubscriptions() async {
    // var response;
    return https.get(getSubscriptionsApi, headers: header).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final subscriptions = <SubscriptionsList>[];
        for (var item in jsonData) {
          // final subscription = SubscriptionsList(
          //   id: item['id'],
          //   amount: item['amount'],
          //   sms: item['sms'],
          //   plan: item['plan'],
          //   description: item['description'],
          // );
          subscriptions.add(SubscriptionsList.fromMap(item));
        }
        return APIResponse<List<SubscriptionsList>>(data: subscriptions);
      }
      return APIResponse<List<SubscriptionsList>>(
          error: true, errorMessage: "oops! an error occured");
    }).catchError((err) {
      print(err);
      return APIResponse<List<SubscriptionsList>>(
        error: true,
        errorMessage: "oops! an error occured {$err}",
      );
    });
  }

  Future<void> createInstitution(CreateAccount accountInfo) async {
    return null;


    // int sid = 1;
    // try {
    //   var response = await https.post(
    //     Uri.encodeFull(createUserUrl),
    //     headers: {"Accept": "application/json"},
    //     body: {
    //       "sid": sid.toString(),
    //       "companyname": "Mikun & Oluomo Hospital",
    //       "address": "5, Omoniyi Street, Iju-ishaga, Lagos",
    //       "email": "ayomikunolukayode@gmail.com",
    //       "phone": "08094830855",
    //       "password": "123456",
    //     },
    //   ).then((data) {});

    //   var result = json.decode(response.body);
    //   print(result);
    //   // if (response.statusCode == 200) {
    //   //   var result = json.decode(response.body);
    //   //   print(result);
    //   // }else{
    //   //   print
    //   // }
    // } catch (err) {
    //   print(err);
    // }
  }

  Future<APIResponse<bool>> createAccount(NewInstitution institution) async {
    return https.post(Uri.encodeFull(createAccountApi), headers: header, body: {
      "code": "7301385",
      "email": "ayomikunolukayode@gmail.com",
      "phone": "08094830855",
    }).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          error: true, errorMessage: "opps! an error occured");
    }).catchError((err) {
      return APIResponse<bool>(
          error: true, errorMessage: "opps! an error occured $err");
      // return APIResponse<List<SubscriptionsList>>(data: subscriptions);
    });
  }
}
