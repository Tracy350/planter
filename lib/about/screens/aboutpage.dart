import 'package:flourish/about/widgets/about_banner.dart';
import 'package:flourish/about/widgets/email_card.dart';
import 'package:flourish/about/widgets/review_card.dart';
import 'package:flourish/home/widget/custombuttonfilled.dart';
import 'package:flourish/widgets/customappbar.dart';
import 'package:flourish/widgets/customfooter.dart';
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
            const Customheader(
              currentpage: 'About Us',
              pagepath: 'Home > About Us',
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 600;

                  return Column(
                    children: [
                      _AboutSection(
                        imagePath: 'assets/aboutus.jpg',
                        isReversed: false,
                        isMobile: isMobile,
                      ),
                      const SizedBox(height: 40),
                      _AboutSection(
                        imagePath: 'assets/aboutus.jpg',
                        isReversed: true,
                        isMobile: isMobile,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            const AboutBanner(),
            const SizedBox(height: 50),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: const [
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
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: EmailCard(),
            ),
            const SizedBox(height: 50),
             CustomFooter(),
          ],
        ),
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  final String imagePath;
  final bool isReversed;
  final bool isMobile;

  const _AboutSection({
    required this.imagePath,
    required this.isReversed,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final content = [
      Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment:
              isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Text(
              'Elevate your Space with Flourish',
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 10),
            Text(
              'Add a touch of nature to your home with our\ncurated selection of plants and accessories.',
              style: GoogleFonts.dmSerifDisplay(fontSize: 26),
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
            ),
            const SizedBox(height: 20),
            Custombuttonfilled(
              onTap: () {},
              height: 50,
              text: 'Shop Now',
              width: isMobile
                  ? MediaQuery.of(context).size.width * 0.6
                  : MediaQuery.of(context).size.width * 0.2,
            ),
          ],
        ),
      ),
      const SizedBox(width: 20, height: 20),
      Expanded(
        flex: 1,
        child: Image.asset(
          imagePath,
          height: isMobile ? 300 : 500,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    ];

    return Flex(
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: isReversed && !isMobile ? content.reversed.toList() : content,
    );
  }
}
