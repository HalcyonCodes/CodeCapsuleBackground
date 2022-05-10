import 'package:flutter/material.dart';
import '../config/index.dart';
import '../globleWidgets/globleNav/nav_globle.dart';
import 'util/page_util.dart';
import 'components/functionTitle/function_title.dart';
import './components/editorArea/editor_area_pageview.dart';
import './model/viewModel/article_viewmodel.dart';
import './model/viewModel/category_viewmodel.dart';
import './model/viewModel/tag_viewmodel.dart';

class EditPage extends StatefulWidget {
  final int initIndex = 1;
  final String headImg;

  const EditPage({Key? key, required this.headImg}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  EditPageUtil? pageUtil;
  ArticleViewModel? articleViewModel;
  CategoryViewModel? categoryViewModel;
  TagViewModel? tagViewModel;

  PageController? pageController;

  @override
  void initState() {
    super.initState();
    //viewModel = EditorPageViewModel();
    articleViewModel = ArticleViewModel();
    categoryViewModel = CategoryViewModel();
    tagViewModel = TagViewModel();
    
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
                        //EditorArea(pageUtil: pageUtil!)
                        EditorAreaPageView(pageUtil: pageUtil!, 
                          articleViewModel: articleViewModel!, 
                          categoryViewModel: categoryViewModel!, 
                          tagViewModel: tagViewModel!)
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
