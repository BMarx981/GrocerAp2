import 'package:flutter/material.dart';
import 'package:grocerapp/presentation/view/features/app_bar/components/action_widget.dart';

class GrocerAppbar extends StatelessWidget implements PreferredSize {
  const GrocerAppbar(
      {super.key,
      this.title = "",
      this.showLogOut = false,
      this.showBackButton = false,
      this.backButtonAction});

  ///The title of the appbar to be displayed
  ///at the top in the center of the scaffold
  final String title;

  /// Shows the logout button
  final bool showLogOut;
  /// Shows the bakc button
  final bool showBackButton;

  /// If there is a backbutton call this function
  final VoidCallback? backButtonAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: key,
      title: Text(title),
      shadowColor: Colors.black,
      elevation: 8,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: null,
      leading: showLogOut
          ? Container()
          : BackButton(
              onPressed: backButtonAction,
            ),
      actions: [showLogOut ? const LogoutActionButton() : Container()],
      backgroundColor: Colors.lightBlue.withValues(alpha: 0.4),
    );
  }

  @override
  Widget get child => const Spacer();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
