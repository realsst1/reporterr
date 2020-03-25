import 'package:flutter/material.dart';
import 'package:reporterr/screens/categories_screen.dart';
import 'package:reporterr/screens/home_page.dart';
import 'package:reporterr/screens/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentTab=0;

  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reporterr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Reporterr"),
          centerTitle: true,
        ),
        //resizeToAvoidBottomPadding: false,
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            HomePage(),
            CategoriesScreen(),
            SearchScreen()
          ],
          onPageChanged: (int index){
            setState(() {
              _currentTab=index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentTab,
          onTap: (int index){
            setState(() {
              _currentTab=index;
            });
            _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          },
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(
                Icons.home,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              title: Text("Categories"),
              icon: Icon(
                Icons.explore,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('Search'),
              icon: Icon(
                Icons.search,
                size: 32.0,
              ),
            )
          ],
        ),
      )
    );
  }
}


