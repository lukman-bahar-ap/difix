import 'package:difix/utility/my_navigator.dart';
import 'package:difix/utility/base_const.dart';
import 'package:difix/theme/base_image.dart';
import 'package:flutter/material.dart';
import 'package:difix/widgets/rounded_button.dart';
import 'package:difix/widgets/rounded_input_field.dart';
import 'package:difix/widgets/background.dart';
class RequestScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BaseImage.assetImageSetHeight(
                  BaseImage.signup,
                  size.height * 0.35
              ),
              RoundedInputField(
                hintText: BaseConst.problem,
                icon: Icons.error_outline,
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: BaseConst.pick_unit,
                icon: Icons.devices_other,
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: BaseConst.description_problem,
                icon: Icons.edit,
                onChanged: (value) {},
              ),
              RoundedButton(
                text: BaseConst.call,
                press: () {
                  MyNavigator.goToProcessing(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
