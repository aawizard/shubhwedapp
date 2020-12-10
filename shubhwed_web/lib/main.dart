import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shubhwed_web/models/item.dart';
import 'package:shubhwed_web/widgets/attendStatus.dart';
import 'package:shubhwed_web/widgets/fittedText.dart';
import 'package:shubhwed_web/widgets/giftGrid.dart';
import 'package:shubhwed_web/widgets/guestDetails.dart';
import 'package:shubhwed_web/widgets/instruction_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShubhWed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
   List<Item> items=List<Item>(3);
   Item item=Item('assets/mobile.jpeg', 'One Plus 8', 'Rs 28,000', 1, false); 

  
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
              height: height * 0.15,
              width: width * 0.25,
              child: Image.asset(
                'assets/shubhwed.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Amma Lorean & Mark Themson',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Sunday, August 21,2020 \n At Greenland Hotel',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: height * 0.15,
            width: width * 0.7,
            color: Colors.grey[100],
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
            height: height * 0.05,
          ),
          Center(
            child: Container(
              height: height * 0.4,
              width: width * 0.4,
              color: Colors.black,
              child: Image.asset(
                'assets/couple_pic.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            'Gift Registry ',
            style: TextStyle(
                fontSize: (25 / 720) * MediaQuery.of(context).size.width,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Center(
            child: Container(
              width: width * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: height * 0.005,
                    width: width * 0.07,
                    color: Colors.black,
                  ),
                  CircleAvatar(
                    radius: width * 0.01,
                    backgroundColor: Colors.pink,
                  ),
                  CircleAvatar(
                    radius: width * 0.01,
                    backgroundColor: Colors.pink,
                  ),
                  CircleAvatar(
                    radius: width * 0.01,
                    backgroundColor: Colors.pink,
                  ),
                  Container(
                    height: height * 0.005,
                    width: width * 0.07,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            'How it works ',
            style: TextStyle(
              fontSize: (22 / 720) * MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            height: width * 0.7 * 0.3,
            width: width * 0.7,
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
                    "Immediate notification",
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
          SizedBox(height: height*0.01,),
          Container(
             height: width*0.4,
             width: width*0.6,
     
            //padding: EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 8.0),
              itemBuilder: (BuildContext context, int index) {
                return GiftGrid(item,height,width);
              },
            ),
          ),
            Text(
            'RSVP ',
            style: TextStyle(
                fontSize: (25 / 720) * MediaQuery.of(context).size.width,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Center(
            child: Container(
              width: width * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: height * 0.005,
                    width: width * 0.07,
                    color: Colors.black,
                  ),
                  CircleAvatar(
                    radius: width * 0.01,
                    backgroundColor: Colors.pink,
                  ),
                  CircleAvatar(
                    radius: width * 0.01,
                    backgroundColor: Colors.pink,
                  ),
                  CircleAvatar(
                    radius: width * 0.01,
                    backgroundColor: Colors.pink,
                  ),
                  Container(
                    height: height * 0.005,
                    width: width * 0.07,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        SizedBox(
          height: height*0.05,
        ),
         Text(
            'Please let us know whether  you attend  our wedding  ',
            style: TextStyle(
                fontSize: (12 / 720) * MediaQuery.of(context).size.width,
                color: Colors.black,
                ),
          ),
           SizedBox(
          height: height*0.02,
        ),

         AttendStatus(),
         SizedBox(
          height: height*0.02,
        ),

        GuestDetails(),



         
        

        ],

      ),
    );
  }
}
