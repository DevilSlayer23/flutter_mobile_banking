import 'package:flutter/material.dart';

class CenterNotchedBottomNavbar extends StatefulWidget {
  const CenterNotchedBottomNavbar({Key? key}) : super(key: key);

  @override
  State<CenterNotchedBottomNavbar> createState() =>
      _CenterNotchedBottomNavbarState();
}

class _CenterNotchedBottomNavbarState extends State<CenterNotchedBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      //bottom navigation bar on scaffold
      color: Colors.redAccent,
      shape: CircularNotchedRectangle(), //shape of notch
      notchMargin: 10, //notche margin between floating button and bottom appbar
      child: Row(
        //children inside bottom appbar
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 90),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.people,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
