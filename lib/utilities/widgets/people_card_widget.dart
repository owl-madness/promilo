import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PeopleCardWidget extends StatelessWidget {
  const PeopleCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 320,
      constraints: BoxConstraints(minWidth: 280),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black,width: 0.5)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.black)),
                child: Icon(Icons.edit),
              ),
              Gap(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Author',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('1,028 Meetups')
                ],
              )
            ],
          ),
          SizedBox(width: 280, child: Divider(color: Colors.black,thickness: 0.9,)),
          Stack(
            textDirection: TextDirection.rtl,
            // alignment: Alignment.bottomLeft,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    foregroundImage: AssetImage('assets/images/person4.jpeg'),
                    maxRadius: 26,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:  30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      foregroundImage: AssetImage('assets/images/person1.jpeg'),
                    maxRadius: 26,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:  65.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      foregroundImage: AssetImage('assets/images/person3.jpg'),
                      maxRadius: 26,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:  100.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      foregroundImage: AssetImage('assets/images/person2.jpg'),
                      maxRadius: 26,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:  135.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      // backgroundColor: Colors.blueAccent,
                      foregroundImage: AssetImage('assets/images/person1.jpeg'),
                      maxRadius: 26,
                      // child:  Image.asset('assets/images/person1.jpeg'),
                    ),
                  ),
                ),
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 90,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 14, 128, 221),
                  borderRadius: BorderRadius.circular(9)
                ),
                child: TextButton(onPressed: null, child: Text('See more',style: TextStyle(color: Colors.white,fontSize: 12),)))
            ],
          )
        ],
      ),
    );
  }
}