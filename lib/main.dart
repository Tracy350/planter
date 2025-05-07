
import 'package:flourish/core/services/auth_services.dart';
import 'package:flourish/features/about/screens/aboutpage.dart';
import 'package:flourish/features/cart/screen/cartpage.dart';
import 'package:flourish/features/checkout/screens/checkout.dart';
import 'package:flourish/features/contact/screens/contactpage.dart';
import 'package:flourish/features/home/screen/homepage.dart';
import 'package:flourish/features/profile/screens/profile.dart';
import 'package:flourish/features/shop/screens/shoppage.dart';
import 'package:flourish/firebase_options.dart';
import 'package:flourish/models/shop_models.dart';
import 'package:flourish/models/usermodels.dart';
import 'package:flourish/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



Future<void> main() async {
  await Supabase.initialize(
    url: 'https://rqgwdprctpneoxzzrukj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJxZ3dkcHJjdHBuZW94enpydWtqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY2NDA0NzgsImV4cCI6MjA2MjIxNjQ3OH0.VdT3bKzqPY_BBWdrhssnaWxbdYVDD0AGlwkZ5j8uG7I',
  );
 runApp(ChangeNotifierProvider(create: (context)=> Shop(), child: const MyApp()));
}
// Get a reference your Supabase client
final supabase = Supabase.instance.client;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/home",
        routes: {
          "/home": (context) => Homepage(),
          "/shop": (context) => Shoppage(),
          "/about": (context) => Aboutpage(),
          "/contact": (context) => Contactpage(),
          "/cart": (context) => Cartpage(),
          "/checkout": (context) => Checkout(),
          "/profile": (context) => Profile(),
        },
        debugShowCheckedModeBanner: false,
        home: const Homepage());
  }
}
