import 'package:code_capsule_background/editPage/util/util_editpage.dart';
import 'package:flutter/material.dart';
import '../../../config/index.dart';
import './animated_line.dart';

class FunctionTitle extends StatefulWidget {
  final EditPageUtil pageUtil;

  const FunctionTitle({Key? key, required this.pageUtil}) : super(key: key);

  @override
  State<FunctionTitle> createState() => _FunctionTitleState();
}

class _FunctionTitleState extends State<FunctionTitle> {
  GlobalKey keyFirst = GlobalKey();
  GlobalKey keySecond = GlobalKey();
  GlobalKey keyThired = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.pageUtil.setGlobalKeyFirst(keyFirst);
    widget.pageUtil.setGlobalKeySecond(keySecond);
    widget.pageUtil.setGlobalKeyThired(keyThired);
    //animation = Tween(begin: 0.0, end: 1.0).animate(animatedController!);
    WidgetsBinding instance = WidgetsBinding.instance!;
    instance.addPostFrameCallback((timeStamp) {
      widget.pageUtil.setIsPageViewBuild(true);
      print(widget.pageUtil.isPageViewBuild!);
      RenderBox renderBox =
          keyFirst.currentContext!.findRenderObject()! as RenderBox;
      initY = renderBox.localToGlobal(Offset.zero).dy;
      firstX = renderBox.localToGlobal(Offset.zero).dx;
      renderBox = keySecond.currentContext!.findRenderObject()! as RenderBox;
      secondX = renderBox.localToGlobal(Offset.zero).dx;
      renderBox = keyThired.currentContext!.findRenderObject()! as RenderBox;
      thiredX = renderBox.localToGlobal(Offset.zero).dx;
      refreshUi();
    });
  }

  double initY = 0;
  double firstX = 0;
  double secondX = 0;
  double thiredX = 0;

  void refreshUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1920 - 112 - 24 - 24 - 24,
      height: 55,
      padding: const EdgeInsets.only(left: 22, right: 22, top: 12, bottom: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: KColor.containColor,
          boxShadow: [KShadow.shadow]),
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      KString.KEditEditTitle,
                      style: KFont.functionStyle,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      key: keyFirst,
                      width: 40,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      KString.KEditCategoryTitle,
                      style: KFont.functionStyle,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      key: keySecond,
                      width: 40,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      KString.KEditTagTitle,
                      style: KFont.functionStyle,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      key: keyThired,
                      width: 40,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          //下划线
          widget.pageUtil.isPageViewBuild!
              ? AnimatedLine(
                  initY: initY,
                  firstX: firstX,
                  secondX: secondX,
                  thiredX: thiredX,
                  pageController: widget.pageUtil.pageController!)
              : const SizedBox()
        ],
      ),
    );
  }
}
