import 'package:flutter/material.dart';
import 'package:shubhwed/components/navigationDrawer.dart';
import 'package:shubhwed/components/drawer.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubhwed/services/db.dart';
import 'package:shubhwed/models/user.dart';
import 'package:provider/provider.dart';
import 'package:shubhwed/screens/profile/editProfile.dart';
class Profile extends DrawerContent {
final String uid;
Profile({this.uid});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPress() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainWidget()));
    }
    DatabaseService _db=DatabaseService(widget.uid);
    double width=MediaQuery.of(context).size.width;

    var user= Provider.of<users>(context);
    print(user.name);
    return WillPopScope(
        onWillPop: _onBackPress,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                ),
                onPressed: widget.onMenuPressed,
              ),
              actions: [
                IconButton(
                  onPressed: (){
                   Navigator.push(context, MaterialPageRoute(
                     builder: (context)=>EditProfile(user: user,)
                   ));
                  },
                  icon: Icon(
                    Icons.edit
                  ),
                )
              ],
              title: Text(
                "Profile",
                style: GoogleFonts.bitter(),
              ),

              backgroundColor: kDarkPink,
            ),

            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 20),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: width/6,
                          child: Icon(
                            Icons.person,
                            size: width/6,
                            color: Colors.white,
                          ),
                        ),

                      ),

                    ),
                    Text(
                      user.name,
                      style: GoogleFonts.bitter(
                        color: Colors.black,
                        fontSize: width/15
                      ),
                    ),
                    Text(
                      user.email,
                      style: GoogleFonts.bitter(
                          color: Colors.black,
                          fontSize: width/20
                      ),
                    ),
                    SizedBox(
                      height:20 ,
                    ),
                    ProfileCard(leading:"Bride's Name:" ,title: user.brideName,),
                    ProfileCard(leading:"BrideGroom's Name:" ,title: user.brideGroomName,),
                    ProfileCard(leading:"Phone Number:" ,title: user.phoneNumber,),
                    ProfileCard(leading:"Date:" ,title: user.date,),
                    ProfileCard(leading:"Venue:" ,title: user.venue,),
                    ProfileCard(leading:"Delivery Address:" ,title: user.deliveryAddress,),
                    ProfileCard(leading:"GPay Numver:" ,title: user.gPayNumber,),
                    ProfileCard(leading:"PayTm Number:" ,title: user.payTmNumber,),
                    ProfileCard(leading:"UPI ID:" ,title: user.upiID,),
                    ProfileCard(leading:"Bank Account No.:" ,title: user.bankAccountNumber,),
                    ProfileCard(leading:"Account Holder Name:" ,title: user.accountHolderName,),
                    ProfileCard(leading:"IFSC Code:" ,title: user.ifscCode,),

                  ],
                ),
              ),
            )
        
        
        ));
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key key,
    @required this.leading, this.title,
  }) : super(key: key);

  final String leading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: kDarkPink,
      elevation: 5,
      child: ListTile(
        leading: Text(
          leading
        ),
        title: Text(
          title==''?'-':title,
        ),

      ),
    );
  }
}
