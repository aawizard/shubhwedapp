import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shubhwed/utils/constants.dart';
//import '../Utils/shared_preference_helper.dart';
//import '../model/user.dart';
import '../screens/home_screen.dart';
import 'drawer.dart';
import 'package:shubhwed/screens/giftScreens/gift_screen.dart';
import 'package:shubhwed/screens/home_screen.dart';
import 'package:shubhwed/screens/guestScreens/guest_list.dart';

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title, this.uid}) : super(key: key);
  final String title;
  final String uid;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  HiddenDrawerController _drawerController;
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
      initialPage: homeScreen(),
      items: [
        DrawerItem(
          text: 'Home',
          icon: Icons.home,
          page: homeScreen(),
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HiddenDrawer(
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
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: Image.asset("assets/shubhwed.png",
                width: MediaQuery.of(context).size.width/2,),
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
    );
  }
}
