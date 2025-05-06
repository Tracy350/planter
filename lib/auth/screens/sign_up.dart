import 'package:flourish/auth/screens/sign_in.dart';
import 'package:flourish/features/home/widget/custombuttonfilled.dart';
import 'package:flourish/widgets/customtextfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';

class SignUpScreen extends StatefulWidget {
  final Function toggleView;
  const SignUpScreen({super.key, required this.toggleView});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoFadeAnimation;
  

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

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    final email = _emailController.text;
    final password = _passwordController.text;
    // Implement your sign-in logic here
    print('Email: $email, Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
           constraints: BoxConstraints(
              maxHeight: double.infinity
            ),
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
                          ),const SizedBox(height: 40),
                          TypeWriter.text(
            'Welcome to PlantA. Please Sign Up',style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w700),textAlign: TextAlign.center,
            duration: const Duration(milliseconds: 50),
          ),
                          const SizedBox(height: 40),
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
                            suffixIcon: const Icon(Icons.remove_red_eye),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'First Name',
                            prefixIcon: const Icon(Icons.person),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Last Name',
                            prefixIcon: const Icon(Icons.person),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Phone Number',
                            prefixIcon: const Icon(Icons.phone),
                          ),
                          const SizedBox(height: 30),
                          Custombuttonfilled(
                            height: 50,
                            width: isMobile ? 200 : MediaQuery.of(context).size.width,
                            text: 'Sign In',
                            onTap: _signIn,
                          ),
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
              fontSize: 20,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                widget.toggleView();
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
