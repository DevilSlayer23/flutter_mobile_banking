import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sahakari/views/screens/qr_scanner/qr_scanner_latest.dart';
import 'package:sahakari/views/screens/dashboard/dashboard_screen.dart';
import 'package:sahakari/views/screens/transaction/transaction_history.dart';
import 'package:sahakari/views/screens/utils/offer_screen.dart';
import 'package:sahakari/views/screens/utils/profile_screen.dart';

// ----------------------------------------- Provided Style ----------------------------------------- //

class DashboardMain extends StatefulWidget {
  DashboardMain({Key? key}) : super(key: key);

  @override
  _DashboardMainState createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain> with RouteAware {
  late PersistentTabController _controller;
  late bool _hideNavBar;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    // checkIfLoggedIn();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
      context: this.context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.onPrimary,
                  )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Would you like to exit the app?',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 24,
                        color: Theme.of(context).primaryColorDark,
                      ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            TextButton(
              child: Text(
                'OK',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return [
      Dashboard(),
      TransactionHistory(),
      QrScannerLatest(),
      OfferScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).colorScheme.onPrimary,
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.access_time),
        title: ("History"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).colorScheme.onPrimary,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.qr_code,
          color: Colors.white,
        ),
        title: ("QR Scanner"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).colorScheme.onPrimary,
        filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.local_offer),
        title: ("Offers"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).colorScheme.onPrimary,
        // routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //   initialRoute: '/',
        //   routes: {
        //     '/first': (context) => MainScreen2(),
        //     '/second': (context) => MainScreen3(),
        //   },
        // ),
        // onPressed: (context) {
        //   pushDynamicScreen(context,
        //       screen: SampleModalScreen(), withNavBar: true);
        // },
      ),
      // PersistentBottomNavBarItem(
      //   icon: Icon(Icons.message),
      //   title: ("Messages"),
      //   activeColorPrimary: Colors.deepOrange,
      //   inactiveColorPrimary: Colors.grey,
      //   // routeAndNavigatorSettings: RouteAndNavigatorSettings(
      //   //   initialRoute: '/',
      //   //   routes: {
      //   //     '/first': (context) => MainScreen2(),
      //   //     '/second': (context) => MainScreen3(),
      //   //   },
      //   //),
      // ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).colorScheme.onPrimary,
        // routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //   initialRoute: '/',
        //   routes: {
        //     '/first': (context) => MainScreen2(),
        //     '/second': (context) => MainScreen3(),
        //   },
        // ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          // onWillPop: (context) => _onWillPop(context),
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          // handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          // stateManagement: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          // navBarHeight: kBottomNavigationBarHeight,
          hideNavigationBarWhenKeyboardShows: true,
          margin: EdgeInsets.all(0.0),
          popActionScreens: PopActionScreensType.all,
          bottomScreenMargin: 0.0,
          // onWillPop: (context) async {
          //
          //   return false;
          // },
          selectedTabScreenContext: (context) {
            var testContext = context;
          },
          hideNavigationBar: _hideNavBar,
          decoration: NavBarDecoration(
              colorBehindNavBar: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
          popAllScreensOnTapOfSelectedTab: true,

          itemAnimationProperties: ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.fastLinearToSlowEaseIn,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 400),
          ),
          navBarStyle: NavBarStyle.style15,
        ),
      ),
    );
  }

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView.custom(
//       context,
//       controller: _controller,
//       // handleAndroidBackButtonPress: true,
//       onWillPop: (context) => _onWillPop(context),
//       screens: _buildScreens(),
//       itemCount: _buildScreens().length,
//       hideNavigationBar: _hideNavBar,
//       screenTransitionAnimation: const ScreenTransitionAnimation(
//         animateTabTransition: true,
//       ),
//       customWidget: CustomNavBarWidget(
//         items: _navBarsItems(),
//         onItemSelected: (final index) {
//           setState(() {
//             _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
//           });
//         },
//         selectedIndex: _controller.index,
//       ),
//     );
//   }
}
// ----------------------------------------- Custom Style ----------------------------------------- //

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({
    Key? key,
    this.selectedIndex = 0,
    required this.items,
    required this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: kBottomNavigationBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected
                      ? (item.activeColorSecondary == null
                          ? item.activeColorPrimary
                          : item.activeColorSecondary)
                      : item.inactiveColorPrimary == null
                          ? item.activeColorPrimary
                          : item.inactiveColorPrimary),
              child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                item.title.toString(),
                style: TextStyle(
                    color: isSelected
                        ? (item.activeColorSecondary == null
                            ? item.activeColorPrimary
                            : item.activeColorSecondary)
                        : item.inactiveColorPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            int index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  this.onItemSelected(index);
                },
                child: _buildItem(item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
