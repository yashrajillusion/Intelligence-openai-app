import 'package:flutter/material.dart';

class CommonAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  CommonAppBarWidget(
      {Key? key,
      this.leadingIcon,
      this.appTitle,
      this.trailingIcon,
      this.onLeadingIconTap,
      this.onTrailingIconTap,
      this.bottomTabs,
      this.bottomBorderColor,
      this.centerTitle,
      this.appBarPadding,
      this.preferSize,
      this.titlePadding,
      this.appBarColor,
      this.showHelpButton})
      : super(key: key);

  final Widget? appTitle;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final VoidCallback? onLeadingIconTap;
  final VoidCallback? onTrailingIconTap;
  final PreferredSize? bottomTabs;
  final Color? bottomBorderColor;
  final bool? centerTitle;
  final double? preferSize;
  final EdgeInsets? appBarPadding;
  final Color? appBarColor;
  final EdgeInsets? titlePadding;
  final bool? showHelpButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: appBarColor,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle ?? false,
      title: appTitle ?? const SizedBox.shrink(),
      titleSpacing: 0.0,
      leading: leadingIcon ?? leadingIcon,
      actions: [
        trailingIcon != null
            ? InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: onTrailingIconTap,
                child: trailingIcon ?? const SizedBox.shrink())
            : const SizedBox.shrink()
      ],
      bottom: bottomTabs,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preferSize ?? 65);
}
