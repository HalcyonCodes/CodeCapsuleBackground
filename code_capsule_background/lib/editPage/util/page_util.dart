import 'package:flutter/cupertino.dart';

class EditPageUtil {
  EditPageUtil();

  //三个页面的下划线的GlobleKey
  GlobalKey? _keyFirst;
  GlobalKey? get keyFirst => _keyFirst;
  void setGlobalKeyFirst(GlobalKey? k) {
    _keyFirst = k;
  }

  GlobalKey? _keySecond;
  GlobalKey? get keySecond => _keySecond;
  void setGlobalKeySecond(GlobalKey? k) {
    _keySecond = k;
  }

  GlobalKey? _keyThired;
  GlobalKey? get keyThired => _keyThired;
  void setGlobalKeyThired(GlobalKey? k) {
    _keyThired = k;
  }

  PageController? _pageController;
  PageController? get pageController => _pageController;
  void setPageController(PageController p) {
    _pageController = p;
  }

  bool? _isPageViewBuild = false;
  bool? get isPageViewBuild => _isPageViewBuild;
  void setIsPageViewBuild(bool i) {
    _isPageViewBuild = i;
  }

  void Function()? _refreshTitleAfterPageViewLoad;
  void Function()? get refreshTitleAfterPageViewLoad =>
      _refreshTitleAfterPageViewLoad;
  void setRefreshTitleAfterPageViewLoad(void Function() i) {
    _refreshTitleAfterPageViewLoad = i;
  }
}
