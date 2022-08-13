import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/article.dart';
import 'package:flutter_application_1/carousel/carousel_slider.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/gen/fonts.gen.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/profil.dart';
import 'package:flutter_application_1/splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white, //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
      systemNavigationBarColor: Colors.white, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secendryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(const TextStyle(
          fontFamily: FontFamily.avenir,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        )))),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          background: Color(0xffFBFCFF),
          onBackground: primaryTextColor,
          onSurface: primaryTextColor,
          surface: Colors.white,
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            titleSpacing: 32,
            foregroundColor: primaryTextColor,
            elevation: 0),
        textTheme: const TextTheme(
          subtitle1: TextStyle(
              fontFamily: FontFamily.avenir,
              color: secendryTextColor,
              fontWeight: FontWeight.w200,
              fontSize: 18),
          subtitle2: TextStyle(
              fontFamily: FontFamily.avenir,
              color: primaryTextColor,
              fontWeight: FontWeight.w200,
              fontSize: 14),
          headline6: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w700,
              fontSize: 18),
          headline4: TextStyle(
              fontFamily: FontFamily.avenir,
              color: primaryTextColor,
              fontWeight: FontWeight.w700,
              fontSize: 24),
          caption: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w700,
              fontSize: 10,
              color: Color(0xff7B8BB2)),
          headline5: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w700,
              color: primaryTextColor,
              fontSize: 20),
          bodyText1: TextStyle(
              fontFamily: FontFamily.avenir,
              color: primaryTextColor,
              fontSize: 14),
          bodyText2: TextStyle(
              fontFamily: FontFamily.avenir,
              color: secendryTextColor,
              fontSize: 12),
        ),
      ),

      // home: Stack(
      //   children: [
      //     Positioned.fill(child: const HomeScareen()),
      //     Positioned(right: 0, left: 0, bottom: 0, child: _ButtomNavigation())
      //   ],
      // ),
      home: const SpslashScreen(),
    );
  }
}

class MAinScreen extends StatefulWidget {
  const MAinScreen({Key? key}) : super(key: key);

  @override
  State<MAinScreen> createState() => _MAinScreenState();
}

const int homeindex = 0;
const int articleindex = 1;
const int searchindex = 2;
const int menuindex = 3;
const double bottemNavigationHaite = 65;

class _MAinScreenState extends State<MAinScreen> {
  int selectedScreenindex = homeindex;
  List<int> _history = [];

  final GlobalKey<NavigatorState> _homekey = GlobalKey();
  final GlobalKey<NavigatorState> _articlekey = GlobalKey();
  final GlobalKey<NavigatorState> _searchkey = GlobalKey();
  final GlobalKey<NavigatorState> _menukey = GlobalKey();

  late final map = {
    homeindex: _homekey,
    articleindex: _articlekey,
    searchindex: _searchkey,
    menuindex: _menukey
  };

  Future<bool> _onWillPop() async {
    final NavigatorState curentSelectedTabNavigatorState =
        map[selectedScreenindex]!.currentState!;
    if (curentSelectedTabNavigatorState.canPop()) {
      curentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenindex = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottemNavigationHaite,
              child: IndexedStack(
                index: selectedScreenindex,
                children: [
                  _navigator(_homekey, homeindex, const HomeScareen()),
                  _navigator(_articlekey, articleindex, const ArticleScreen()),
                  _navigator(_searchkey, searchindex, const SearchScreen()),
                  _navigator(_menukey, menuindex, const ProfileScreen()),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: _ButtomNavigation(
                selectedindex: selectedScreenindex,
                onTap: (int index) {
                  setState(() {
                    _history.remove(selectedScreenindex);
                    _history.add(selectedScreenindex);
                    selectedScreenindex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenindex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => Offstage(
                    offstage: selectedScreenindex != index, child: child)),
          );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search Screen :)'),
    );
  }
}

class _ButtomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedindex;

  const _ButtomNavigation(
      {Key? key, required this.onTap, required this.selectedindex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: const Color(0xff9b8487).withOpacity(0.3)),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButomNavigationIthem(
                    ontap: () {
                      onTap(homeindex);
                    },
                    iconFileName: 'home.png',
                    isActive: selectedindex == homeindex,
                    activeIconeFileName: 'homeActive.png',
                    title: 'Home',
                  ),
                  ButomNavigationIthem(
                    iconFileName: 'Articles.png',
                    ontap: () {
                      onTap(articleindex);
                    },
                    isActive: selectedindex == articleindex,
                    activeIconeFileName: 'articleActive.png',
                    title: 'Article',
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 8,
                    ),
                  ),
                  ButomNavigationIthem(
                    iconFileName: 'search.png',
                    ontap: () {
                      onTap(searchindex);
                    },
                    isActive: selectedindex == searchindex,
                    activeIconeFileName: 'searchAvctive.png',
                    title: 'Search',
                  ),
                  ButomNavigationIthem(
                    iconFileName: 'menu.png',
                    ontap: () {
                      onTap(menuindex);
                    },
                    isActive: selectedindex == menuindex,
                    activeIconeFileName: 'menuActive.png',
                    title: 'Menu',
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: bottemNavigationHaite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.5),
                    color: const Color(0xff376AED),
                    border: Border.all(color: Colors.white, width: 4)),
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButomNavigationIthem extends StatelessWidget {
  final String iconFileName;
  final String activeIconeFileName;
  final String title;
  final bool isActive;
  final Function() ontap;
  const ButomNavigationIthem(
      {Key? key,
      required this.iconFileName,
      required this.activeIconeFileName,
      required this.ontap,
      required this.title,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/icons/${isActive ? activeIconeFileName : iconFileName}',
              width: 25,
              height: 25,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: themedata.textTheme.caption!.apply(
                color: isActive
                    ? themedata.colorScheme.primary
                    : themedata.textTheme.caption!.color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
