import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/index.dart';
import './button_tool_category_tool.dart';
import '../../util/page_util.dart';
import '../../model/viewModel/category_viewmodel.dart';
import '../../model/viewModel/category.dart';
import '../../../globleWidgets/tip/animated_tip.dart';

class Add extends StatefulWidget {
  final EditPageUtil pageUtil;
  final CategoryViewModel categoryViewModel;

  Add({Key? key, required this.pageUtil, required this.categoryViewModel})
      : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> with TickerProviderStateMixin {
  OverlayEntry? overlayEntry;
  TextEditingController editController = TextEditingController();
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    //animation =
    //  CurvedAnimation(parent: animationController!, curve: Curves.easeInOut);
    animation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(animationController!)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // animationController!.reverse();
        }
      });
  }

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
      await widget.categoryViewModel.addCategory(postData);
      popTip('添加成功', context);
    } catch (e) {
      popTip('添加失败', context);
    }
  }

  void cancel() {
    widget.pageUtil.setIsAdd!(false);
    widget.pageUtil.setIsEdit!(false);
    widget.pageUtil.setIsDel!(false);
    widget.pageUtil.refreshTool!();
  }

  void popTip(String tipString, BuildContext context) async {
    //return
    //Widget overlayEntry = AnimatedTip(tipString: tipString);
    if (overlayEntry == null) {
      overlayEntry = OverlayEntry(builder: (context) {
        return AnimatedTip(
          tipString: tipString,
          controller: animationController!,
          animation: animation!,
        );
      });
      Overlay.of(context)!.insert(overlayEntry!);
      animationController!.reset();
      await animationController!.forward();
      await animationController!.reverse();
      if (overlayEntry != null && animationController!.value == 0) {
        overlayEntry!.remove();
        overlayEntry = null;
      }
    } else {
      overlayEntry!.remove();
      overlayEntry = null;
    }
  }
}
