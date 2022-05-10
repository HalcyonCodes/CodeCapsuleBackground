//分类中选择的分类项目卡片

import 'package:flutter/material.dart';
import '../../../config/index.dart';
import '../../model/viewModel/article_viewmodel.dart';

class CategoryCardSelect extends StatelessWidget {
  final ArticleViewModel viewModel;

  const CategoryCardSelect({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Container(
        height: 81,
        //width: 451 - 4,
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 8), //24/12
        //margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          color: KColor.containColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [KShadow.shadow],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 81 - 12 * 2,
              width: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: KColor.primaryColor,
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            SizedBox(
              width: 451 - 24 * 2 - 24 - 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewModel.articleCategory.title,
                        style: KFont.categoryTitleStyle,
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        '共 ' + viewModel.articleCategory.count + ' 篇',
                        style: KFont.categoryProfilesStyle,
                      ),
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  //Text('最后更新时间：',style: KFont.categoryProfilesStyle,),
                  Text('最后更新时间：' + (
                    viewModel.articleCategory.update
                    ),
                    style: KFont.categoryProfilesStyle),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
