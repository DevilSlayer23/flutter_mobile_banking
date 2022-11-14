import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:sahakari/common/constant.dart';
import 'package:sahakari/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
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
                            padding: const EdgeInsets.all(10.0),
                            child: CachedNetworkImage(
                                imageUrl:
                                    'https://i.pinimg.com/originals/a4/24/7b/a4247b9e1b1a7e71f5c07862cb14590f.jpg',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                placeholder: (context, url) => ripple_loading,
                                errorWidget: (context, url, error) {
                                  debugPrint(error);
                                  return Icon(
                                    Icons.error,
                                    size: 60,
                                  );
                                }),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${dummyProfile.firstName + " " + dummyProfile.lastName}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("${dummyProfile.mobile}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .primaryColorDark)),
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
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.password,
                    color: Colors.pink,
                  ),
                  title: Text(
                    'Change PIN',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.language,
                    color: Colors.purple,
                  ),
                  title: Text('Change Language',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimary,
                          )),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.perm_data_setting,
                    color: Colors.amber,
                  ),
                  title: Text(
                    'Change Permissions',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
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
                    Navigator.popUntil(context, (route) => route.isFirst);
                    context.go("/login");
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: Text('Logout',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimary,
                          )),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Text(
                "Sahakari Support",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.support_agent,
                    color: Colors.lightBlue,
                  ),
                  title: Text('24x7 Support',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimary,
                          )),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.support,
                    color: Colors.red,
                  ),
                  title: Text(
                    'FAQ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Text(
                "Account Services",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.cyan,
                  ),
                  title: Text(
                    'Update MNP Info',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Text("Terms & Policies",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.message,
                    color: Colors.deepPurpleAccent,
                  ),
                  title: Text(
                    'Terms Of Use',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.privacy_tip,
                    color: Colors.green,
                  ),
                  title: Text(
                    'Privacy Policy',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
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
                      title: Text(
                        "Log Out",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ))),
            ],
          )
        ],
      ),
    );
  }
}
