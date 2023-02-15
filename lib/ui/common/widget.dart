import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intelligence/ui/common/image_constant.dart';
import 'package:intelligence/ui/common/text.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        ImageConstants.profile,
        color: const Color(0xff1A1B28),
        height: 16,
        width: 16,
      ),
    );
  }
}

class ChatGpt extends StatelessWidget {
  const ChatGpt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      ImageConstants.chatgpt,
      height: 30,
      width: 30,
    );
  }
}

class ChatParagraphTile extends StatelessWidget {
  const ChatParagraphTile({
    required this.text,
    required this.leadingIcon,
    super.key,
  });
  final String text;
  final Widget leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leadingIcon,
          const SizedBox(width: 20),
          Expanded(
            child: AppText(
              title: text.replaceFirst(RegExp('^\\n+'), ''),
              fontSize: 16,
              maxLine: null,
            ),
          ),
        ],
      ),
    );
  }
}
