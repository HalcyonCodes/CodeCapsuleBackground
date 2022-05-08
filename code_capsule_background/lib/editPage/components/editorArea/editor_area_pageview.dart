import 'package:flutter/material.dart';
import '../../util/page_util.dart';
import '../editor/editor.dart';
import '../../model/viewModel/editor_page_viewModel.dart';

class EditorAreaPageView extends StatelessWidget {
  final EditPageUtil pageUtil;
  final EditorPageViewModel viewModel;
  //final PageController pageController;
  EditorAreaPageView({
    Key? key,
    required this.pageUtil,
    required this.viewModel,
  }) : super(key: key) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      pageUtil.refreshTitleAfterPageViewLoad!();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1920 - 24 - 112 - 24 - 24,
      height: MediaQuery.of(context).size.height - 24 - 55 - 24 - 24,
      child: PageView(
        controller: pageUtil.pageController,
        children: [
          Editor(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
