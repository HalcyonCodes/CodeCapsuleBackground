import 'package:flutter/material.dart';
import '../../../config/index.dart';

class FunctionButton extends StatelessWidget {
  final String btnString;
  final Function() onTapFunc;
  const FunctionButton({Key? key, required this.btnString, required this.onTapFunc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunc,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 84,
        height: 31,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: KColor.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          btnString,
          style: KFont.funcTitleBtnStyle,
        ),
      ),

    );
  }
}
