import 'package:flutter/material.dart';
import 'package:tubes_flutter/common/colors.dart';
import 'ui/home/home.dart';
import 'ui/story/story.dart';
import 'ui/visitlist/listdata.dart';
import 'ui/account/account.dart';

void main() {
  runApp(const MyHome());
}

const String page1 = "Home";
const String page2 = "Story";
const String page3 = "Visit List";
const String page4 = "Profile";
const String title = "Touristenziel";

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeName = "home";
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late Widget _page3;
  late Widget _page4;
  late int _currentIndex;
  late Widget _currentPage;
  late Widget _loginPage;

  @override
  void initState() {
    super.initState();
    _page1 = Home();
    _page2 = Story();
    _page3 = VisitList();
    _page4 = Account();
    _pages = [_page1, _page2, _page3, _page4];
    _currentIndex = 0;
    _currentPage = _page1;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _currentPage,
      bottomNavigationBar: new Theme(
         data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
        canvasColor: Colors.blue,
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        primaryColor: Colors.red,
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
          onTap: (index) {
            _changeTab(index);
          },
          backgroundColor: Colors.blue,
          unselectedItemColor: infoColor,
          selectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: page1,
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: page2,
              icon: Icon(Icons.note),
            ),
            BottomNavigationBarItem(
                label: page3, icon: Icon(Icons.location_city)),
            BottomNavigationBarItem(
              label: page4,
            icon: Icon(Icons.people),
          ),
        ]),
      )
    );
  }
}
