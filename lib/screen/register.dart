import 'package:flutter/material.dart';
import '../utils/dummyData.dart';

class RegisterUser extends StatefulWidget {
  static String id = "register";
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  GlobalKey _formState = GlobalKey<FormState>();

  final controller = PageController(initialPage: 0);
  DummyData subscriptionDummyDataList = DummyData();

  @override
  void initState() {
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: Column(
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
                        text: '\nHello there! welcome Contact.com',
                        style: TextStyle(color: Colors.black, fontSize: 11.0)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18.0),
            Expanded(
              child: PageView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  // _buildPage(index: 1, color: Colors.lime),
                  _registerPage(size: scrData, formState: _formState),
                  _subscriptionPage(scrData: scrData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerPage({Size size, GlobalKey formState}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17.0),
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
      child: Form(
        key: formState,
        child: Column(
          children: <Widget>[
            TextFormField(
              onSaved: null,
              validator: null,
              decoration: InputDecoration(
                labelText: 'Company Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            SizedBox(height: 25.0),
            TextFormField(
              onSaved: null,
              validator: null,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            SizedBox(height: 25.0),
            TextFormField(
              onSaved: null,
              validator: null,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            SizedBox(height: 25.0),
            TextFormField(
              onSaved: null,
              validator: null,
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            SizedBox(height: 25.0),
            TextFormField(
              onSaved: null,
              validator: null,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            SizedBox(height: 25.0),
            TextFormField(
              onSaved: null,
              validator: null,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(21.0),
              child: MaterialButton(
                minWidth: 0.40 * size.height,
                height: 0.11 * size.width,
                padding: const EdgeInsets.all(20.0),
                color: Color(0xff77cae0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                onPressed: () {
                  setState(() {
                    controller.nextPage(
                        duration: Duration(milliseconds: 350), curve: null);
                  });
                },
                child: Text('NEXT', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subscriptionPage({Size scrData}) {
    return Container(
      // color: Colors.blueAccent,
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 0.655 * scrData.height,
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount:
                    subscriptionDummyDataList.subscriptionsDummyList.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = subscriptionDummyDataList.subscriptionsDummyList;
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data[index].id.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data[index].plan),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data[index].sms),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data[index].package),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data[index].amount),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 5.0),
            MaterialButton(
              minWidth: 0.40 * scrData.height,
              padding: const EdgeInsets.all(20.0),
              color: Color(0xff77cae0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              onPressed: () {},
              child: Text('LOGIN', style: TextStyle(color: Colors.white)),
            ),
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
}
