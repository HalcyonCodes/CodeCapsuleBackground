import 'package:flutter/material.dart';
import '../../util/page_util.dart';
import '../../model/viewModel/article_viewmodel.dart';
import '../../model/viewModel/category_viewmodel.dart';
import '../../model/viewModel/tag_viewmodel.dart';
import '../editor/editor_future.dart';
import '../category/category_area.dart';

class EditorAreaPageView extends StatelessWidget {
  final EditPageUtil pageUtil;
  final ArticleViewModel articleViewModel;
  final CategoryViewModel categoryViewModel;
  final TagViewModel tagViewModel;

  //final PageController pageController;
  EditorAreaPageView({
    Key? key,
    required this.pageUtil,
    required this.articleViewModel,
    required this.categoryViewModel,
    required this.tagViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      pageUtil.refreshTitleAfterPageViewLoad!();
    });
    return SizedBox(
      width: 1920 - 24 - 112 - 24 - 24,
      height: MediaQuery.of(context).size.height - 24 - 55 - 24 - 24,
      child: PageView(
        controller: pageUtil.pageController,
        children: [
          EditorFuture(articleViewModel: articleViewModel, pageUtil: pageUtil),
          CategoryArea(
              articleViewModel: articleViewModel,
              categoryViewModel: categoryViewModel,
              pageUtil: pageUtil),
          Container(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
