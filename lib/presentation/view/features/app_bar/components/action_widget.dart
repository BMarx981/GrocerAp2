import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogoutActionButton extends ConsumerWidget {
  const LogoutActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Semantics(
      label: "Log out button",
      hint: "Tap this button to log out of the app",
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
        child: GestureDetector(
          onTap: () => Beamer.of(context).beamToNamed('/'),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white.withAlpha(100),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Log out'),
              )),
        ),
      ),
    );
  }
}
