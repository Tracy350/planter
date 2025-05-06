import 'package:flourish/features/home/widget/custombuttonfilled.dart';
import 'package:flourish/widgets/customtextfield.dart';
import 'package:flourish/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailCard extends StatelessWidget {
  const EmailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.5,
      ),
      child: Column(
        children: [
          Text('QUESTIONS?', style: GoogleFonts.kurale(fontSize: 20)),
          Text(
            'Send us an email at',
            style: GoogleFonts.notoSerif(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: AppColors.secondary),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              const Expanded(child: CustomTextField(hintText: 'First Name')),
              SizedBox(width: 20),
              Expanded(child: CustomTextField(hintText: 'Last Name')),
            ],
          ),
          const SizedBox(height: 20),
          const CustomTextField(hintText: 'Company Name'),
          const SizedBox(height: 20),
          const CustomTextField(hintText: 'Country/Region'),
          const SizedBox(height: 20),
          Custombuttonfilled(
            onTap: () {},
            height: 50,
            text: 'Send Email',
            width: MediaQuery.of(context).size.width * 0.2,
          ),
        ],
      ),
    );
  }
}
