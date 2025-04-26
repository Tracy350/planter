import 'package:flourish/home/widget/custombuttonfilled.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isSmallScreen = screenSize.width < 600;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: isSmallScreen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildFooterContent(isSmallScreen),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildFooterContent(isSmallScreen),
                ),
        ),
         _buildBottominfo()
      ],
    );
  }

  List<Widget> _buildFooterContent(bool isSmallScreen) {
    return [
      _buildCompanyInfo(),
      _buildLinksSection(),
      _buildHelpSection(),
      _buildNewsletterSection(isSmallScreen),
     
    ];
  }

  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/fulllogo.png', height: 40),
        const SizedBox(height: 20),
        Text(
          '400 University Drive Suite 200 Coral Gables, FL 33134 USA',
          style: GoogleFonts.poppins(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildBottominfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: Colors.grey[300],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '2025 furino. All rights reverved',
              style: GoogleFonts.poppins(fontSize: 15),
            ),
            Image.asset(
              'assets/emporia.png',
              height: 30,
              width: 30,
            )
          ],
        )
      ],
    );
  }

  Widget _buildLinksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Links'),
        _footerLink('Home'),
        _footerLink('Shop'),
        _footerLink('About'),
        _footerLink('Contact'),
      ],
    );
  }

  Widget _buildHelpSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Help'),
        _footerLink('Payment Options'),
        _footerLink('Returns'),
        _footerLink('Privacy Policies'),
      ],
    );
  }

  Widget _buildNewsletterSection(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Newsletter'),
        const SizedBox(height: 10),
        SizedBox(
          width: isSmallScreen ? double.infinity : 250,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your email',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Custombuttonfilled(
            onTap: () {}, height: 30, text: 'Subscribe', width: 100)
        // ElevatedButton(
        //   onPressed: () {},
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.blue,
        //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        //   ),
        //   child: const Text('Subscribe', style: TextStyle(color: Colors.white)),
        // ),
      ],
    );
  }

  Widget _footerLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
          color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}
