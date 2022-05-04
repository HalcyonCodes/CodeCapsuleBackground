import 'package:flutter/material.dart';
import '../config/index.dart';
//import '../editPage/model/viewModel/nav_viewmodel.dart';
import '../globleWidgets/globleNav/nav_globle.dart';

class HomePage extends StatefulWidget {
  final int initIndex = 0;
  final String headImg;

  const HomePage({Key? key, required this.headImg}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
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
                  GlobleNav(headImg: widget.headImg, initIndex: widget.initIndex),
                  SizedBox(
                    width: 123,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
