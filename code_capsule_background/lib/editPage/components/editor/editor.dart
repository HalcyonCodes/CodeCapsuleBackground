import 'package:flutter/material.dart';
import '../../../config/index.dart';
import '../../model/viewModel/article_viewmodel.dart';
import '../../util/page_util.dart';

class Editor extends StatefulWidget {
  final ArticleViewModel articleViewModel;
  const Editor({Key? key, required this.articleViewModel}) : super(key: key);

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 24 - 55 - 24 - 24,
          width: (1920 - 24 - 112 - 24 - 24 - 24) / 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [KShadow.shadow],
              color: KColor.containColor),
          child: SizedBox(),
        ),
        const SizedBox(
          width: 24,
        ),
        Container(
          height: MediaQuery.of(context).size.height - 24 - 55 - 24 - 24,
          width: (1920 - 24 - 112 - 24 - 24 - 24) / 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [KShadow.shadow],
              color: KColor.containColor),
          child: SizedBox(),
        )
      ],
    );
  }
}
