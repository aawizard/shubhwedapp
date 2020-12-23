import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:shubhwed/screens/profile/profile.dart';
import '../screens/home_screen.dart';
import 'drawer.dart';
import 'package:shubhwed/screens/giftScreens/gift_screen.dart';
import 'package:shubhwed/screens/home_screen.dart';
import 'package:shubhwed/screens/guestScreens/guest_screen.dart';
import 'package:shubhwed/services/db.dart';
import 'package:shubhwed/models/user.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title, this.uid}) : super(key: key);
  final String title;
  final String uid;

  @override
  _MainWidgetState createState() => _MainWidgetState(uid);
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  final String uid;
  HiddenDrawerController _drawerController;

  _MainWidgetState(this.uid);
//  User userLoad = new User();
////  Future fetchUserDetailsFromSharedPref() async {
////    var result =
////    await SharedPreferenceHelper.getStringValue(Constants.USER_OBJECT);
////    Map valueMap = json.decode(result);
////    User user = User.fromJson(valueMap);
////    setState(() {
////      userLoad = user;
////    });
////  }

  @override
  void initState() {
    super.initState();
//    fetchUserDetailsFromSharedPref();
    _drawerController = HiddenDrawerController(
      initialPage: homeScreen(uid: uid,),
      items: [
        DrawerItem(
          text: 'Home',
          icon: Icons.home,
          page: homeScreen(uid: uid,),
        ),
        DrawerItem(
          text: 'GuestList',
          icon: Icons.people,
          page: guestListScreen(),
        ),
        DrawerItem(
          text: 'Gift List',
          icon: Icons.card_giftcard,
          page: giftListScreen(),
        ),
        DrawerItem(
          text: 'Profile',
          icon: Icons.person,
          page: Profile(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var user=Provider.of<User>(context);
    DatabaseService _db=DatabaseService(user.uid);
    StreamProvider<users>.value(value: _db.streamUser());
    return Scaffold(
      body: StreamProvider<users>.value(
        value: _db.streamUser(),
        child: HiddenDrawer(
          controller: _drawerController,
          header: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  // height: 75,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: kSkin, width: 2)),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ClipOval(
                    child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/couple-icon.png"),
//                    NetworkImage(
//                      userLoad.imageURL??'',
//                    ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Image.asset(
                    "assets/shubhwed.png",
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                )
//              Text(
//                userLoad.name??'',
//                style: TextStyle(color: Colors.black, fontSize: 20),
//              ),
//              Text(
//                  userLoad.email??'',
//                  style: TextStyle(color: Colors.black,fontSize: 12)
//              )
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xFFFBBABC).withOpacity(.75),
          ),
        ),
      ),
    );
  }
}
