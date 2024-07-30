import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ringo_media_test_app/auth/bloc/auth_bloc.dart';
import 'package:ringo_media_test_app/widget/b_nav_bar.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      context.read<LoginBloc>().add(EmailChanged(_emailController.text));
    });
    _passwordController.addListener(() {
      context.read<LoginBloc>().add(PasswordChanged(_passwordController.text));
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

   _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      // Show the SnackBar for 1 second
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Login successful'),
          duration: Duration(seconds: 1), // Display duration of the SnackBar
        ),
      );

      // Navigate to BottomNavigationScreen after the SnackBar disappears
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: const Text(''),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Sign in to your account',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Username / Email',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Username / Email here',
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username or email';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Enter Password here',
                          hintStyle: const TextStyle(color: Colors.grey),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        obscureText: _obscurePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: const Text(
                        'Forgot Password ?',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      final isButtonEnabled = state is LoginInitial &&
                          (state as LoginInitial).email.isNotEmpty &&
                          (state as LoginInitial).password.isNotEmpty;
                      return ElevatedButton(
                        onPressed: isButtonEnabled ? _handleLogin : null,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          minimumSize: const Size(150, 50),
                        ),
                        child: const Center(
                          child: Text(
                            'LogIn',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const Center(child: Text('Or log in with account')),
                  const SizedBox(height: 20),
                  _buildSocialLoginButtonForGoogle(
                    assetPath: 'assets/google_icon.webp', // Correct asset path
                    text: 'Continue with Google',
                    onPressed: () {
                      // Handle Google login
                    },
                  ),
                  const SizedBox(height: 15),
                  _buildSocialLoginButtonForFacebook(
                    assetPath: 'assets/Facebook_icon.png', // Correct asset path
                    text: 'Continue with Facebook',
                    onPressed: () {
                      // Handle Facebook login
                    },
                  ),
                  const SizedBox(height: 15),
                  _buildSocialLoginButtonForApple(
                    icon: FontAwesomeIcons.apple,
                    text: 'Continue with Apple',
                    onPressed: () {
                      // Handle Apple login
                    },
                    iconColor: Colors.black, // Apple icon color
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Register here',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0, // Adjust the font size if needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildSocialLoginButtonForApple({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
    required Color iconColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Curved edges
        ),
        minimumSize:
            const Size(double.infinity, 50), // Width and height of the button
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: FaIcon(icon, color: iconColor), // Icon color
          ),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0, // Adjust the font size if needed
                ), // Text color
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLoginButtonForGoogle({
    required String assetPath, // Asset path for the image
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Curved edges
        ),
        minimumSize:
            const Size(double.infinity, 50), // Width and height of the button
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: Container(
              width: 30, // Adjust width as needed
              height: 30, // Adjust height as needed
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(assetPath), // Asset image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0, // Adjust the font size if needed
                ), // Text color
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLoginButtonForFacebook({
    required String assetPath, // Asset path for the image
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Curved edges
        ),
        minimumSize:
            const Size(double.infinity, 50), // Width and height of the button
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: Container(
              width: 20, // Width of the square
              height: 20, // Height of the square
              decoration: BoxDecoration(
                shape: BoxShape.rectangle, // Ensure it's a square
                image: DecorationImage(
                  image: AssetImage(assetPath), // Asset image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0, // Adjust the font size if needed
                ), // Text color
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _obscurePassword = true;
}
