import 'package:ere_task/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // Add your background image here
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              // Top logo
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/top_image.png', // Add your logo image here
                      height: 60,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),

              // Email field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    hintText: 'Johndoepiano@gmail.com',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white, // White border color
                        width: 2, // Border width
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: Colors.grey // White border color
                          // Border width
                          ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Password field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    hintText: ' ● ● ● ● ● ● ● ●',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white, // White border color
                        width: 2, // Border width
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Login button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Consumer<LoginProvider>(
                  builder: (context, provider, child) {
                    return ElevatedButton(
                      onPressed: provider.isLoading
                          ? null
                          : () {
                              provider.login(
                                _emailController.text,
                                _passwordController.text,
                                context,
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Center(
                          child: provider.isLoading
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.black),
                                )
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 80),

              // Create account link
              TextButton(
                onPressed: () {
                  // Implement create account navigation here
                },
                child: const Text(
                  "Don't have an account? Create One",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const Spacer(),

              // Terms and Conditions
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'By continuing, you are agreeing to our',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 12),
                    ),
                    Text(
                      ' Terms and Conditions',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
