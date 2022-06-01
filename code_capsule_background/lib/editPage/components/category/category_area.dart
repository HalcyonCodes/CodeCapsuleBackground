import 'package:code_capsule_background/editPage/components/category/list_category_card_future.dart';
import 'package:flutter/material.dart';
import './category_tool.dart';
import '../../util/page_util.dart';
import '../../model/viewModel/category_viewmodel.dart';
import '../../model/viewModel/article_viewmodel.dart';
import './category_select_future.dart';



class CategoryArea extends StatefulWidget {
  final CategoryViewModel categoryViewModel;
  final ArticleViewModel articleViewModel;
  final EditPageUtil pageUtil;
  const CategoryArea(
      {Key? key, required this.categoryViewModel, required this.articleViewModel,required this.pageUtil})
      : super(key: key);

  @override
  State<CategoryArea> createState() => _CategoryAreaState();
}

class _CategoryAreaState extends State<CategoryArea> with AutomaticKeepAliveClientMixin{

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


 @override
  Widget build(BuildContext context) {
    super.build(context);
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
                    categoryViewModel: widget.categoryViewModel, pageUtil: widget.pageUtil),
                const SizedBox(
                  width: 24,
                ),
                CategoryTool(
                  categoryViewModel: widget.categoryViewModel,
                  articleViewModel:  widget.articleViewModel,
                  pageUtil: widget.pageUtil,
                ),
                const SizedBox(
                  width: 24,
                ),
                CategorySelectFuture(
                  articleViewModel:widget.articleViewModel,
                  pageUtil:widget.pageUtil,
                )
              ],
            ),
          ]),
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
