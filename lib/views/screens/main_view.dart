import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahakari/common/constant.dart';
import 'package:sahakari/providers/main_provider.dart';
import 'package:sahakari/views/screens/dashboard/dashboard_screen.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'qr_scanner/qr_scanner_latest.dart';
import 'transaction/transaction_history.dart';
import 'utils/offer_screen.dart';
import 'utils/profile_screen.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with AutomaticKeepAliveClientMixin<MainView> {
  @override
  bool get wantKeepAlive => true;

  PageController _pageController = PageController(initialPage: 0);
  List<Widget> Screens = [
    Dashboard(),
    TransactionHistory(),
    QrScannerLatest(),
    OfferScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final provider = Provider.of<MainScreenProvider>(context);
    ;

    return Scaffold(
      extendBody: true,
      body: PageView.builder(
        controller: _pageController,
        allowImplicitScrolling: false,
        itemBuilder: (BuildContext context, int index) {
          return Screens[provider.selectedIndex];
        },
        // onPageChanged: (value) => provider.changeIndex(value),
      ),
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
          provider.updateTabSelection(2, "QR Scanner");
        },
        child: Icon(Icons.qr_code_rounded), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Consumer(
          builder: (BuildContext context, MainScreenProvider provider,
                  Widget? child) =>
              Container(
            margin: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    provider.updateTabSelection(0, 'Home');
                    // _controller.jumpToPage(provider.selectedIndex);
                  },
                  child: Icon(
                    Icons.home,
                    color:
                        Provider.of<MainScreenProvider>(context, listen: false)
                                    .selectedIndex ==
                                0
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    provider.updateTabSelection(1, 'Payments');
                    // _controller.jumpToPage(provider.selectedIndex);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.payment,
                    color:
                        Provider.of<MainScreenProvider>(context, listen: false)
                                    .selectedIndex ==
                                1
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                //to leave space in between the bottom app bar items and below the FAB
                SizedBox(
                  width: 48.0,
                ),
                IconButton(
                  onPressed: () {
                    provider.updateTabSelection(3, 'Products');
                    // _controller.jumpToPage(provider.selectedIndex);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.shopping_bag,
                    color:
                        Provider.of<MainScreenProvider>(context, listen: false)
                                    .selectedIndex ==
                                3
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.updateTabSelection(4, 'More');
                    // _controller.jumpToPage(provider.selectedIndex);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color:
                        Provider.of<MainScreenProvider>(context, listen: false)
                                    .selectedIndex ==
                                4
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
        //to add a space between the FAB and BottomAppBar
        shape: CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: lightBackgroundColor,
      ),
      // StylishBottomBar(
      //   items: [
      //     AnimatedBarItems(
      //         icon: Icon(
      //           Icons.home,
      //         ),
      //         selectedColor: Colors.deepPurple,
      //         backgroundColor: Colors.amber,
      //         title: Text('Home')),
      //     AnimatedBarItems(
      //         icon: Icon(
      //           Icons.history,
      //         ),
      //         selectedColor: Colors.green,
      //         backgroundColor: Colors.amber,
      //         title: Text('Transaction')),
      //     AnimatedBarItems(
      //         icon: Icon(
      //           Icons.qr_code_scanner,
      //         ),
      //         backgroundColor: Colors.amber,
      //         selectedColor: Colors.pinkAccent,
      //         title: Text('QR')),
      //     AnimatedBarItems(
      //         icon: Icon(
      //           Icons.card_giftcard,
      //         ),
      //         selectedColor: Colors.deepPurple,
      //         backgroundColor: Colors.amber,
      //         title: Text('Offer')),
      //     AnimatedBarItems(
      //         icon: Icon(
      //           Icons.person,
      //         ),
      //         selectedColor: Colors.deepPurple,
      //         backgroundColor: Colors.amber,
      //         title: Text('Profile')),
      //     // BubbleBarItem(icon: Icon(Icons.home), title: Text('Home')),
      //     // BubbleBarItem(icon: Icon(Icons.add_circle_outline), title: Text('Add')),
      //     // BubbleBarItem(icon: Icon(Icons.person), title: Text('Profile')),
      //   ],

      //   iconSize: 32,
      //   barAnimation: BarAnimation.liquid,
      //   // iconStyle: IconStyle.animated,
      //   // iconStyle: IconStyle.simple,
      //   hasNotch: true,
      //   fabLocation: StylishBarFabLocation.end,
      //   opacity: 0.3,
      //   currentIndex: _selectedIndex,

      //   //Bubble bar specific style properties
      //   //unselectedIconColor: Colors.grey,
      //   //barStyle: BubbleBarStyle.horizotnal,
      //   //bubbleFillStyle: BubbleFillStyle.fill,

      //   onTap: (index) {
      //     pageController.jumpToPage(index as int);
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      // ),
    );
  }
}
