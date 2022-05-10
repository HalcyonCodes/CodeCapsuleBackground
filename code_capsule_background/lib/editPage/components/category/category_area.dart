import 'package:code_capsule_background/editPage/components/category/list_category_card_future.dart';
import 'package:flutter/material.dart';
import './List_category_card.dart';
import './category_tool.dart';
import '../../util/page_util.dart';
import '../../model/viewModel/category_viewmodel.dart';
import '../../model/viewModel/article_viewmodel.dart';

class CategoryArea extends StatelessWidget {
  final CategoryViewModel categoryViewModel;
  final ArticleViewModel articleViewModel;
  final EditPageUtil pageUtil;
  const CategoryArea(
      {Key? key, required this.categoryViewModel, required this.articleViewModel,required this.pageUtil})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1920 - 24 - 112 - 24 - 24,
      height: MediaQuery.of(context).size.height - 24 - 55 - 24,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CategoryCardListFuture(
                    categoryViewModel: categoryViewModel, pageUtil: pageUtil),
                const SizedBox(
                  width: 24,
                ),
                CategoryTool(
                  viewModel: categoryViewModel,
                  pageUtil: pageUtil,
                ),
              ],
            ),
          ]),
    );
  }
}
