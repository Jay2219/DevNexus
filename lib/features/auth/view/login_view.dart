import 'package:devnexus/common/common.dart';
import 'package:devnexus/common/loading_page.dart';
import 'package:devnexus/constants/constants.dart';
import 'package:devnexus/features/auth/controller/auth_controller.dart';
import 'package:devnexus/features/auth/view/signup_view.dart';
import 'package:devnexus/features/auth/widgets/auth_field.dart';
import 'package:devnexus/theme/pallete.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onLogin() {
    ref.read(authControllerProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: appbar,
      body: isLoading
          ? const Loader()
          : Center(
              child: Container(
                color: const Color.fromARGB(87, 35, 33, 33),
                padding: const EdgeInsets.symmetric(vertical: 30),
                margin: const EdgeInsets.symmetric(horizontal: 250),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        AuthField(
                          controller: emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AuthField(
                          controller: passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(height: 20),
                        RoundedSmallButton(
                          onTap: onLogin,
                          label: 'Sign In',
                        ),
                        const SizedBox(height: 40),
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account?",
                            style: const TextStyle(
                                color: Pallete.whiteColor, fontSize: 16),
                            children: [
                              TextSpan(
                                  text: ' Sign Up',
                                  style: const TextStyle(
                                    color: Pallete.blueColor,
                                    fontSize: 16,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context, SignUpView.route());
                                    }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
