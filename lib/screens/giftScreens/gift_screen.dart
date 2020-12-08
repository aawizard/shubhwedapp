import 'package:flutter/material.dart';
import 'package:shubhwed/components/navigationDrawer.dart';
import 'package:shubhwed/components/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubhwed/utils/constants.dart';

class giftListScreen extends DrawerContent {
  @override
  _giftListScreenState createState() => _giftListScreenState();
}

class _giftListScreenState extends State<giftListScreen> {
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;

    Future<bool> _onBackPress() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>MainWidget()));
    }
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
            title: Text("Gift List",
           style: GoogleFonts.bitter(
           ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: () {
                  // do something
                },
              )
            ],
            backgroundColor: kDarkPink,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                giftCard()
              ],
            ),
          ),
        ));
  }
}

class giftCard extends StatefulWidget {
  const giftCard({
    Key key, this.imageUrl='', this.giftName, this.giftStatus = false, this.Price, this.giftUrl ='', this.details='',
  }) : super(key: key);
final String imageUrl;
final String giftName;
final bool giftStatus;
final double Price;
final String giftUrl;
final String details;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
onTap: (){

},
      child: Card(

        color: Color(0xfffbb4ba),
        child: Column(
          children: [

              Text("Name",)
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
