import 'package:flutter/material.dart';
import '../../../config/index.dart';
import '../../util/page_util.dart';
import '../../model/viewModel/category_viewmodel.dart';
import '../../model/viewModel/tag_viewmodel.dart';
import '../../model/viewModel/category.dart';


class CategoryCard extends StatefulWidget {
  final String id;
  final String title;
  final String update;
  final String count;
  final CategoryViewModel viewModel;
  final EditPageUtil pageUtil;
  const CategoryCard(
      {Key? key,
      required this.viewModel,
      required this.id,
      required this.title,
      required this.update,
      required this.count,
      required this.pageUtil})
      : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool? _isSelect;
  bool? get isSelect => _isSelect;

  void setIsSelect(bool i) {
    _isSelect = i;
  }

  void refreshUi() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setIsSelect(false);
    widget.pageUtil.addFuncListSelectCard(setIsSelect);
    widget.pageUtil.addFuncListRefreshCategoryCard(refreshUi);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onClick,
        child: Container(
          alignment: Alignment.center,
          height: 81,
          //width: 451 - 4,
          padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 8), //24/12
          //margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
              color: KColor.containColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [KShadow.shadow],
              border: isSelect!
                  ? Border.all(width: 2, color: KColor.primaryColor)
                  : Border.all(
                      width: 2,
                      color: Colors.black.withOpacity(0.0),
                    )),
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
                width: 451 - 24 * 2 - 24 - 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: KFont.categoryTitleStyle,
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          '共 ' + widget.count + ' 篇',
                          style: KFont.categoryProfilesStyle,
                        ),
                      ],
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    //Text('最后更新时间：',style: KFont.categoryProfilesStyle,),
                    Text('最后更新时间：' + (widget.update),
                        style: KFont.categoryProfilesStyle),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onClick() {
    if (isSelect == true) {
      for (int i = 0;
          i <= widget.pageUtil.funcListSetIsSelectCard.length - 1;
          i++) {
        widget.pageUtil.funcListSetIsSelectCard[i]!(false);
        widget.pageUtil.funcListRefreshCategoryCard[i]!();
      }
      widget.pageUtil.setCategoryId(null);
      widget.pageUtil.setSelectCategory(null);
    } else {
      for (int i = 0;
          i <= widget.pageUtil.funcListSetIsSelectCard.length - 1;
          i++) {
        widget.pageUtil.funcListSetIsSelectCard[i]!(false);
        widget.pageUtil.funcListRefreshCategoryCard[i]!();
      }
      setIsSelect(true);
      widget.pageUtil.setCategoryId(int.tryParse(widget.id)!);
      Category c = Category(
        categoryId: widget.id,
        title: widget.title,
        count: widget.count,
        update: widget.update,
      );
      widget.pageUtil.setSelectCategory(c);
    }

    refreshUi();
  }
}
