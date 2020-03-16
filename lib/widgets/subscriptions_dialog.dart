import 'package:flutter/material.dart';

import '../constant.dart';
import '../screen/registration_form.dart';
import '../model/select_subscription.dart';

Widget subscriptionsDialog({SelectedSubscription subscription}) {
  String imagePath;
  switch (subscription.plan) {
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
  return Builder(
    builder: (BuildContext context) => AlertDialog(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      // titlePadding: const EdgeInsets.all(10.0),
      title: Text(
        "Subscription Details",
        textAlign: TextAlign.center,
      ),
      content: Container(
        // color: Colors.indigo,
        height: 265.0,
        child: Column(
          children: <Widget>[
            Image.asset(imagePath),
            SizedBox(height: 15.0),
            Container(
              // color: Colors.grey,
              height: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Plan: ",
                          style: kDefaultRichTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: "${subscription.plan}\n",
                            style: kDefaultRichTextStyle.copyWith(
                                color: Colors.green)),
                        TextSpan(
                            text: "simple explation of the plan",
                            style:
                                kDefaultRichTextStyle.copyWith(fontSize: 10.0)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Cost: ",
                          style: kDefaultRichTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "NGN${subscription.price}\n",
                          style: kDefaultRichTextStyle.copyWith(
                              color: Colors.green),
                        ),
                        TextSpan(
                          text:
                              "Your monthly payment will cost NGN${subscription.price}",
                          style: kDefaultRichTextStyle.copyWith(fontSize: 10.0),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "SMS Cost: ",
                          style: kDefaultRichTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: "NGN${subscription.sms}\n",
                            style: kDefaultRichTextStyle.copyWith(
                                color: Colors.green)),
                        TextSpan(
                            text:
                                "For every sms sent you will be chaged NGN${subscription.sms}",
                            style:
                                kDefaultRichTextStyle.copyWith(fontSize: 10.0)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Package: ",
                          style: kDefaultRichTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: "${subscription.description}\n",
                            style: kDefaultRichTextStyle.copyWith(
                                color: Colors.green)),
                        TextSpan(
                            text:
                                "Your institutions access will be reistricted to only: ${subscription.description}",
                            style:
                                kDefaultRichTextStyle.copyWith(fontSize: 10.0)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('back'),
        ),
        SizedBox(width: 15.0),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    RegistrationForm(subStatus: subscription)));
          },
          child: Text('continue'),
        ),
        // SizedBox(width: 10.0),
      ],
    ),
  );
}
