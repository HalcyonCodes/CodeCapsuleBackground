import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../config/index.dart';
import '../../route/application.dart';
import './model/viewModel/nav_viewmodel.dart';

class GlobleNav extends StatefulWidget {
  final String headImg;
  final int initIndex;

  const GlobleNav({Key? key, required this.headImg, required this.initIndex})
      : super(key: key);

  @override
  State<GlobleNav> createState() => _GlobleNavState();
}

class _GlobleNavState extends State<GlobleNav> {
  NavViewModel? viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = NavViewModel();
  }

  @override
  Widget build(BuildContext context) {
    /*return FutureBuilder<int>(
        future: viewModel!.refresh(),
        builder: (context, snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.none:
              //return navContain(viewModel!.headImg);
              return navContain(null);

            case ConnectionState.waiting:
              //return navContain(viewModel!.headImg);
              return navContain(null);

            case ConnectionState.active:
              //return navContain(viewModel!.headImg);
              return navContain(null);

            case ConnectionState.done:
              return navContain(viewModel!.headImg);
          }
        });*/
    return navContain(widget.headImg);
  }

  Widget navContain(String hImg) {
    return SizedBox(
      child: Container(
        width: 112,
        margin: const EdgeInsets.only(left: 24, top: 24, bottom: 24, right: 0),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        decoration: BoxDecoration(
            boxShadow: [KShadow.shadow],
            borderRadius: BorderRadius.circular(16),
            color: KColor.navColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //头像
            Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(hImg),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                    ),
                  ),
            const SizedBox(
              height: 101,
            ),
            Stack(
              children: [
                Positioned(
                  top: widget.initIndex * (8 + 48),
                  left: 0.0,
                  child: Container(
                    //widget.initIndex * (8 + 48)
                    height: 48,
                    width: 88,
                    decoration: BoxDecoration(
                      color: KColor.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Application.router!.navigateTo(context, '/homePage',
                            clearStack: true,
                            transition: TransitionType.fadeIn);
                      },
                      child: Container(
                          height: 48,
                          width: 112,
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 18,
                            width: 18,
                            child: SvgPicture.asset(
                              'svg/首页.svg',
                              fit: BoxFit.cover,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        Application.router!.navigateTo(context, '/editPage',
                            clearStack: true,
                            transition: TransitionType.fadeIn);
                      },
                      child: Container(
                          height: 48,
                          width: 112,
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 18,
                            width: 18,
                            child: SvgPicture.asset(
                              'svg/编辑.svg',
                              fit: BoxFit.cover,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          height: 48,
                          width: 112,
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 18,
                            width: 18,
                            child: SvgPicture.asset(
                              'svg/应用.svg',
                              fit: BoxFit.cover,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          height: 48,
                          width: 112,
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 18,
                            width: 18,
                            child: SvgPicture.asset(
                              'svg/随机用户.svg',
                              fit: BoxFit.cover,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
