import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:promilo_app/modules/meetup/screen/meetup_details_screen.dart';

class MeetupCardWidget extends StatelessWidget {
  const MeetupCardWidget({super.key, required this.index});
  final String index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushNewScreen(context, screen: MeetupDetailScreen()),
      child: Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          image: DecorationImage(image: Image.asset('assets/images/meetup.jpg',).image,fit: BoxFit.fill)
        ),
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 70,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(15))),
                          child: Text('0'+index,style: TextStyle(color: Colors.black,fontSize: 33,fontWeight: FontWeight.bold),),
                ))
          ],
        ),
      ),
    );
  }
}