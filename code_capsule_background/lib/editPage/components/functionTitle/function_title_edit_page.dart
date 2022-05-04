import 'package:flutter/material.dart';
import '../../../config/index.dart';

class FunctionTitle extends StatelessWidget {
  const FunctionTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1920 - 112 - 24 - 24,
      height: 55,
      padding: const EdgeInsets.only(left: 22, right: 22, top: 12, bottom: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  KString.KEditEditTitle,
                  style: KFont.functionStyle,
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
