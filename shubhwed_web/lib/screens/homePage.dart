import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shubhwed_web/widgets/fittedText.dart';
import 'package:shubhwed_web/widgets/instruction_item.dart';
import 'package:shubhwed_web/widgets/giftGrid.dart';
import 'package:shubhwed_web/models/item.dart';



import 'package:shubhwed_web/widgets/guestDetails.dart';

class HomePage extends StatefulWidget {
  Map<String, dynamic> data;
  HomePage(this.data);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String,dynamic>> giftList;
  
    List<Map<String,dynamic>> giftList2;
  
  

  Item item = Item('assets/mobile.jpeg', 'One Plus 8', 'Rs 28,000', 1, false);

  @override
  
   void initState() {
   FirebaseFirestore.instance.collection("users").get().then((querySnapshot) {
  querySnapshot.docs.forEach((result) {
    FirebaseFirestore.instance.
        collection("users")
        .doc(result.id)
        .collection("pets")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
  
        giftList.add(result.data());
      });
    });
  });
});

setState(() {
  giftList2=giftList;
  print("hello");
  print(giftList2);
});
    super.initState();
  }

  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: width,
            height: width * 0.35,
            // color: Colors.orange,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.pexels.com/photos/949587/pexels-photo-949587.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
              
                SizedBox(
                  height: width * 0.02,
                ),
                Container(
                  height: width * 0.07,
                  width: width * 0.6,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FittedText('50 \nDAYS'),
                      FittedText('14 \nHOURS'),
                      FittedText('Countown on \nOur big day !!'),
                      FittedText('12 \nMINUTES'),
                      FittedText('24 \nSECONDS'),
                    ],
                  ),
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "${widget.data['brideName']} & ${widget.data['brideGroomName']} ",
                    style: TextStyle(
                        fontSize:
                            (24 / 720) * MediaQuery.of(context).size.width,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: width * 0.02,
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    '        ${widget.data["date"]} \n At ${widget.data['venue']}',
                    style: TextStyle(
                      fontSize: (12 / 720) * MediaQuery.of(context).size.width,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: width * 0.3),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(width * 0.05),
                    child: Container(
                      width: width * 0.9,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: width * 0.15,
                              width: width * 0.25,
                              child: Image.asset(
                                'assets/shubhwed.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: width * 0.01,
                          ),
                          Text(
                            'Gift Registry ',
                            style: TextStyle(
                              fontSize: (25 / 720) *
                                  MediaQuery.of(context).size.width,
                              color: Colors.pink,
                            ),
                          ),
                          SizedBox(
                            height: width * 0.007,
                          ),
                          Center(
                            child: Container(
                              width: width * 0.25,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: width * 0.001,
                                    width: width * 0.07,
                                    color: Colors.black,
                                  ),
                                  CircleAvatar(
                                    radius: width * 0.008,
                                    backgroundColor: Colors.pink,
                                  ),
                                  CircleAvatar(
                                    radius: width * 0.008,
                                    backgroundColor: Colors.pink,
                                  ),
                                  CircleAvatar(
                                    radius: width * 0.008,
                                    backgroundColor: Colors.pink,
                                  ),
                                  Container(
                                    height: width * 0.001,
                                    width: width * 0.07,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Text(
                            'How it works ',
                            style: TextStyle(
                              fontSize: (22 / 720) *
                                  MediaQuery.of(context).size.width,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: width * 0.01,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InstructionItem(
                                    Icons.info,
                                    "Buy or contribute ",
                                    "Choose your gift. Buy it,or contribute any  amount of your choice towards it",
                                    width,
                                    height),
                                InstructionItem(
                                    Icons.info,
                                    "Instant notification",
                                    'The couple is informed as soon as you get them a gift.Other guest will not know of your purchase',
                                    width,
                                    height),
                                InstructionItem(
                                    Icons.info,
                                    "Direct Delivery",
                                    "Gift and message is shipped directly to couple,unless you choose it to have it to sent to you ",
                                    width,
                                    height),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: width * 0.05,
                          ),
                          Text(
                            'Gift List ',
                            style: TextStyle(
                              fontSize: (22 / 720) *
                                  MediaQuery.of(context).size.width,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          
                          Container(
                            width: width * 0.7,
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 8.0),
                              itemBuilder: (BuildContext context, int index) {
                                return GiftGrid(item, height, width);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.05,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(width * 0.05),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: width * 0.02, bottom: width * 0.02),
                      width: width * 0.9,
                      color: Colors.white,
                      child: Column(children: [
                        Text(
                          'RSVP ',
                          style: TextStyle(
                              fontSize: (16 / 720) *
                                  MediaQuery.of(context).size.width,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: width * 0.005,
                        ),
                        Center(
                          child: Container(
                            width: width * 0.25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: width * 0.001,
                                  width: width * 0.07,
                                  color: Colors.black,
                                ),
                                CircleAvatar(
                                  radius: width * 0.008,
                                  backgroundColor: Colors.pink,
                                ),
                                CircleAvatar(
                                  radius: width * 0.008,
                                  backgroundColor: Colors.pink,
                                ),
                                CircleAvatar(
                                  radius: width * 0.008,
                                  backgroundColor: Colors.pink,
                                ),
                                Container(
                                  height: width * 0.001,
                                  width: width * 0.07,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.01,
                        ),
                        GuestDetails(widget.data),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
