import 'package:flutter/material.dart';
import 'package:shubhwed_web/models/item.dart';

class GiftGrid extends StatelessWidget {
   Item item;
  double height;
  double width;
  GiftGrid(this.item, this.height, this.width);
  @override
  Widget build(BuildContext context) {
    
    return  Container(
   
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            ClipRRect(
              borderRadius: BorderRadius.circular(width*0.005),
                          child: Container(
               
                width: width * 0.2,
                color: Colors.red,
                child: Image.asset(
                  '${item.imagePath}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                '${item.name}',
                style: TextStyle(
                    fontSize: (14 / 720) * MediaQuery.of(context).size.width,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                '${item.itemPrice}',
                style: TextStyle(
                    fontSize: (10 / 720) * MediaQuery.of(context).size.width,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                'Need :1',
                style: TextStyle(
                    fontSize: (10 / 720) * MediaQuery.of(context).size.width,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                'Recieved',
                style: TextStyle(
                    fontSize: (10 / 720) * MediaQuery.of(context).size.width,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      
    );
  }
}
