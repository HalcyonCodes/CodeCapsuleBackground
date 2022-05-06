import 'package:flutter/material.dart';
import '../config/index.dart';
import '../globleWidgets/globleNav/nav_globle.dart';
import './util/util_editpage.dart';
import './components/functionTitle/function_title_edit_page.dart';
import './components/editArea/editarea_page_edit_page.dart';

class EditPage extends StatefulWidget {
  final int initIndex = 1;
  final String headImg;

  const EditPage({Key? key, required this.headImg}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  EditPageUtil? pageUtil;
  PageController? pageController;

  @override
  void initState() {
    super.initState();
    pageUtil = EditPageUtil();
    pageController = PageController();
    //--注册
     pageUtil!.setPageController(pageController!);
 
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backGroundColor,
      body: Container(
          constraints: const BoxConstraints(),
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 1920,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GlobleNav(
                      headImg: widget.headImg, initIndex: widget.initIndex),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 24, top: 24, right: 24, bottom: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FunctionTitle(pageUtil: pageUtil!),
                        const SizedBox(
                          height: 24,
                        ),
                        EditAreaPage(
                          pageUtil: pageUtil!,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
