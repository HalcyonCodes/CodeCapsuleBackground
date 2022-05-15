import 'package:flutter/cupertino.dart';
import '../model/viewModel/category.dart';
import '../model/viewModel/Tag.dart';

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

  //存放编辑页的pageController
  PageController? _pageController;
  PageController? get pageController => _pageController;
  void setPageController(PageController p) {
    _pageController = p;
  }

  //判断是否已经创建好了pageController附加的pageview
  bool? _isPageViewBuild = false;
  bool? get isPageViewBuild => _isPageViewBuild;
  void setIsPageViewBuild(bool i) {
    _isPageViewBuild = i;
  }

  //pageview加载后刷新标题
  void Function()? _refreshTitleAfterPageViewLoad;
  void Function()? get refreshTitleAfterPageViewLoad =>
      _refreshTitleAfterPageViewLoad;
  void setRefreshTitleAfterPageViewLoad(void Function() i) {
    _refreshTitleAfterPageViewLoad = i;
  }

  //刷新工具栏
  Function()? _refreshTool;
  Function()? get refreshTool => _refreshTool;
  void setRefreshTool(Function()? i) {
    _refreshTool = i;
  }

  //所有分类卡片设置选中的方法的集合
  List<Function(bool)?> _funcListSetIsSelectCard = [];
  List<Function(bool)?> get funcListSetIsSelectCard => _funcListSetIsSelectCard;
  void setFuncListSelectCard(List<Function(bool)?> i) {
    _funcListSetIsSelectCard = i;
  }

  void addFuncListSelectCard(Function(bool)? i) {
    _funcListSetIsSelectCard.add(i);
  }

  //所有刷新分类卡片的方法集合
  List<Function()?> _funcListRefreshCategoryCard = [];
  List<Function()?> get funcListRefreshCategoryCard =>
      _funcListRefreshCategoryCard;
  void setFuncListRefreshCategoryCard(List<Function()?> i) {
    _funcListRefreshCategoryCard = i;
  }

  void addFuncListRefreshCategoryCard(Function()? i) {
    _funcListRefreshCategoryCard.add(i);
  }

  //不加载数据刷新选择选择列表
  void Function()? _refreshCategorySelect;
  void Function()? get refreshCategorySelect => _refreshCategorySelect;
  void setRefreshCategorySelect(void Function()? i) {
    _refreshCategorySelect = i;
  }

  //分类页设置选中的分类的id
  Category? _selectCategory;
  Category? get selectCategory => _selectCategory;
  void setSelectCategory(Category? i) {
    _selectCategory = i;
    int a;
  }

  //分类页设置选中的分类的id
  int? _categoryId;
  int? get categoryId => _categoryId;
  void setCategoryId(int? i) {
    _categoryId = i;
  }

  Function(bool)? _setIsAdd;
  Function(bool)? get setIsAdd => _setIsAdd;
  void setFuncSetIsAdd(Function(bool)? i) {
    _setIsAdd = i;
  }

  Function(bool)? _setIsEdit;
  Function(bool)? get setIsEdit => _setIsEdit;
  void setFuncSetIsEdit(Function(bool)? i) {
    _setIsEdit = i;
  }

  Function(bool)? _setIsDel;
  Function(bool)? get setIsDel => _setIsDel;
  void setFuncSetIsDel(Function(bool)? i) {
    _setIsDel = i;
  }
}
