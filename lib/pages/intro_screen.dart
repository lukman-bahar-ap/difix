import 'package:difix/theme/base_colors.dart';
import 'package:difix/theme/base_image.dart';
import 'package:difix/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:difix/utility/base_const.dart';
import 'package:difix/utility/my_navigator.dart';
import 'package:difix/widgets/walkthrough.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 3,
              child: PageView(
                children: <Widget>[
                  Walkthrough(
                    title: BaseConst.intro1,
                    content: BaseConst.intro1_desc,
                    imageIcon: BaseImage.imageIntro(BaseImage.intro1),
                  ),
                  Walkthrough(
                    title: BaseConst.intro2,
                    content: BaseConst.intro2_desc,
                    imageIcon: BaseImage.imageIntro(BaseImage.intro2),
                  ),
                 Walkthrough(
                    title: BaseConst.intro3,
                    content: BaseConst.intro3_desc,
                    imageIcon: BaseImage.imageIntro(BaseImage.intro3),
                  ),
                  Walkthrough(
                    title: BaseConst.intro4,
                    content: BaseConst.intro4_desc,
                    imageIcon: BaseImage.imageIntro(BaseImage.intro4),
                  ),
                ],
                controller: controller,
                onPageChanged: _onPageChanged,
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text(lastPage ? "" : BaseConst.skip,
                        style: TextStyle(
                           color: primaryColor,
                           fontWeight: FontWeight.bold,
                           fontSize: 16.0)),
                    onPressed: () =>
                        lastPage ? null : MyNavigator.goToSelect(context),
                   ),
                  FlatButton(
                    child: Text(lastPage ? BaseConst.gotIt : BaseConst.next,
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0)),
                      onPressed: () => lastPage
                        ? MyNavigator.goToSelect(context)
                        : controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
