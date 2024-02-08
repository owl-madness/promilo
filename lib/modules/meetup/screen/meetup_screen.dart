import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:promilo_app/modules/meetup/screen/meetup_details_screen.dart';
import 'package:promilo_app/utilities/widgets/banner_image_widget.dart';
import 'package:promilo_app/utilities/widgets/meetup_widget.dart';
import 'package:promilo_app/utilities/widgets/people_card_widget.dart';

class MeetupScreen extends StatefulWidget {
  const MeetupScreen({super.key});

  static const imageList = [
    'https://www.ecomatrixesg.com/cep-institute_files/61ebc48a8c88d264d2e42edc_training-img.jpg',
    'https://www.ecomatrixesg.com/cep-institute_files/61ebc48a8c88d264d2e42edc_training-img.jpg',
    'https://www.ecomatrixesg.com/cep-institute_files/61ebc48a8c88d264d2e42edc_training-img.jpg',
  ];

  @override
  State<MeetupScreen> createState() => _MeetupScreenState();
}

class _MeetupScreenState extends State<MeetupScreen> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Individual Meetup',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Gap(80),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: double.maxFinite,
                          child: CarouselSlider(
                            items: List.generate(
                                MeetupScreen.imageList.length,
                                (index) => Container(
                                      width: 280,
                                      height: 170,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: BannerImageWidget(
                                          imagepath:
                                              MeetupScreen.imageList[index],
                                          textData:
                                              'Popular Meetups\n in India'),
                                    )),
                            options: CarouselOptions(
                              enableInfiniteScroll: false,
                              disableCenter: true,
                              viewportFraction: 1,
                              aspectRatio: 0.5,
                              height: 150,
                              onPageChanged: (index, reason) {
                                print('index $index : $activeIndex');
                                setState(() {
                                  activeIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                        Gap(20),
                        CarouselIndicator(
                          count: MeetupDetailScreen.listImage.length,
                          index: activeIndex,
                          color: Colors.black38,
                          activeColor: Colors.black,
                          cornerRadius: 20,
                          width: 8,
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                  Gap(20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text('Trending Popular People'),
                      ),
                      Gap(10),
                      Container(
                        height: 190,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                              MeetupScreen.imageList.length,
                              (index) => Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0,
                                        top: 5,
                                        right: MeetupScreen.imageList.length ==
                                                (index + 1)
                                            ? 25
                                            : 0),
                                    child: PeopleCardWidget(),
                                  )),
                        ),
                      ),
                      Gap(20),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                'Trending Popular People',
                                style: TextStyle(),
                              ),
                            ),
                            Gap(10),
                            Container(
                              height: 180,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                    5,
                                    (index) => Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.0,
                                              top: 5,
                                              right: index == 4 ? 25 : 0),
                                          child: MeetupCardWidget(
                                              index: (index + 1).toString()),
                                        )),
                              ),
                            ),
                            Gap(35),
                          ])
                    ],
                  )
                ],
              ),
            ),
            Container(
                width: double.maxFinite,
                color: Colors.white,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5)),
                        hintText: 'Search',
                        contentPadding: EdgeInsets.all(8),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(
                          Icons.keyboard_voice_outlined,
                          color: Colors.black,
                        )),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
