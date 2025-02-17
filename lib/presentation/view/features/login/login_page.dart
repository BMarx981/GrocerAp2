import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/presentation/view/features/app_bar/app_bar.dart';
import 'package:grocerapp/presentation/view/features/login/login_section.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          appBar: const GrocerAppbar(title: "Welcome to the GrocerApp.", showLogOut: false),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/grocery_store_image.jpg'),
              ),
            ),
            child: Center(
              child: LoginSection(
                key: const Key('login_loginsection'),
              ),
            ),
          )),
    );
  }
}
