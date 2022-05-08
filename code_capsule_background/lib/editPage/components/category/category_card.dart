import 'package:flutter/material.dart';
import '../../../config/index.dart';
import '../../model/viewModel/editor_page_viewModel.dart';

class CategoryTitleCard extends StatelessWidget {
  final String id;
  final String title;
  final String update;
  final String count;
  final EditorPageViewModel viewModel;
  const CategoryTitleCard(
      {Key? key,
      required this.viewModel,
      required this.id,
      required this.title,
      required this.update,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onClick,
        child: Container(
          height: 81,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          //margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: KColor.containColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [KShadow.shadow],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          title,
                          style: KFont.categoryTitleStyle,
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          '共 ' + count + ' 篇',
                          style: KFont.categoryProfilesStyle,
                        ),
                      ],
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    //Text('最后更新时间：',style: KFont.categoryProfilesStyle,),
                    Text('最后更新时间：' + (update),
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
    //viewModel.onCardClick(id);
  }
}
