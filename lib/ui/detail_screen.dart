import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/constants.dart';

class DetailsScreen extends StatefulWidget {
  final String poster;
  final String name;
  final String date;
  final String duration;
  final String rating;
  final String about;

  const DetailsScreen({
    Key? key,
    required this.poster,
    required this.name,
    required this.date,
    required this.duration,
    required this.rating,
    required this.about,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.kGreyColor.withOpacity(0.12),
      ),
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.1,
              left: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 166,
                    width: 166,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.3,
              right: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.all(10.0),
                    width: screenWidth,
                    height: 170,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(widget.poster),
                        fit: BoxFit.fitHeight,
                      ),
                    )),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Name: " + widget.name,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Constants.kWhiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Release date' + widget.date,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Constants.kWhiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Duration : ' + widget.duration,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Constants.kWhiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Rating : ' + widget.rating,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Constants.kWhiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'About : ' + widget.about,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Constants.kWhiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
