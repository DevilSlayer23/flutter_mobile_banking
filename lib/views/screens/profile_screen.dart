import 'package:sahakari/models/profile.dart';
import 'package:sahakari/services/API/api_helper.dart';
import 'package:sahakari/common/constant.dart';
import 'package:sahakari/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loading_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Profile profile = Profile(
    id: 0,
    firstName: 'Jon',
    lastName: 'Doe',
    email: 'jondoe@gmail.com',
    balance: double.parse('123.90'),
    mobile: '+977 9812345678',
    nid: '1234567890',
    pin: '1234',
  );
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  getdata() {
    
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return CustomScaffold(
      isRoot: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "My Account".toUpperCase(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          Center(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: !isLoading
                  ? Container(
                      width: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                  'https://www.pngfind.com/pngs/m/319-3194386_anime-transparent-bad-boy-bad-boy-anime-boy.png',
                                  scale: 1),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${profile.firstName + " " + profile.lastName}",
                                  style: TextStyle(fontSize: 22)),
                              SizedBox(
                                height: 5,
                              ),
                              Text("${profile.mobile}",
                                  style: TextStyle(fontSize: 16)),
                            ],
                          )
                        ],
                      ),
                    )
                  : Center(
                      child: blue_loading,
                    ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.password,
                    color: Colors.pink,
                  ),
                  title: Text('Change PIN'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.language,
                    color: Colors.purple,
                  ),
                  title: Text('Change Language'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.perm_data_setting,
                    color: Colors.amber,
                  ),
                  title: Text('Change Permissions'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.remove("user_exist");
                    pref.remove("token");
                    pref.remove("phone_number");
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoadingScreen()));
                    // pushNewScreen(
                    //   context,
                    //   screen: LoadingScreen(),
                    //   withNavBar: true, // OPTIONAL VALUE. True by default.
                    //   pageTransitionAnimation:
                    //       PageTransitionAnimation.cupertino,
                    // );
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: Text('Logout'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Text(
                "sahakari Support",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.support_agent,
                    color: Colors.lightBlue,
                  ),
                  title: Text('24x7 Support'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.support,
                    color: Colors.red,
                  ),
                  title: Text('FAQ'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Text(
                "Account Services",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.cyan,
                  ),
                  title: Text('Update MNP Info'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Text("Terms & Policies",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.message,
                    color: Colors.deepPurpleAccent,
                  ),
                  title: Text('Terms Of Use'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.privacy_tip,
                    color: Colors.green,
                  ),
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Card(
                  child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      title: Text("Log Out",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red)))),
            ],
          )
        ],
      ),
    );
  }
}
