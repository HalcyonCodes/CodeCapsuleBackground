import 'package:flutter/material.dart';
import '../../util/util_editpage.dart';

class EditAreaPage extends StatelessWidget {
  final EditPageUtil pageUtil;
  //final PageController pageController;
   EditAreaPage({Key? key, required this.pageUtil,}) : super(key: key){
    //WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
     // pageUtil.setPageController(pageController);
    //});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1920 - 24 - 112 - 24 - 24,
      height: MediaQuery.of(context).size.height - 24 - 55 - 24 - 24,
      child: PageView(
        controller: pageUtil.pageController,
        children: [
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
