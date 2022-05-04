import 'package:flutter/material.dart';
import '../config/index.dart';
//import '../editPage/model/viewModel/nav_viewmodel.dart';
import '../globleWidgets/globleNav/nav_globle.dart';



class HomePage extends StatefulWidget {
  final int initIndex = 0;


  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String headImg = '';

  @override
  void initState() {
    // TODO: implement initState
    print('dddd');
    super.initState();
  
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backGroundColor,
      body: Container(
          constraints: const BoxConstraints(),
          alignment: Alignment.center,
          //width: 1920,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 1920,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GlobleNav(headImg: headImg, initIndex: widget.initIndex),
                  SizedBox(width: 123,)
                ],
              ),
            ),
          )),
    );
  }
}