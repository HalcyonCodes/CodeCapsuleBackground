import 'package:flutter/material.dart';
import '../config/index.dart';
import '../globleWidgets/globleNav/nav_globle.dart';
//import './model/viewModel/nav_viewmodel.dart';

class EditPage extends StatefulWidget {
  final int initIndex = 1;
  final String headImg;

  const EditPage({Key? key, required this.headImg}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backGroundColor,
      body: Container(
          constraints: const BoxConstraints(),
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 1920,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GlobleNav(
                      headImg: widget.headImg, initIndex: widget.initIndex),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
