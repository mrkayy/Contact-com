import 'package:flutter/material.dart';
// import 'signin.dart';
import 'register.dart';

class FirstLoad extends StatelessWidget {
  static String id = 'onload';
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var scrData = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: PageView(
            controller: controller,
            children: <Widget>[
              onBoardingPages(
                imagePath: "assets/images/onboard3.png",
                title: "Lorem ipsum dolor",
                description:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facili",
                size: scrData,
                pageController: controller,
              ),
              onBoardingPages(
                imagePath: "assets/images/onboard1.png",
                title: "Lorem ipsum dolor",
                description:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facili",
                size: scrData,
                pageController: controller,
              ),
              onBoardingPages(
                imagePath: "assets/images/onboard2.png",
                title: "Lorem ipsum dolor",
                description:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facili",
                size: scrData,
                pageController: controller,
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget onBoardingPages(
      {String title,
      description,
      imagePath,
      Size size,
      PageController pageController}) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          // color: Color(0xffcd99ee),
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.23 * size.height,
                child: Column(children: <Widget>[
                  Image.asset(imagePath),
                  SizedBox(height: 0.069 * size.height),
                  Padding(
                    padding: const EdgeInsets.only(left: 36.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: title,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "WorkSans",
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                          TextSpan(text: '\n'),
                          TextSpan(text: '\n'),
                          TextSpan(
                            text: description,
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: "WorkSans",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              Positioned(
                right: 36.0,
                bottom: 37.0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: InkWell(
                    child: Image.asset("assets/images/nextBtn.png"),
                    onTap: () {
                      switch (pageController.page.toInt()) {
                        case 0:
                          pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                          break;
                        case 1:
                          pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                          break;
                        case 2:
                          Navigator.of(context).pushNamed(RegisterUser.id);
                          break;
                        default:
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
