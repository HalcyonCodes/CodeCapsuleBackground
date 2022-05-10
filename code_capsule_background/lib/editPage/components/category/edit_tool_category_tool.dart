import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../config/index.dart';
import './button_tool_category_tool.dart';

class Edit extends StatelessWidget {
  final TextEditingController editController = TextEditingController();

  Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 42,
        width: 396,
        decoration: BoxDecoration(
          color: KColor.containColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [KShadow.shadow],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 18,
              width: 18,
              child: SvgPicture.asset(
                'svg/设置.svg',
                fit: BoxFit.cover,
                color: Colors.black,
                height: 18,
                width: 18,
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              KString.toolEditCategoryTitle,
              style: KFont.toolTitleStyle,
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 12,
      ),
      Container(
        height: 42,
        width: 396,
        decoration: BoxDecoration(
          color: KColor.containColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [KShadow.shadow],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 26,
              width: 396 - 18 - 12 - 12 - 18,
              alignment: Alignment.center,
              child: TextField(
                controller: editController,
                maxLines: 1,
                style: KFont.toolInputStyle,
                autofocus: false, //自动对焦
                cursorColor: Colors.black, //光标颜色
                cursorWidth: 2,
                cursorHeight: 26,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(200)
                ],
                maxLength: null,
                //onChanged: (text){},
                onSubmitted: (text) {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: KString.toolInputInitTitle,
                  contentPadding: EdgeInsets.zero,
                  hintStyle: KFont.toolInputInitStyle,
                  isDense: true,
                  hintMaxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 12,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(child: SizedBox()),
          FunctionButton(
              btnString: KString.toolButtonDetermineTitle, onTapFunc: () {}),
          const SizedBox(
            width: 24,
          ),
          FunctionButton(
              btnString: KString.toolButtonCancelTitle, onTapFunc: () {}),
        ],
      )
    ]);
  }
}
