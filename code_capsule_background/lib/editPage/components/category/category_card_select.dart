//分类中选择的分类项目卡片

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config/index.dart';
import '../../model/viewModel/article_viewmodel.dart';
import '../../util/page_util.dart';

class CategoryCardSelect extends StatelessWidget {
  final ArticleViewModel viewModel;
  final EditPageUtil pageUtil;

  const CategoryCardSelect(
      {Key? key, required this.viewModel, required this.pageUtil})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Container(
        height: 81,
        //width: 451 - 4,
        padding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 12), //24/12
        //margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          color: KColor.containColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [KShadow.shadow],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              width: 502 - 24 * 2 - 24 - 6 - 24 - 27,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewModel.selectCategory!.title,
                        style: KFont.categoryTitleStyle,
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        '共 ' + viewModel.selectCategory!.count + ' 篇',
                        style: KFont.categoryProfilesStyle,
                      ),
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  //Text('最后更新时间：',style: KFont.categoryProfilesStyle,),
                  Text('最后更新时间：' + (viewModel.selectCategory!.update),
                      style: KFont.categoryProfilesStyle),
                ],
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            SizedBox(
              width: 27,
              height: 27,
              child: InkWell(
                onTap: () {
                  viewModel.setIsFromInit(false);
                  viewModel.setSelectCategory(null);
                  pageUtil.refreshCategorySelect!();
                },
                borderRadius: BorderRadius.circular(16),
                child: SvgPicture.asset(
                  'svg/减.svg',
                  fit: BoxFit.cover,
                  height: 27,
                  width: 27,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
