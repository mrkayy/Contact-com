
import 'package:flutter/material.dart';
import './registration_form.dart';
// import 'package:flutter/services.dart';
// import 'package:get_it/get_it.dart';
// import '../model/apiResponse.dart';
// import '../model/registerUser.dart';
// import '../model/subscriptions.dart';
// import '../services/dummyData.dart';

class RegisterUser extends StatefulWidget {
  static String id = "register";
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  // DummyData get services => GetIt.I<DummyData>();
  // ApiServices get services => GetIt.I<ApiServices>();

  // List<SubscriptionOfList> subsList = [];
  //Create an instance of the api class
  // APIResponse<List<SubscriptionOfList>> _response;
  // bool _isLoading = false;

  // _fetchSubscriptionsList() async {
  //   //Set the state of the app while getting api data
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   // _response = await services.getSubscriptionsList();
  //   // _response = await services.getSubscriptions();

  //   //Set is loafing to
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  //
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  //using get it to create a global instance of the class that can be call any here

  final controller = PageController(initialPage: 0);

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

  Future<List<SubscriptionOfList>> getSubscriptions() async {
    var _subscriptionList = <SubscriptionOfList>[];
    try {
      var response = await https
          .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
      var result = json.decode(response.body);
      print(result[0]);

      for (var n in result) {
        var subscriptions = SubscriptionOfList(
          n.sid,
          n.sms,
          n.plan,
          n.package,
          n.amount,
        );
        _subscriptionList.add(subscriptions);
      }
    } catch (err) {
      print(err);
    }
    // print(_subscriptionList.elementAt(0).);
    return _subscriptionList;
  }
*/
  // RegisterNewUser registerNewUser;
  // double formSpacing = 0.0;

  // int subscriptionID;
  // String _companyName;
  // String _address;
  // String _email;
  // String _phoneNum;
  // String _password;
  // String _confirmPassword;

  @override
  void initState() {
    // subsList = services.getSubscriptionsList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var scrData = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
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
              // Expanded(
              //   flex: 2,
              // child:
              Container(
                height: 0.52 * scrData.height,
                alignment: Alignment.topCenter,
                // color: Colors.blue,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return CaresityPlans();
                  },
                ),
              ),
              // ),
              // Expanded(
              //   flex: 2,
              //   child: Container(
              //     color: Colors.blue,
              //     child: ListView.builder(
              //       itemCount: 5,
              //       itemBuilder: (BuildContext context, int index) {
              //         return CaresityPlans();
              //       },
              //     ),
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.only(top: 28.0),
                height: 0.2 * scrData.height,
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 2.0,
                  child: MaterialButton(
                    minWidth: 300.0,
                    height: 50.0,
                    color: Color(0xff2CD18A),
                    onPressed: () {
                      Navigator.of(context).pushNamed(RegistrationForm.id);
                    },
                    child: Text(
                      'Select',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "WorkSans",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CaresityPlans extends StatefulWidget {
  final String barge;
  final String plan;
  final String package;
  final String sms;

  CaresityPlans({
    this.barge,
    this.plan,
    this.package,
    this.sms,
  });

  @override
  _CaresityPlansState createState() => _CaresityPlansState();
}

class _CaresityPlansState extends State<CaresityPlans> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final scrSize = MediaQuery.of(context).size;
    return Container(
      // alignment: Alignment.center,
      height: 0.11 * scrSize.height,
      child: Card(
        margin: const EdgeInsets.only(top: 10.0),
        child: CheckboxListTile(
            activeColor: Color(0xff2CD18A),
            value: isSelected,
            title: Row(
              children: <Widget>[
                Image.asset(
                  "assets/images/gold-medal-1.png",
                  height: 41.0,
                  width: 41.0,
                ),
                SizedBox(width: 32.0),
                Text('Plans'),
              ],
            ),
            onChanged: (val) {
              print(val);
              setState(() {
                isSelected = !isSelected;
              });
            }),
      ),
    );
    // Container(
    //   height: 80.0,
    //   child: Card(
    //     child: Text('Select Plan'),
    //   ),
    // );
  }
}
