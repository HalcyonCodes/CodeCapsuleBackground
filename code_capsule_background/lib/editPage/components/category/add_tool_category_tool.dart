import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/index.dart';
import './button_tool_category_tool.dart';
import '../../util/page_util.dart';
import '../../model/viewModel/category_viewmodel.dart';
import '../../model/viewModel/category.dart';
import '../../../globleWidgets/tip/animated_tip.dart';

class Add extends StatelessWidget {
  final EditPageUtil pageUtil;
  final CategoryViewModel categoryViewModel;
  final TextEditingController editController = TextEditingController();

  Add({Key? key, required this.pageUtil, required this.categoryViewModel})
      : super(key: key);

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
              KString.toolAddCategoryTitle,
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
              width: 396 - 12 - 12,
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
                //onSubmitted: (text) {},
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

  void commit() async {
    //向服务器提交添加分类并刷新
    Map<String, String> postData = {};
    postData['title'] = editController.text;
    try {
      await categoryViewModel.addCategory(postData);
    } catch (e) {}
  }

  void cancel() {
    pageUtil.setIsAdd!(false);
    pageUtil.setIsEdit!(false);
    pageUtil.setIsDel!(false);
    pageUtil.refreshTool!();
  }

  void popTip(String tipString) {
    //return
    Widget overlayEntry = AnimatedTip(tipString: tipString);
  }

  /*if (b) {
                RenderBox rBox =
                    gKey.currentContext!.findRenderObject() as RenderBox;
                Offset offset = rBox.localToGlobal(Offset.zero);
                overlayEntry = OverlayEntry(builder: (constext) {
                  String date = year + ' 年 ' + month + ' 月 ' + day + ' 日 ';
                  return Positioned(
                    top: offset.dy + 7 +7,
                    left: offset.dx + 7 + 7,
                    child: pupContain(date, count),
                  );
                });
                Overlay.of(context)!.insert(overlayEntry!);
              }
              if (!b) {
                if (overlayEntry != null) {
                  overlayEntry!.remove();
                  //overlayEntry!.dispose();
                  overlayEntry = null;
                }
              }*/

}
