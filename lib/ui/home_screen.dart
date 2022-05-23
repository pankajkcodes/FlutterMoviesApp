import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttermoviesapp/models/movie_model.dart';
import 'package:fluttermoviesapp/ui/detail_screen.dart';
import 'package:fluttermoviesapp/utils/constants.dart';

import '../components/search_field_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
                bottom: false,
                child: ListView(
                  primary: true,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'What would you\nlike to watch?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Constants.kWhiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    const SearchFieldWidget(
                        padding: EdgeInsets.symmetric(horizontal: 5.0)),
                    const SizedBox(
                      height: 21,
                    ),
                    SizedBox(
                      height: 170,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: posterMovies.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailsScreen(
                                    rating: posterMovies[index].movieRating,
                                    date: posterMovies[index].movieReleaseYear,
                                    about: posterMovies[index].movieSinopsis,
                                    duration: posterMovies[index].movieDuration,
                                    name: posterMovies[index].movieName,
                                    poster: posterMovies[index].moviePoster,
                                  );
                                }));
                              },
                              child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  width: 300,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          posterMovies[index].moviePoster),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  )),
                            );
                          }),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "New Movies",
                        style: TextStyle(color: Constants.kWhiteColor),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    SizedBox(
                      height: 170,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: newMovies.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailsScreen(
                                    rating: newMovies[index].movieRating,
                                    date: newMovies[index].movieReleaseYear,
                                    about: newMovies[index].movieSinopsis,
                                    duration: newMovies[index].movieDuration,
                                    name: newMovies[index].movieName,
                                    poster: newMovies[index].moviePoster,
                                  );
                                }));
                              },
                              child: Container(
                                  width: 146,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          newMovies[index].moviePoster),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  )),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Upcoming Movies",
                        style: TextStyle(color: Constants.kWhiteColor),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    SizedBox(
                      height: 170,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: upcomingMovies.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailsScreen(
                                    rating: upcomingMovies[index].movieRating,
                                    date:
                                        upcomingMovies[index].movieReleaseYear,
                                    about: upcomingMovies[index].movieSinopsis,
                                    duration:
                                        upcomingMovies[index].movieDuration,
                                    name: upcomingMovies[index].movieName,
                                    poster: upcomingMovies[index].moviePoster,
                                  );
                                }));
                              },
                              child: Container(
                                  width: 146,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          upcomingMovies[index].moviePoster),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  )),
                            );
                          }),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
