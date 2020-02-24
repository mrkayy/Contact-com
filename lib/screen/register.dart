import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import '../model/apiResponse.dart';
import '../model/registerUser.dart';
import '../model/subscriptions.dart';
import '../services/api_services.dart';
import '../services/dummyData.dart';

class RegisterUser extends StatefulWidget {
  static String id = "register";
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {

    DummyData get services => GetIt.I<DummyData>();
    // ApiServices get services => GetIt.I<ApiServices>();
    
  List<SubscriptionOfList> subsList = [];
  //Create an instance of the api class
  APIResponse<List<SubscriptionOfList>> _response;
  bool _isLoading = false;

  _fetchSubscriptionsList() async {
    //Set the state of the app while getting api data
    setState(() {
      _isLoading = true;
    });

    // _response = await services.getSubscriptionsList();
    // _response = await services.getSubscriptions();

    //Set is loafing to 
    setState(() {
      _isLoading = false;
    });
  }

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
  RegisterNewUser registerNewUser;
  double formSpacing = 0.0;

  int subscriptionID;
  String _companyName;
  String _address;
  String _email;
  String _phoneNum;
  String _password;
  String _confirmPassword;

  @override
  void initState() {
    subsList = services.getSubscriptionsList();
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Register',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Color(0xff77cae0),
                              fontWeight: FontWeight.bold,
                              height: 2.0),
                        ),
                        // TextSpan(text: '\n'),
                        TextSpan(
                            text: '\nHello there! create your contact account.',
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0)),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 0.8 * scrData.height,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      // _buildPage(index: 1, color: Colors.lime),
                      _subscriptionPage(scrData: scrData),
                      _registerPage(size: scrData),
                      _confrimationPage(),
                    ],
                  ),
                ),
                // Expanded(
                //   child: PageView(
                //     controller: controller,
                //     scrollDirection: Axis.horizontal,
                //     children: <Widget>[
                //       // _buildPage(index: 1, color: Colors.lime),
                //       _subscriptionPage(scrData: scrData),
                //       _registerPage(size: scrData, formState: _formState),
                //       _confrimationPage(),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _confrimationPage() {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 17.0),
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () => controller.previousPage(
                duration: Duration(milliseconds: 350),
                curve: Curves.easeOutBack),
            child: Text('Confrimation page'),
          ),
          SizedBox(height: 40.0),
          Text('Subscription ID: $subscriptionID'),
          SizedBox(height: 10.0),
          Text('CompanyName: $_companyName'),
          SizedBox(height: 10.0),
          Text('Address: $_address'),
          SizedBox(height: 10.0),
          Text('Email: $_email'),
          SizedBox(height: 10.0),
          Text('Phone Number: $_phoneNum'),
          SizedBox(height: 10.0),
          Text('Password: $_confirmPassword'),
          // Text('data'),
        ],
      ),
    );
  }

  Widget _subscriptionPage({Size scrData}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text('Select your subscription plan below:'),
            ),
            Container(
              height: 0.7 * scrData.height,
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: subsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 0.25 * scrData.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          formSpacing = 25.0;
                        });
                        subscriptionID = subsList[index].sid;
                        controller.nextPage(
                            duration: Duration(milliseconds: 350),
                            curve: Curves.ease);
                      },
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(subsList[index].sid.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(subsList[index].plan),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(subsList[index].sms),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(subsList[index].package),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(subsList[index].amount),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // SizedBox(height: 5.0),
            // MaterialButton(
            //   minWidth: 0.40 * scrData.height,
            //   padding: const EdgeInsets.all(20.0),
            //   color: Color(0xff77cae0),
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(25.0),
            //   ),
            //   onPressed: () {
            //     // registerNewUser = "";RegisterNewUser("Reddington Hospital","5\, Omoniyi Street","","",);
            //   },
            //   child: Text('LOGIN', style: TextStyle(color: Colors.white)),
            // ),
            // FlatButton(
            //   onPressed: () {
            //     // Navigator.of(context).pop();
            //     Navigator.of(context).pushReplacementNamed(RegisterUser.id);
            //   },
            //   child: RichText(
            //     text: TextSpan(children: [
            //       TextSpan(
            //           text: 'By clicking register, I agree to the ',
            //           style: TextStyle(color: Colors.black, fontSize: 11.0)),
            //       TextSpan(
            //           text: 'Terms of Service',
            //           style:
            //               TextStyle(color: Color(0xff77cae0), fontSize: 11.0))
            //     ]),
            //   ),
            // ),
          ],
        ),
      ]),
    );
  }

  Widget _registerPage({Size size}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17.0),
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
      child: Form(
        key: _formState,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text('Select your subscription plan below:'),
            ),
            TextFormField(
              onSaved: (val) {
                _companyName = val;
              },
              validator: (value) =>
                  value.isEmpty ? "Please enter your company name!" : null,
              // autofocus: true,
              decoration: InputDecoration(
                labelText: 'Company Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            SizedBox(height: formSpacing),
            TextFormField(
              onSaved: (val) {
                _address = val;
              },
              validator: (value) =>
                  value.isEmpty ? "Please enter your company address!" : null,
              // focusNode: _focusNode,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            SizedBox(height: formSpacing),
            TextFormField(
              onSaved: (val) {
                _email = val;
              },
              validator: (value) =>
                  !value.contains("@") ? "email is invalid" : null,
              // focusNode: _focusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            SizedBox(height: formSpacing),
            TextFormField(
              onSaved: (val) {
                _phoneNum = val;
              },
              validator: (val) => val.length < 11 ? "incomplete Number" : null,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            SizedBox(height: formSpacing),
            TextFormField(
              onSaved: (val) {
                _password = val;
              },
              validator: (val) => val.length <= 6 ? "password too short" : null,
              // focusNode: _focusNode.nearestScope,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            SizedBox(height: formSpacing),
            TextFormField(
              onSaved: (val) {
                _confirmPassword = val;
              },
              validator: (val) =>
                  val == _password ? "password not matching" : null,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 0.15 * size.height,
                    height: 0.13 * size.width,
                    padding: const EdgeInsets.all(15.0),
                    color: Color(0xff77cae0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    onPressed: () {
                      controller.previousPage(
                          duration: Duration(milliseconds: 350),
                          curve: Curves.ease);
                      // setState(() {
                      //   formSpacing = 25.0;
                      // });
                    },
                    child: Text('BACK', style: TextStyle(color: Colors.white)),
                  ),
                  MaterialButton(
                    minWidth: 0.15 * size.height,
                    height: 0.13 * size.width,
                    padding: const EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    color: Colors.blueGrey[200], //Color(0xff77cae0),
                    onPressed: () => _validateRegistration(),
                    child:
                        Text('SUBMIT', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validateRegistration() {
    final form = _formState.currentState;
    if (form.validate()) {
      form.save();
      controller.nextPage(
          duration: Duration(milliseconds: 350), curve: Curves.ease);
      print(subscriptionID);
      print(_companyName);
      print(_address);
      print(_email);
      print(_phoneNum);
      print(_confirmPassword);
    } else {
      setState(() {
        formSpacing = 8.0;
      });
    }
  }
}
