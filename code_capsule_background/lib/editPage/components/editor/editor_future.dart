import 'package:flutter/material.dart';
import '../../util/page_util.dart';
import '../../../config/index.dart';
import './editor.dart';
import '../../model/viewModel/article_viewmodel.dart';

class EditorFuture extends StatefulWidget {
  final ArticleViewModel articleViewModel;
  final EditPageUtil pageUtil;
  const EditorFuture(
      {Key? key, required this.articleViewModel, required this.pageUtil})
      : super(key: key);

  @override
  State<EditorFuture> createState() => _EditorFutureState();
}

class _EditorFutureState extends State<EditorFuture> with AutomaticKeepAliveClientMixin{

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
    super.build(context);
    return FutureBuilder<int>(
        future: widget.articleViewModel.refresh(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container(
                width: 1920 - 24 - 112 - 24 - 24,
                height: MediaQuery.of(context).size.height - 24 - 55 - 24 - 24,
                alignment: Alignment.center,
                child: refreshButton(),
              );

            case ConnectionState.waiting:
              return Container(
                width: 1920 - 24 - 112 - 24 - 24,
                height: MediaQuery.of(context).size.height - 24 - 55 - 24 - 24,
                alignment: Alignment.center,
                child: Text(
                  "加载中",
                  style: KFont.categoryTitleStyle,
                ),
              );

            case ConnectionState.active:
              return Container(
                width: 1920 - 24 - 112 - 24 - 24,
                height: MediaQuery.of(context).size.height - 24 - 55 - 24 - 24,
                alignment: Alignment.center,
              );

            case ConnectionState.done:
              if (snapshot.hasError) {
                return Container(
                  width: 1920 - 24 - 112 - 24 - 24,
                  height:
                      MediaQuery.of(context).size.height - 24 - 55 - 24 - 24,
                  alignment: Alignment.center,
                  child: refreshButton(),
                );
              } else {
                return Editor(
                  articleViewModel: widget.articleViewModel,
                );
              }
          }
        });
  }

  void refreshUi() {
    setState(() {});
  }
  
  @override
  bool get wantKeepAlive => true;
}
