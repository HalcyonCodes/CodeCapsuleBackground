import 'package:code_capsule_background/editPage/components/category/category_card_select.dart';
import 'package:flutter/material.dart';
import '../../../config/index.dart';
import 'package:flutter_svg/svg.dart';
import '../../model/viewModel/article_viewmodel.dart';
import '../../util/page_util.dart';

class CategorySelect extends StatefulWidget {
  final ArticleViewModel articleViewModel;
  final EditPageUtil pageUtil;
  const CategorySelect(
      {Key? key, required this.articleViewModel, required this.pageUtil})
      : super(key: key);

  @override
  State<CategorySelect> createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return 
    widget.articleViewModel.selectCategory == null?const SizedBox():
    SizedBox(
      width: 502,
      height: MediaQuery.of(context).size.height - 55 - 24 - 24 - 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          height: 42,
          width: 502,
          decoration: BoxDecoration(
            color: KColor.containColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [KShadow.shadow],
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          child: Row(
            children: [
              SizedBox(
                height: 18,
                width: 18,
                child: SvgPicture.asset(
                  'svg/全网竞价报表.svg',
                  fit: BoxFit.cover,
                  color: Colors.black,
                  height: 18,
                  width: 18,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                KString.addCategoryTitle,
                style: KFont.toolTitleStyle,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        
        CategoryCardSelect(pageUtil: widget.pageUtil, viewModel: widget.articleViewModel),
        
      ]),
    );

  }

  void refreshUi() {
    setState(() {});
  }
}
