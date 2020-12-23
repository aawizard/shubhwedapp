import 'package:flutter/material.dart';
import 'package:shubhwed_web/models/item.dart';


class GiftGrid extends StatelessWidget {
  Item item;
  double height;
  double width;
  GiftGrid(this.item, this.height, this.width);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: width * 0.1,
              width: width * 0.2,
              color: Colors.red,
              child: Image.asset(
                '${item.imagePath}',
                fit: BoxFit.fill,
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
                'Need :${item.quantity.toString()}',
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
      ),
    );
  }
}
