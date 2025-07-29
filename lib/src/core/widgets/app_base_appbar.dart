import 'package:flutter/material.dart';

class AppBaseAppbar extends StatelessWidget implements PreferredSize {
  const AppBaseAppbar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle,
    this.automaticallyImplyLeading,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final bool? automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      bottomOpacity: 0,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      elevation: 0,
      centerTitle: centerTitle,
      leading: leading,
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: title,
      ),
      actions: actions,
    );
  }

  @override
  Widget get child => Container();

  @override
  Size get preferredSize => AppBar().preferredSize;
}
