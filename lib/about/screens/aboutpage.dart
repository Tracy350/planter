import 'package:flourish/about/widgets/about_banner.dart';
import 'package:flourish/about/widgets/review_card.dart';
import 'package:flourish/home/widget/custombuttonfilled.dart';
import 'package:flourish/widgets/customappbar.dart';
import 'package:flourish/widgets/customheader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Aboutpage extends StatelessWidget {
  const Aboutpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Customheader(
              currentpage: 'About Us',
              pagepath: 'Home > About Us',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Elevate your Space with Flourish',
                              style: GoogleFonts.poppins(
                                  fontSize: 20, color: Colors.green)),
                          Text(
                            'Add a touch of nature to your home with our\n curated selection of plants and accessories. ',
                            style: GoogleFonts.dmSerifDisplay(fontSize: 30),
                          ),
                          const SizedBox(height: 20),
                          Custombuttonfilled(
                            onTap: () {},
                            height: 50,
                            text: 'Shop Now',
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Image.asset(
                        'assets/aboutus.jpg',
                        height: 500,
                        width: 600,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Image.asset(
                        'assets/aboutus.jpg',
                        height: 700,
                        width: 600,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text('Elevate your Space with Flourish',
                              style: GoogleFonts.poppins(
                                  fontSize: 20, color: Colors.green)),
                          Text(
                            'Add a touch of nature to your home with our\n curated selection of plants and accessories. ',
                            style: GoogleFonts.dmSerifDisplay(fontSize: 30),
                          ),
                          const SizedBox(height: 20),
                          Custombuttonfilled(
                            onTap: () {},
                            height: 50,
                            text: 'Shop Now',
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            AboutBanner(),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ReviewCard(
                  name: "Jane Doe",
                  job: "Botanist",
                  profileImage: "assets/jane.jpg",
                  rating: 5,
                  title: "Absolutely Amazing!",
                  description:
                      "These plants arrived in perfect condition. Highly recommended.",
                ),
                ReviewCard(
                  name: "Jane Doe",
                  job: "Botanist",
                  profileImage: "assets/jane.jpg",
                  rating: 5,
                  title: "Absolutely Amazing!",
                  description:
                      "These plants arrived in perfect condition. Highly recommended.",
                ),
                ReviewCard(
                  name: "Jane Doe",
                  job: "Botanist",
                  profileImage: "assets/jane.jpg",
                  rating: 5,
                  title: "Absolutely Amazing!",
                  description:
                      "These plants arrived in perfect condition. Highly recommended.",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
