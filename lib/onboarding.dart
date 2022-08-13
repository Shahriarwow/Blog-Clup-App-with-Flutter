import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onBordingItem;
  int page=0;
  @override
  void initState(){
    _pageController.addListener(() { 
      if(_pageController.page!.round() != page){
        setState(() {
          page = _pageController.page!.round();
        });
      }
    
    });
  }

  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Assets.img.background.onBording.image(),
              ),
            ),
            Container(
              height:312,
           
              decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20, color: Colors.black.withOpacity(0.1))
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                children: [
                  Expanded(child: PageView.builder(
                    itemCount:  items.length,
                    controller:  _pageController,
                    itemBuilder:
                  (context  , index)  {
                    return Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Text(items[index].title,style: themeData.textTheme.headline4  ,),

                          const SizedBox(height: 24,),
                          Text(items[index].description,style: themeData.textTheme.subtitle1!.apply(fontSizeDelta: 0.9)),
                        ],

                      ),
                    );
                  }
                   )
                  ),
                  Container(
                    height: 60,   
                       padding:    const EdgeInsets.only(left: 32,right: 32  , bottom: 8),
                    child: Row(
                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                            controller: _pageController, count: items.length,
                            effect: JumpingDotEffect(activeDotColor: themeData.colorScheme.primary, 
                            dotColor: themeData.colorScheme.primary.withOpacity(0.1),
                            dotWidth: 8,
                            dotHeight: 8,
                            ),
                            ),
                            
                          
                            
                        ElevatedButton(
                            onPressed: () {
                           if(page==items.length-1){
                             Navigator.of(context).pushReplacement(
                               MaterialPageRoute(builder: (contex)=> const AuthScreen())
                             );
                           }else{
                        _pageController.animateToPage(page, duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
                           }

                            },
                        
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    const Size(88, 60)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(13)))),
                            child:  Icon(page==items.length-1? CupertinoIcons.check_mark:CupertinoIcons.arrow_right))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
