import 'package:devnexus/common/error_page.dart';
import 'package:devnexus/common/loading_page.dart';
import 'package:devnexus/features/auth/view/login_view.dart';
import 'package:devnexus/features/auth/view/signup_view.dart';
import 'package:devnexus/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:devnexus/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/auth/controller/auth_controller.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'DevNexus',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: ref.watch(currentUserAccountProvider).when(
            data: (user) {
              if(user != null) {
                return const HomeView();
              }
              return const SignUpView();
            },
            error: (error, st) => ErrorPage(
              error: error.toString(),
            ),
            loading: () => const LoadingPage(),
          ),
    );
  }
}
