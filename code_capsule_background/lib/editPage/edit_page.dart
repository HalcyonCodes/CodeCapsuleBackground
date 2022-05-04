import 'package:flutter/material.dart';
import '../config/index.dart';
import '../globleWidgets/globleNav/nav_globle.dart';
//import './model/viewModel/nav_viewmodel.dart';


class EditPage extends StatefulWidget {
  final int initIndex = 0;


  const EditPage({ Key? key }) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  String headImg = '';

  @override
  void initState() {
    // TODO: implement initState
    print('dd');
    super.initState();
    //NavViewModel navViewModel = NavViewModel();
    //navViewModel.refresh();
    //headImg = navViewModel.headImg;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backGroundColor,
      body: Container(
          constraints: const BoxConstraints(),
          alignment: Alignment.center,
          //width: 900,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 1920,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GlobleNav(headImg: headImg, initIndex: widget.initIndex)
                ],
              ),
            ),
          )),
    );
  }
}