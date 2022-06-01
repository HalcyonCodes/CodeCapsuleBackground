import 'package:code_capsule_background/config/index.dart';
import 'package:code_capsule_background/editPage/model/viewModel/article_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../util/page_util.dart';
import '../../model/viewModel/category_viewmodel.dart';
import './edit_tool_category_tool.dart';
import './add_tool_category_tool.dart';
import './delect_tool_category_tool.dart';

class CategoryTool extends StatefulWidget {
  final EditPageUtil pageUtil;
  final CategoryViewModel categoryViewModel;
  final ArticleViewModel articleViewModel;
  const CategoryTool(
      {Key? key,
      required this.pageUtil,
      required this.categoryViewModel,
      required this.articleViewModel})
      : super(key: key);

  @override
  State<CategoryTool> createState() => _CategoryToolState();
}

class _CategoryToolState extends State<CategoryTool> {
  bool isInEditCategoryName = false;

  int? _selectCategoryId;
  int? get selectCategoryId => _selectCategoryId;
  void setSelectCategoryId(int? i) {
    _selectCategoryId = i;
  }

  //指示器
  bool _isAdd = false;
  bool _isEdit = false;
  bool _isDel = false;
  bool get isAdd => _isAdd;
  bool get isEdit => _isEdit;
  bool get isDel => _isDel;
  void setIsAdd(bool i) {
    _isAdd = i;
  }

  void setIsEdit(bool i) {
    _isEdit = i;
  }

  void setIsDel(bool i) {
    _isDel = i;
  }

  @override
  void initState() {
    super.initState();
    //selectCategoryId = widget.pageUtil.categoryId;
    setSelectCategoryId(widget.pageUtil.categoryId);

    widget.pageUtil.setFuncSetIsAdd(setIsAdd);
    widget.pageUtil.setFuncSetIsDel(setIsDel);
    widget.pageUtil.setFuncSetIsEdit(setIsEdit);
    widget.pageUtil.setRefreshTool(refreshUi);
  }

  void refreshUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 396,
      height: MediaQuery.of(context).size.height - 55 - 24 - 24 - 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //标题
          Container(
            height: 42,
            width: 396,
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
                    'svg/跟踪目标设置.svg',
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
                  KString.toolTitle,
                  style: KFont.toolTitleStyle,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          //工具栏图标
          SizedBox(
            width: 396,
            height: 81,
            child: Row(
              children: [
                InkWell(
                  onTap: edit,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 81,
                    width: 81,
                    decoration: BoxDecoration(
                        color: KColor.containColor,
                        borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: SvgPicture.asset(
                        'svg/编辑.svg',
                        fit: BoxFit.cover,
                        color: Colors.black,
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                InkWell(
                  onTap: addCategory,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 81,
                    width: 81,
                    decoration: BoxDecoration(
                        color: KColor.containColor,
                        borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: SvgPicture.asset(
                        'svg/加.svg',
                        fit: BoxFit.cover,
                        color: Colors.black,
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                InkWell(
                  onTap: delectCategory,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 81,
                    width: 81,
                    decoration: BoxDecoration(
                        color: KColor.containColor,
                        borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: SvgPicture.asset(
                        'svg/删除.svg',
                        fit: BoxFit.cover,
                        color: Colors.black,
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                InkWell(
                  onTap: selectCategory,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 81,
                    width: 81,
                    decoration: BoxDecoration(
                        color: KColor.containColor,
                        borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: SvgPicture.asset(
                        'svg/向右.svg',
                        fit: BoxFit.cover,
                        color: Colors.black,
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          isEdit
              ? Edit(
                  pageUtil: widget.pageUtil,
                )
              : isAdd
                  ? Add(
                      pageUtil: widget.pageUtil,
                      categoryViewModel: widget.categoryViewModel,
                    )
                  : isDel
                      ? Delect(
                          pageUtil: widget.pageUtil,
                        )
                      : const SizedBox()
        ],
      ),
    );
  }

  //编辑分类名称
  void edit() {
    setIsAdd(false);
    setIsDel(false);
    setIsEdit(true);
    refreshUi();
  }

  //添加分类
  void addCategory() {
    setIsAdd(true);
    setIsDel(false);
    setIsEdit(false);
    refreshUi();
  }

  //删除分类
  void delectCategory() {
    setIsAdd(false);
    setIsEdit(false);
    setIsDel(true);
    refreshUi();
  }

  //选择分类
  void selectCategory() {
    widget.articleViewModel.setSelectCategory(widget.pageUtil.selectCategory);
    widget.pageUtil.refreshCategorySelect!();
  }
}
