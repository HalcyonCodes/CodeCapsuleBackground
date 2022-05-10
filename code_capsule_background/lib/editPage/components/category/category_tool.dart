import 'package:code_capsule_background/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../util/page_util.dart';
import '../../model/viewModel/category_viewmodel.dart';
import './edit_tool_category_tool.dart';

class CategoryTool extends StatefulWidget {
  final EditPageUtil pageUtil;
  final CategoryViewModel viewModel;
  const CategoryTool(
      {Key? key, required this.pageUtil, required this.viewModel})
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

  @override
  void initState() {
    super.initState();
    //selectCategoryId = widget.pageUtil.categoryId;
    setSelectCategoryId(widget.pageUtil.categoryId);
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
                  width: 18,
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
          //isInEditCategoryName ? categoryNameInput() : const SizedBox()
          Edit(),
        ],
      ),
    );
  }


  //编辑分类名称
  void edit(){

  }
  
  //添加分类
  void addCategory(){

  }
  
  //删除分类
  void delectCategory(){

  }
  
  //选择分类
  void selectCategory(){

  }


}
