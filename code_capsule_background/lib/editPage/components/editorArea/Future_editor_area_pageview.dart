import 'package:flutter/material.dart';
import '../../model/viewModel/editor_page_viewModel.dart';
import '../../util/page_util.dart';
import './editor_area_pageview.dart';
import '../../../config/index.dart';

class EditorAreaFuture extends StatefulWidget {
  final EditorPageViewModel viewModel;
  final EditPageUtil pageUtil;
  const EditorAreaFuture(
      {Key? key, required this.viewModel, required this.pageUtil})
      : super(key: key);

  @override
  State<EditorAreaFuture> createState() => _EditorAreaFutureState();
}

class _EditorAreaFutureState extends State<EditorAreaFuture> {
  Widget refreshButton() {
    return InkWell(
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
    int a;
    return FutureBuilder<int>(
        future: widget.viewModel.refresh(),
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
                return EditorAreaPageView(
                    pageUtil: widget.pageUtil, viewModel: widget.viewModel);
              }
          }
        });
  }

  void refreshUi() {
    setState(() {});
  }
}
