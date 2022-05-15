
import 'package:flutter/material.dart';
import '../../util/page_util.dart';
import '../../../config/index.dart';
import '../../model/viewModel/article_viewmodel.dart';
import 'category_select.dart';

//import '../../components/category/list_category_card.dart';
//import '../category/category_card.dart';

class CategorySelectFuture extends StatefulWidget {
  final ArticleViewModel articleViewModel;
  final EditPageUtil pageUtil;
  const CategorySelectFuture(
      {Key? key, required this.articleViewModel, required this.pageUtil})
      : super(key: key);

  @override
  State<CategorySelectFuture> createState() => _CategorySelectFutureState();
}

class _CategorySelectFutureState extends State<CategorySelectFuture> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.pageUtil.setRefreshCategorySelect(refreshUi);
  }



  Widget refreshButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        refreshUi();
        
      },
      child: Container(
        //padding: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: KColor.primaryColor,
        ),
        alignment: Alignment.center,
        height: 55,
        width: 200,
        child: Text(
          KString.refreshButtonTitle,
          style: KFont.refreshBtnStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
        future: widget.articleViewModel.refresh(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container(
                width: 451,
                height: MediaQuery.of(context).size.height - 24 - 55 - 24 - 24,
                alignment: Alignment.center,
                child: refreshButton(),
              );

            case ConnectionState.waiting:
              return Container(
                width: 451,
                height: MediaQuery.of(context).size.height - 24 - 55 - 24 - 24,
                alignment: Alignment.center,
                child: Text(
                  "加载中",
                  style: KFont.categoryTitleStyle,
                ),
              );

            case ConnectionState.active:
              return Container(
                width: 451,
                height: MediaQuery.of(context).size.height - 24 - 55 - 24 - 24,
                alignment: Alignment.center,
              );

            case ConnectionState.done:
              if (snapshot.hasError) {
                return Container(
                  width: 451,
                  height:
                      MediaQuery.of(context).size.height - 24 - 55 - 24 - 24,
                  alignment: Alignment.center,
                  child: refreshButton(),
                );
              } else {
                return  widget.articleViewModel.selectCategory == null
                  ?const SizedBox()
                  : CategorySelect(
                    articleViewModel: widget.articleViewModel,
                    pageUtil: widget.pageUtil,
                  );
              }
          }
        });
  }

  void refreshUi() {
    setState(() {});
  }
}
