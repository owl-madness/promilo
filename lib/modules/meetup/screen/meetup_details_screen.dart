import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social_share/social_share.dart';

class MeetupDetailScreen extends StatefulWidget {
  const MeetupDetailScreen({super.key});

  static const listImage = [
    'assets/images/image3.jpg',
    'assets/images/image2.jpg',
    'assets/images/image1.jpg',
  ];

  static const String dataText =
      'From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp.';

  @override
  State<MeetupDetailScreen> createState() => _MeetupDetailScreenState();
}

class _MeetupDetailScreenState extends State<MeetupDetailScreen> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Description'),
          leading: IconButton(onPressed: () => Navigator.pop(context), icon:  Icon(Icons.arrow_back_ios_new)),
        ),
        body: Center(
          child: SizedBox(
            width: 350,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 187, 187, 187),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                                color: Colors.amberAccent,
                                height: 300,
                                width: 350,
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    CarouselSlider(
                                      items: List.generate(
                                          MeetupDetailScreen.listImage.length,
                                          (index) => Image.asset(
                                                MeetupDetailScreen
                                                    .listImage[index],
                                                fit: BoxFit.cover,
                                                height: 350,
                                                width: 350,
                                              )),
                                      options: CarouselOptions(
                                        viewportFraction: 1,
                                        enlargeCenterPage: false,
                                        height: 350,
                                        onPageChanged: (index, reason) {
                                          print('index $index : $activeIndex');
                                          setState(() {
                                            activeIndex = index;
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 18.0),
                                      child: CarouselIndicator(
                                        count:
                                            MeetupDetailScreen.listImage.length,
                                        index: activeIndex,
                                        color: Colors.white30,
                                        activeColor: Colors.white,
                                        cornerRadius: 20,
                                        width: 8,
                                        height: 8,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.save_alt_outlined),
                              Icon(Icons.bookmark_border),
                              Icon(Icons.favorite_border),
                              Icon(Icons.zoom_out_map),
                              Icon(Icons.star_border),
                              GestureDetector(
                                  onTap: () {
                                    SocialShare.shareOptions('Promilo share');
                                  },
                                  child: Icon(Icons.share_outlined)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Gap(8),
                  Row(
                    children: [
                      Icon(
                        Icons.bookmark_border,
                        size: 13,
                      ),
                      Gap(3),
                      Text(
                        '1034',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 11),
                      ),
                      Gap(12),
                      Icon(Icons.favorite_border, size: 13),
                      Gap(3),
                      Text(
                        '1034',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 11),
                      ),
                      Gap(12),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 216, 213, 213),
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(3),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 13,
                              color: Color.fromARGB(255, 7, 231, 220),
                            ),
                            Gap(3),
                            Icon(
                              Icons.star,
                              size: 13,
                              color: Color.fromARGB(255, 7, 231, 220),
                            ),
                            Gap(3),
                            Icon(
                              Icons.star,
                              size: 13,
                              color: Color.fromARGB(255, 7, 231, 220),
                            ),
                            Gap(3),
                            Icon(
                              Icons.star_outline,
                              size: 13,
                              color: Color.fromARGB(255, 7, 231, 220),
                            ),
                            Gap(3),
                            Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            ),
                            Gap(3),
                          ],
                        ),
                      ),
                      Gap(3),
                      Text('3.2')
                    ],
                  ),
                  Gap(20),
                  Text(
                    'Actor Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  Gap(10),
                  Text('Indian Actress'),
                  Gap(15),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_sharp,
                        size: 18,
                      ),
                      Gap(8),
                      Text('Duration 20 Mins')
                    ],
                  ),
                  Gap(15),
                  Row(
                    children: [
                      Icon(
                        Icons.wallet_rounded,
                        size: 18,
                      ),
                      Gap(8),
                      Text('Total Average Fees \$9,999')
                    ],
                  ),
                  Gap(20),
                  Text(
                    'About',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  Gap(8),
                  Text(MeetupDetailScreen.dataText),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'See more',
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  Gap(30)
                ],
              ),
            ),
          ),
        ));
  }
}
