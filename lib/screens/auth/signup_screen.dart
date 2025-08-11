import 'package:flutter/material.dart';
import 'package:go_you/screens/auth/widgets/google_text_button.dart';
import '../../widgets/app_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _displayNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _displayNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUp() {
    if (_formKey.currentState!.validate()) {
      // TODO: Call Auth Service
      debugPrint('Display Name: ${_displayNameController.text}');
      debugPrint('Email: ${_emailController.text}');
      debugPrint('Password: ${_passwordController.text}');
      // Example: Navigate to home or show success
      // Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorScheme.primary.withOpacity(0.05),
              colorScheme.surface.withOpacity(0.5),
              colorScheme.surface,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.3, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Illustration/Visual Placeholder
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 24.0),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(Icons.person_add_rounded,
                      size: 60,
                      color: colorScheme.onPrimaryContainer.withOpacity(0.7)),
                ),

                // 2. Title and Subtitle
                Text(
                  'Create Your Account',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Join us and start your awesome journey!',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 28),

                // 3. Form in a Styled Container
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.shadow.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTextFormField(
                          controller: _displayNameController,
                          label: 'Display Name',
                          validator: (value) =>
                              value!.isEmpty ? 'Enter your display name' : null,
                        ),
                        const SizedBox(height: 16),
                        AppTextFormField(
                          controller: _emailController,
                          label: 'Email Address',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) return 'Enter your email';
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        AppTextFormField(
                          controller: _passwordController,
                          label: 'Password',
                          obscureText: true,
                          validator: (value) => value!.length < 6
                              ? 'Password must be at least 6 characters'
                              : null,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.arrow_forward_rounded),
                          label: const Text('Create Account', style: TextStyle(color: Colors.white)),
                          onPressed: _onSignUp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 14),
                            textStyle: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // 4. "Or continue with" Divider
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 0.5, color: colorScheme.outline.withOpacity(0.5))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text('Or',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.black)),
                    ),
                    Expanded(child: Divider(thickness: 0.5, color: colorScheme.outline.withOpacity(0.5))),
                  ],
                ),
                const SizedBox(height: 16),

                // 5. Social Login Button - Google
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0), // Optional: give it some horizontal padding
                  child: GoogleTextButton(
                    label: 'Continue with Google',
                    onPressed: () {
                      // TODO: Implement Google Sign In
                      debugPrint('Google Sign-In Tapped');
                    },
                  ),
                ),
                const SizedBox(height: 28),

                // 6. "Already have an account?"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Log In',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue, 
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
