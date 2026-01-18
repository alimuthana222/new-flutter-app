import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  String? _selectedUniversity;
  bool _agreedToTerms = false;

  final List<String> _universities = [
    'جامعة بغداد',
    'الجامعة المستنصرية',
    'الجامعة التكنولوجية',
    'جامعة النهرين',
    'جامعة البصرة',
    'جامعة الموصل',
    'جامعة الكوفة',
    'جامعة كربلاء',
    'جامعة بابل',
    'جامعة تكريت',
    'أخرى',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (!_agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يجب الموافقة على الشروط والأحكام'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (_selectedUniversity == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى اختيار الجامعة'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            RegisterEvent(
              email: _emailController.text.trim(),
              password: _passwordController.text,
              fullName: _fullNameController.text.trim(),
              username: _usernameController.text.trim(),
              phone: _phoneController.text.trim(),
              university: _selectedUniversity!,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.register),
        ),
        body: SafeArea(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is OtpSent) {
                context.go(AppRouter.otp, extra: state.email);
              } else if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: AppColors.error,
                  ),
                );
              }
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header
                    Text(
                      AppStrings.createAccount,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'أنشئ حسابك وابدأ رحلتك في تبادل المهارات',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),

                    const SizedBox(height: 32),

                    // Full name field
                    CustomTextField(
                      label: AppStrings.fullName,
                      hint: 'أدخل اسمك الكامل',
                      controller: _fullNameController,
                      prefixIcon: Icons.person_outline,
                      validator: Validators.validateName,
                    ),

                    const SizedBox(height: 16),

                    // Username field
                    CustomTextField(
                      label: AppStrings.username,
                      hint: 'username',
                      controller: _usernameController,
                      prefixIcon: Icons.alternate_email,
                      validator: (value) =>
                          Validators.validateRequired(value, AppStrings.username),
                    ),

                    const SizedBox(height: 16),

                    // Email field
                    CustomTextField(
                      label: AppStrings.email,
                      hint: 'example@email.com',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                      validator: Validators.validateEmail,
                    ),

                    const SizedBox(height: 16),

                    // Phone field
                    CustomTextField(
                      label: AppStrings.phone,
                      hint: '07XXXXXXXXX',
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                      validator: Validators.validatePhone,
                    ),

                    const SizedBox(height: 16),

                    // University dropdown
                    DropdownButtonFormField<String>(
                      value: _selectedUniversity,
                      decoration: InputDecoration(
                        labelText: AppStrings.university,
                        prefixIcon: const Icon(Icons.school_outlined),
                      ),
                      items: _universities.map((university) {
                        return DropdownMenuItem(
                          value: university,
                          child: Text(university),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedUniversity = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى اختيار الجامعة';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // Password field
                    CustomTextField(
                      label: AppStrings.password,
                      hint: '••••••••',
                      controller: _passwordController,
                      obscureText: true,
                      prefixIcon: Icons.lock_outline,
                      validator: Validators.validatePassword,
                    ),

                    const SizedBox(height: 16),

                    // Confirm password field
                    CustomTextField(
                      label: AppStrings.confirmPassword,
                      hint: '••••••••',
                      controller: _confirmPasswordController,
                      obscureText: true,
                      prefixIcon: Icons.lock_outline,
                      validator: (value) => Validators.validateConfirmPassword(
                        value,
                        _passwordController.text,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Terms checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: _agreedToTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreedToTerms = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: Wrap(
                            children: [
                              Text(
                                AppStrings.agreeToTerms,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // TODO: Show terms of service
                                },
                                child: Text(
                                  AppStrings.termsOfService,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: AppColors.primary,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                              Text(
                                AppStrings.and,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // TODO: Show privacy policy
                                },
                                child: Text(
                                  AppStrings.privacyPolicy,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: AppColors.primary,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Register button
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return CustomButton(
                          text: AppStrings.register,
                          isLoading: state is AuthLoading,
                          onPressed: _handleRegister,
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    // Login link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.haveAccount,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text(AppStrings.login),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
