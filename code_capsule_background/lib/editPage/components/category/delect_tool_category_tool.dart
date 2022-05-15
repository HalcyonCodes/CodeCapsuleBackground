import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../../../config/index.dart';
import './button_tool_category_tool.dart';
import '../../util/page_util.dart';

class Delect extends StatelessWidget {
  final EditPageUtil pageUtil;

  const Delect({Key? key, required this.pageUtil}) : super(key: key);

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
              width: 12,
            ),
            Text(
              KString.toolDelectCategoryTitle,
              style: KFont.toolTitleStyle,
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
              btnString: KString.toolButtonDetermineTitle, onTapFunc: commit),
          const SizedBox(
            width: 24,
          ),
          FunctionButton(
              btnString: KString.toolButtonCancelTitle, onTapFunc: cancel),
        ],
      )
    ]);
  }


  void commit(){

  }

  void cancel(){
      //取消
      pageUtil.setIsAdd!(false);
      pageUtil.setIsDel!(false);
      pageUtil.setIsEdit!(false);
      pageUtil.refreshTool!();
  }

}
