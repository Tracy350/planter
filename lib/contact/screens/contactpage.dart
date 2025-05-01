import 'package:flourish/home/widget/custombuttonfilled.dart';
import 'package:flourish/widgets/customappbar.dart';
import 'package:flourish/widgets/customfooter.dart';
import 'package:flourish/widgets/customheader.dart';
import 'package:flourish/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contactpage extends StatelessWidget {
  const Contactpage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Customheader(
              currentpage: 'Contact Us',
              pagepath: 'Home > Contact Us',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Text(textAlign: TextAlign.center,
                    'Get In Touch With Us',
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'For More Information About Our Product & Services. Please Feel Free To Drop Us \nAn Email. Our Staff Will Always Be There To Help You Out. Do Not Hesitate!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                  const SizedBox(height: 100),
                  // Responsive Layout
                  isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: addressdetails(),
                            ),
                            const SizedBox(height: 40), // Add spacing manually
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: addresstextfield(context),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: addressdetails(),
                              ),
                            ),
                            const SizedBox(width: 40),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: addresstextfield(context),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
            CustomFooter()
          ],
        ),
      ),
    );
  }
}

Widget addressdetails() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _contactInfoSection(
        icon: Icons.location_on,
        title: 'Address',
        description:
            '400 University Drive Suite 200\nCoral Gables, FL 33134 USA',
      ),
      const SizedBox(height: 40),
      _contactInfoSection(
        icon: Icons.phone,
        title: 'Phone',
        description: '+1 123 456 7890\n+1 987 654 3210',
      ),
      const SizedBox(height: 40),
      _contactInfoSection(
        icon: Icons.access_time,
        title: 'Working Hours',
        description: 'Mon - Fri: 9:00 AM - 6:00 PM\nSat - Sun: Closed',
      ),
    ],
  );
}

Widget _contactInfoSection({
  required IconData icon,
  required String title,
  required String description,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(icon, color: Colors.black, size: 30),
          const SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 28,
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Text(
        description,
        style: GoogleFonts.poppins(fontSize: 16),
      ),
    ],
  );
}

Widget addresstextfield(context) {
  return Column(
    children: [
      CustomTextField(hintText: 'Your Name'),
      const SizedBox(height: 20),
      CustomTextField(hintText: 'Your Email Address'),
      const SizedBox(height: 20),
      CustomTextField(hintText: 'Subject'),
      const SizedBox(height: 20),
      CustomTextField(hintText: 'Your Message'),
      const SizedBox(height: 20),
      Custombuttonfilled(
        onTap: () {},
        height: 50,
        text: 'Submit',
        width: MediaQuery.of(context).size.width,
      ),
    ],
  );
}
