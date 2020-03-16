import 'package:contact/widgets/subscriptions_dialog.dart';
import 'package:flutter/material.dart';
import '../model/apiResponse.dart';
import '../model/select_subscription.dart';
import '../model/subscription.dart';
import '../services/api_services.dart';
import './registration_form.dart';
import 'package:get_it/get_it.dart';

import 'signin.dart';

class RegisterSubscription extends StatefulWidget {
  static String id = "register";

  @override
  _RegisterSubscriptionState createState() => _RegisterSubscriptionState();
}

class _RegisterSubscriptionState extends State<RegisterSubscription> {
  ApiServices get services => GetIt.I<ApiServices>();
  APIResponse<List<SubscriptionsList>> _apiResponse;
  bool isLoading = false;
  _fetchSuscriptionList() async {
    setState(() {
      isLoading = !isLoading;
    });
    _apiResponse = await services.getSubscriptions();
    setState(() {
      isLoading = !isLoading;
    });
  }

  final subscription = SelectedSubscription();

  // String formatDateTime(DateTime dateTime) {
  //   return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  // }

/*
  Future<void> verifyAccount() async {
    try {
      await https
          .post(Uri.encodeFull(createUserUrl), headers: {
            "Accept": "application/json"
          }, body: {
            "code": "7301385",
            "email": "ayomikunolukayode@gmail.com",
            "phone": "08094830855",
          })
          .then((data) {
            var result = json.decode(data.body);
            print(result);
          })
          .catchError((onError) {
            print(onError);
          });
    } catch (err) {}
  }

  Future<void> createAccount() async {
    int sid = 1;
    try {
      var response = await https.post(
        Uri.encodeFull(createUserUrl),
        headers: {"Accept": "application/json"},
        body: {
          "sid": sid.toString(),
          "companyname": "Mikun & Oluomo Hospital",
          "address": "5, Omoniyi Street, Iju-ishaga, Lagos",
          "email": "ayomikunolukayode@gmail.com",
          "phone": "08094830855",
          "password": "123456",
        },
      ).then((data) {});

      var result = json.decode(response.body);
      print(result);
      // if (response.statusCode == 200) {
      //   var result = json.decode(response.body);
      //   print(result);
      // }else{
      //   print
      // }
    } catch (err) {
      print(err);
    }
  }
  */

  @override
  void initState() {
    _fetchSuscriptionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var scrData = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 37.0, top: 85.0, right: 37.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Select Plan",
                      style: TextStyle(
                        fontSize: 32.2,
                        color: Color(0xff3D3D3D),
                        fontFamily: "WorkSans",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text:
                          "\nBy selecting a plan you chose to Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facili",
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Color(0xff3D3D3D),
                        fontFamily: "WorkSans",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 29.0),
            Expanded(
              child: Builder(
                builder: (BuildContext context) {
                  if (isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (_apiResponse.error) {
                    print(_apiResponse.errorMessage);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                              'Oops! An error Occured.\nPlease check your internet connection'),
                        ),
                        SizedBox(height: 20.0),
                        FlatButton(
                          onPressed: () => _fetchSuscriptionList(),
                          child: Icon(
                            Icons.refresh,
                            size: 32.0,
                          ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                          itemCount: _apiResponse.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            String imagePath;
                            switch (_apiResponse.data[index].plan) {
                              case 'Deluxe':
                                imagePath = "assets/images/deluxe-medal.png";
                                break;
                              case 'Silver':
                                imagePath = "assets/images/silver-medal.png";
                                break;
                              case 'Gold':
                                imagePath = "assets/images/gold-medal.png";
                                break;
                              default:
                                imagePath = "assets/images/bronze-medal.png";
                            }
                            return Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: ListTile(
                                  leading: Image.asset(imagePath),
                                  title: Text(_apiResponse.data[index].plan),
                                  isThreeLine: true,
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Amount: ${_apiResponse.data[index].amount}",
                                        style: TextStyle(fontSize: 11.0),
                                      ),
                                      Text(
                                        "Cost/SMS: ${_apiResponse.data[index].sms}",
                                        style: TextStyle(fontSize: 11.0),
                                      ),
                                      Text(
                                        "Package: ${_apiResponse.data[index].description}",
                                        style: TextStyle(fontSize: 11.0),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    subscription.planID =
                                        _apiResponse.data[index].id;
                                    subscription.sms =
                                        _apiResponse.data[index].sms;
                                    subscription.plan =
                                        _apiResponse.data[index].plan;
                                    subscription.price =
                                        _apiResponse.data[index].amount;
                                    subscription.description =
                                        _apiResponse.data[index].description;

                                    showDialog(
                                        context: context,
                                        builder: (_) => subscriptionsDialog(
                                            subscription: subscription),
                                        barrierDismissible: false);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 28.0),
                        // height: 0.2 * scrData.height,
                        child: Column(
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(Signin.id);
                                // Navigator.of(context).pushNamedAndRemoveUntil(
                                //     Signin.id, (Route<dynamic> route) => false);
                              },
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Already have an account? ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                        fontFamily: "WorkSans",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Signin",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12.0,
                                        fontFamily: "WorkSans",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
