import 'package:flourish/features/home/widget/custombuttonfilled.dart';
import 'package:flourish/widgets/customappbar.dart';
import 'package:flourish/widgets/customfooter.dart';
import 'package:flourish/widgets/customheader.dart';
import 'package:flourish/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 900;
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Customheader(
              currentpage: 'Checkout',
              pagepath: 'Home > Checkout',
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: isMobile
                  ? Column(
                      children: [
                        billingDetailsSection(),
                        const SizedBox(height: 20),
                        orderSummarySection(context),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 2, child: billingDetailsSection()),
                        const SizedBox(width: 30),
                        Expanded(child: orderSummarySection(context)),
                      ],
                    ),
            ),
            CustomFooter()
          ],
        ),
      ),
    );
  }

  Widget billingDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Billing details',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 36,
          ),
        ),
        const SizedBox(height: 20),
        const Row(
          children: [
            Expanded(child: CustomTextField(hintText: 'First Name')),
            SizedBox(width: 20),
            Expanded(child: CustomTextField(hintText: 'Last Name')),
          ],
        ),
        const SizedBox(height: 20),
        const CustomTextField(hintText: 'Company Name'),
        const SizedBox(height: 20),
        const CustomTextField(hintText: 'Country/Region'),
        const SizedBox(height: 20),
        const CustomTextField(hintText: 'Street Address'),
        const SizedBox(height: 20),
        const CustomTextField(hintText: 'Town/City'),
        const SizedBox(height: 20),
        const CustomTextField(hintText: 'Province'),
        const SizedBox(height: 20),
        const CustomTextField(hintText: 'Phone Number'),
        const SizedBox(height: 20),
        const CustomTextField(hintText: 'Email Address'),
        const SizedBox(height: 20),
        const CustomTextField(hintText: 'Additional Notes'),
      ],
    );
  }

  Widget orderSummarySection(context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Summary',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        const Divider(height: 30, thickness: 1),
        orderRow('Product 1', '\$20.00'),
        const SizedBox(height: 10),
        orderRow('Product 2', '\$35.00'),
        const Divider(height: 30, thickness: 1),
        orderRow('Subtotal', '\$55.00'),
        orderRow('Shipping', '\$5.00'),
        const Divider(height: 30, thickness: 1),
        orderRow('Total', '\$60.00', isBold: true),
        const SizedBox(height: 20),
        Custombuttonfilled(
            onTap: () {},
            height: 50,
            text: 'Place Order',
            width: MediaQuery.of(context).size.width),
        const SizedBox(height: 20),
        RadioListTile(
          title: Text(
            'Direct Bank Transfer',
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          value: 'bank_transfer',
          groupValue: 'payment_method',
          onChanged: (value) {},
          subtitle: const Text(
              'Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order will not be shipped until the funds have cleared in our account.'),
        ),
        RadioListTile(
          title: Text(
            'PayPal',
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          value: 'paypal',
          groupValue: 'pay_pal',
          onChanged: (value) {},
          subtitle: const Text(
              'Pay via PayPal; you can pay with your credit card if you don\'t have a PayPal account.'),
        ),
        RadioListTile(
          title: Text(
            'Mobile Money',
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          value: 'mobile_money',
          groupValue: 'payment_method',
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget orderRow(String title, String amount, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
