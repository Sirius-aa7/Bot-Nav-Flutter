import 'package:flutter/material.dart';
import 'package:bot_nav_latest/pages/competition.dart';
import 'package:bot_nav_latest/pages/market.dart';
import 'package:bot_nav_latest/pages/profile.dart';
import 'package:bot_nav_latest/pages/portfolio.dart';

void main() => runApp( MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNav(),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int currentTabIndex = 0;

  List <Widget> pages;
  Widget currentPage;

  PortfolioPage portfolioPage;
  MarketPage marketPage;
  CompetitionPage competitionPage;
  ProfilePage profilePage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    portfolioPage = PortfolioPage();
    marketPage = MarketPage();
    competitionPage = CompetitionPage();
    profilePage = ProfilePage();

    pages = [portfolioPage , marketPage , competitionPage , profilePage];

    currentPage = portfolioPage;
  }

  /*static List<Widget> _widgetOptions = <Widget>[
    //CompePage(),
    Text(
      'Index 0: Portfolio',
      style: optionStyle,
    ),
    Text(
      'Index 1: Market',
      style: optionStyle,
    ),
    Text(
      'Index 2: Competition',
      style: optionStyle,
    ),
    //PortfolioPage(),
    /*Text(
      'Index 2: Competition',
      style: optionStyle,
    ),
     */
    Column(
      children: [
        Text(
          'Sign in!',
          style: optionStyle,
        ),
        RaisedButton(
          color: Colors.lightBlueAccent,
          child: Text('Click here to sign in'),
          onPressed: (){
            int counter=0; // added for testing 4th screen
            //onPressedSignIn(counter);
            // the above functions aren't working as this is initialization. need to think of something smart
            Text(counter.toString());  // random text for now
            //Navigator.push( context, MaterialPageRoute(builder: (context) => SecondRoute()),);
          },
        ),
      ],
    ),
    Text(
      'You have not signed in!',
      style: optionStyle,
    ),
    // initially the above was being displayed when clicked on profile.
    // but now as column is at index 3 (screen 4), it will be displayed. to display the lower text above again, just place it above column
  ];
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('COINZY'),
        backgroundColor: Colors.black54, // color of app bar only
      ),*/ // appBar commented here

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting, // fixed: fixes the width of the items
        // for sme reason, only 1 label visible
        // if we make type rigid, all labels visible, moreover color combn changes a bit
        items: const <BottomNavigationBarItem>[
          // removed const from here weird error!
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Portfolio',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Market',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Competition',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: currentTabIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index){
          setState(() {
            currentTabIndex = index;
            currentPage = pages [index];
          });
        },
      ),
      body: currentPage,
    );
  }
}

/*
class SecondRoute extends StatefulWidget {
  SecondRoute({Key key}) : super(key: key);

  @override
  _SecondRoute createState() => _SecondRoute();
}

class _SecondRoute extends State<SecondRoute>{

  _BottomNavState myHomePageState= new _BottomNavState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold( // container is a flexible widgets for custom ui, while scaffold has a particular set of properties kinda predefined
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        '°Cold',
                        style: TextStyle(color: Colors.red, fontSize: 60.0),
                      ),
                    ),
                    Center(
                      child: Text(
                        'degree warm',
                        style: TextStyle(color: Colors.blue, fontSize: 40.0),
                      ),
                    )
                  ]
              ),
              Column(
                children:<Widget>[
                  RaisedButton(
                    color: Colors.blueGrey,
                    child: Text('GO BACK!',
                      style: TextStyle(
                          color: Colors.white
                      ),),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ],
              )

            ],
          ),
        )
    );
  }
}

 */
