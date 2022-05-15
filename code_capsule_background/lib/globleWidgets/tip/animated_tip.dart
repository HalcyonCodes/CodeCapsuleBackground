import 'package:flutter/material.dart';
import '../../config/index.dart';

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

class AnimatedTip extends StatefulWidget {
  final String tipString;
  const AnimatedTip({Key? key, required this.tipString}) : super(key: key);

  @override
  State<AnimatedTip> createState() => _AnimatedTipState();
}

class _AnimatedTipState extends State<AnimatedTip>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeInOut);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller!);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await controller!.forward();
      await controller!.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 2 - context.size!.height / 2,
      left: MediaQuery.of(context).size.width / 2 - context.size!.width / 2,
      child: Opacity(
        opacity: 1.0 * animation!.value,
        child: Container(
          //padding: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: KColor.primaryColor,
              boxShadow: [KShadow.shadow]),
          alignment: Alignment.center,
          height: 55,
          width: 200,
          child: Text(
            widget.tipString,
            style: KFont.refreshBtnStyle,
          ),
        ),
      ),
    );
  }
}
