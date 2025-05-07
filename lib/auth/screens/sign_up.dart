import 'package:flourish/auth/screens/sign_in.dart';
import 'package:flourish/core/services/auth_services.dart';
import 'package:flourish/features/home/widget/custombuttonfilled.dart';
import 'package:flourish/widgets/customtextfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthServices authService = AuthServices();
  late AnimationController _animationController;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoFadeAnimation;
  bool loading = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();

    _logoScaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    );

    _logoFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  void signUp() async {
//prepare data
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final lastName = _lastNameController.text.trim();
    final firstName = _firstNameController.text.trim();
    final phoneNumber = _phoneNumberController.text.trim();
    final _confirmPassword = _confirmPasswordController.text.trim();

//check that passwords match
    if (password != _confirmPassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Passwords dont match')));
      return;
    }

//attempt login
    try {
      await authService.signInWithEmailAndPassword(email, password);
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  // void _signUp() async {}

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: double.infinity),
          child: Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Opacity(
                  opacity: _logoFadeAnimation.value,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ScaleTransition(
                            scale: _logoScaleAnimation,
                            child: Image.asset(
                              'assets/logo.png',
                              height: 200,
                              width: 200,
                            ),
                          ),
                          const SizedBox(height: 40),
                          TypeWriter.text(
                            'Welcome to PlantA. Please Sign Up',
                            style: GoogleFonts.poppins(
                                fontSize: 30, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                            duration: const Duration(milliseconds: 50),
                          ),
                          const SizedBox(height: 40),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  CustomTextField(
                                    controller: _emailController,
                                    hintText: 'Email',
                                    prefixIcon: const Icon(Icons.email),
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    controller: _passwordController,
                                    hintText: 'Password',
                                    prefixIcon: const Icon(Icons.lock),
                                    obscureText: true,
                                    suffixIcon:
                                        const Icon(Icons.remove_red_eye),
                                  ),
                                  const SizedBox(height: 20),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    controller: _confirmPasswordController,
                                    hintText: 'Password',
                                    prefixIcon: const Icon(Icons.lock),
                                    obscureText: true,
                                    suffixIcon:
                                        const Icon(Icons.remove_red_eye),
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter a valid first name';
                                      }
                                      return null;
                                    },
                                    controller: _firstNameController,
                                    hintText: 'First Name',
                                    prefixIcon: const Icon(Icons.person),
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter a valid last name';
                                      }
                                      return null;
                                    },
                                    controller: _lastNameController,
                                    hintText: 'Last Name',
                                    prefixIcon: const Icon(Icons.person),
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter a valid phone number';
                                      }
                                      return null;
                                    },
                                    controller: _phoneNumberController,
                                    hintText: 'Phone Number',
                                    prefixIcon: const Icon(Icons.phone),
                                  ),
                                ],
                              )),
                          const SizedBox(height: 30),
                          Custombuttonfilled(
                              height: 50,
                              width: isMobile
                                  ? 200
                                  : MediaQuery.of(context).size.width,
                              text: 'Sign Up',
                              onTap: () {}
                              // () async {
                              //   if (_formKey.currentState!.validate()) {
                              //     setState(() => loading = true);
                              //     dynamic result = await _authService.signUp(
                              //       _emailController.text.trim(),
                              //       _passwordController.text.trim(),
                              //       _firstNameController.text.trim(),
                              //       _lastNameController.text.trim(),
                              //       _phoneNumberController.text.trim(),
                              //     );
                              //     if (result == null) {
                              //       setState(() {
                              //         error = 'Please provide a valid email';
                              //         loading = false;
                              //       });
                              //     } else {
                              //       // Handle success (e.g., navigate or show dialog)
                              //     }
                              //   }
                              // },
                              ),

                          // Custombuttonfilled(
                          //   height: 50,
                          //   width: isMobile
                          //       ? 200
                          //       : MediaQuery.of(context).size.width,
                          //   text: 'Sign In',
                          //   onTap: () async {
                          //     widget.toggleView();
                          //     // Implement your sign-in logic here
                          //     print('Email: $email, Password: $password');
                          //     if (_formKey.currentState!.validate()) {
                          //       setState(() => loading = true);
                          //       dynamic result =
                          //           await _authService.signUp(email, password);
                          //       if (result == null) {
                          //         setState(() {
                          //           error = 'Please provide n valid email';
                          //           loading = false;
                          //         });
                          //       }
                          //     }
                          //   },
                          // ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Forgot password?'),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Already have an account?",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign in',
                                  style: GoogleFonts.poppins(
                                    color: Colors.green, // Use any accent color
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignInScreen()));
                                    },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
