// lib/screens/auth/login_screen.dart
import 'package:flutter/material.dart';
import 'package:go_you/screens/auth/widgets/google_text_button.dart'; // Corrected import
import 'package:go_you/widgets/app_text_form_field.dart';
import 'dart:math' as math; // For math.max
import 'package:go_you/screens/auth/widgets/carousel_card.dart'; // Assuming CarouselCard is here
import 'package:go_you/screens/auth/widgets/or_divider.dart'; // Assuming OrDivider is here


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _pageController = PageController(viewportFraction: 0.95);

  // Data for the carousel items
  final List<Map<String, dynamic>> _carouselItemsData = [
    {'title': 'Learn Japanese', 'subtitle': 'Daily words', 'icon': Icons.translate},
    {'title': 'Flashcards', 'subtitle': 'Fast recall', 'icon': Icons.style},
    {'title': 'Track Progress', 'subtitle': 'Stay motivated', 'icon': Icons.show_chart},
  ];

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Logging in...')));
    }
  }

  void _onGoogleSignIn() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Google sign-in clicked')));
  }

  void _onSignUp() {
    Navigator.pushNamed(context, '/signup');
  }
  void _onForgotPassword() {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const horizontalPadding = 24.0; // Increased horizontal padding

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              const SizedBox(height: 40.0), // Increased top spacing
              Text('GoYou',
                  style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, color: Colors.black)),
              const SizedBox(height: 24.0), // Increased space before carousel
              SizedBox(
                height: 160,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _carouselItemsData.length,
                  itemBuilder: (context, index) {
                    final item = _carouselItemsData[index];
                    return AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        double pageOffset = 0;
                        if (_pageController.position.haveDimensions) {
                          pageOffset = (_pageController.page ?? 0) - index;
                        }
                        double scale = math.max(0.8, 1 - (pageOffset.abs() * 0.2));
                        double opacity = math.max(0.5, 1 - (pageOffset.abs() * 0.5));

                        return Transform.scale(
                          scale: scale,
                          child: Opacity(
                            opacity: opacity,
                            child: child,
                          ),
                        );
                      },
                      child: CarouselCard(
                        title: item['title'],
                        subtitle: item['subtitle'],
                        icon: item['icon'],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32.0), // Increased space after carousel
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return AnimatedPadding(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 12),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Center(
                              child: GoogleTextButton( // Updated to use the new GoogleTextButton
                                label: 'Continue with Google',
                                onPressed: _onGoogleSignIn,
                              ),
                            ),
                            const SizedBox(height: 16.0), // Increased space around OrDivider
                            const OrDivider(), 
                            const SizedBox(height: 16.0), // Increased space around OrDivider
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  AppTextFormField(
                                    controller: _emailCtrl,
                                    label: 'Email',
                                    hintText: 'name@example.com',
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (v) {
                                      if (v == null || v.isEmpty) return 'Please enter an email';
                                      if (!v.contains('@')) return 'Enter a valid email';
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 16.0), // Increased space between fields
                                  AppTextFormField(
                                    controller: _passwordCtrl,
                                    label: 'Password',
                                    hintText: 'Enter your password',
                                    obscureText: true,
                                    validator: (v) {
                                      if (v == null || v.isEmpty) return 'Enter a password';
                                      if (v.length < 6) return 'At least 6 characters';
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 24.0), // Increased space before login button
                                  SizedBox(
                                    width: double.infinity,
                                    child: FilledButton(
                                      onPressed: _onLoginPressed,
                                      style: FilledButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 14),
                                        child: Text('Log In', style: TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: _onSignUp,
                child: Text("Don't have an account? Sign up", style: TextStyle(color: Colors.grey[700])),
              ),
              TextButton(
                onPressed: _onForgotPassword,
                style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 4.0)), // Adjusted padding
                child: Text('Forgot password?', style: TextStyle(fontSize: 13, color: Colors.grey[700])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
