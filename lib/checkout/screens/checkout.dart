import 'package:flourish/widgets/customappbar.dart';
import 'package:flourish/widgets/customheader.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Customheader(
               currentpage: 'Checkout',
              pagepath: 'Home > Checkout',
            )
          ],
        ),
      ),
    );
  }
}
