import 'package:flourish/features/home/widget/custombuttonfilled.dart';
import 'package:flourish/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1000;
    final isDesktop = width >= 1000;

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.grey[100],
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCompanyInfo(),
                    const SizedBox(height: 20),
                    _buildLinksSection(),
                    const SizedBox(height: 20),
                    _buildHelpSection(),
                    const SizedBox(height: 20),
                    _buildNewsletterSection(true),
                  ],
                )
              : isTablet
                  ? Wrap(
                      alignment: WrapAlignment.spaceAround,
                      runSpacing: 30,
                      spacing: 30,
                      children: [
                        _buildCompanyInfo(),
                        _buildLinksSection(),
                        _buildHelpSection(),
                        _buildNewsletterSection(true),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCompanyInfo(),
                        _buildLinksSection(),
                        _buildHelpSection(),
                        _buildNewsletterSection(false),
                      ],
                    ),
        ),
        _buildBottomInfo(),
      ],
    );
  }

  Widget _buildCompanyInfo() {
    return SizedBox(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/fulllogo.png', height: 40),
          const SizedBox(height: 20),
          Text(
            '400 University Drive Suite 200\nCoral Gables, FL 33134 USA',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildLinksSection() {
    return _buildColumnSection('Links', [
      'Home',
      'Shop',
      'About',
      'Contact',
    ]);
  }

  Widget _buildHelpSection() {
    return _buildColumnSection('Help', [
      'Payment Options',
      'Returns',
      'Privacy Policies',
    ]);
  }

  Widget _buildNewsletterSection(bool isMobileOrTablet) {
    return SizedBox(
      width: isMobileOrTablet ? double.infinity : 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Newsletter'),
          const SizedBox(height: 10),
          CustomTextField(hintText: 'Email Address'),
          const SizedBox(height: 10),
          Custombuttonfilled(
            onTap: () {},
            height: 40,
            text: 'Subscribe',
            width: 120,
          ),
        ],
      ),
    );
  }

  Widget _buildColumnSection(String title, List<String> items) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(title),
          ...items.map(_footerLink).toList(),
        ],
      ),
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
        color: Colors.grey[800],
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _buildBottomInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: Colors.grey[200],
      child: Column(
        children: [
          const Divider(thickness: 1),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '2025 Furino. All rights reserved',
                style: GoogleFonts.poppins(fontSize: 15),
              ),
              const SizedBox(width: 10),
              Image.asset('assets/emporia.png', height: 25, width: 25),
            ],
          ),
        ],
      ),
    );
  }
}
