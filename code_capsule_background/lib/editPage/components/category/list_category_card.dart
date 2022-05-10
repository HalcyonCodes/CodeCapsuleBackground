import 'package:flutter/material.dart';
import './category_card.dart';
import '../../util/page_util.dart';
import '../../model/viewModel/category_viewmodel.dart';

class CategoryCardList extends StatefulWidget {
  final EditPageUtil pageUtil;
  final CategoryViewModel categoryViewModel;
  const CategoryCardList(
      {Key? key, required this.categoryViewModel, required this.pageUtil})
      : super(key: key);

  @override
  State<CategoryCardList> createState() => _CategoryCardListState();
}

class _CategoryCardListState extends State<CategoryCardList> {
  List<Widget> categoryCards = [];

  @override
  void initState() {
    super.initState();
    widget.pageUtil.setFuncListSelectCard([]);
    widget.pageUtil.setFuncListRefreshCategoryCard([]);

    for (var e in widget.categoryViewModel.categories) {
      CategoryCard card = CategoryCard(
          pageUtil: widget.pageUtil,
          viewModel: widget.categoryViewModel,
          id: e.categoryId,
          title: e.title,
          update: e.update,
          count: e.count);
      categoryCards.add(card);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 451,
      height: MediaQuery.of(context).size.height - 55 - 24 - 24 - 24,
      child: ListView(
        children: categoryCards,
      ),
    );
  }
}
