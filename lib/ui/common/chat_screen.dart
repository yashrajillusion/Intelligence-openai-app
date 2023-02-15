import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intelligence/infrastructure/provider/completion_provider.dart';
import 'package:intelligence/infrastructure/provider/provider_registration.dart';
import 'package:intelligence/ui/common/common_appbar.dart';
import 'package:intelligence/ui/common/rounded_field.dart';
import 'package:intelligence/ui/common/text.dart';
import 'package:intelligence/ui/common/widget.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  void initState() {
    super.initState();
    scrollDown();
  }

  void scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(completionProvider).controller.jumpTo(ref.read(completionProvider).controller.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final completionProviderWatch = ref.watch(completionProvider);
    List<QuestionAnser> data = completionProviderWatch.data;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: CommonAppBarWidget(
          appBarColor: const Color(0xff1A1B28),
          leadingIcon: const Icon(
            Icons.menu,
            size: 28,
          ),
          appTitle: const AppText(
            title: "Intelligence",
            fontSize: 24,
            titleColor: Colors.white,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: ref.watch(completionProvider).controller,
                  itemCount: ref.watch(completionProvider).data.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        const SizedBox(height: 16),
                        ChatParagraphTile(
                          text: data[i].isQuestion ? data[i].question : data[i].answer,
                          leadingIcon: data[i].isQuestion ? const ProfileIcon() : const ChatGpt(),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Container(
                alignment: Alignment.bottomCenter,
                child: RoundedTextFormFieldWidget(
                  isLoading: completionProviderWatch.isLoading,
                  hintText: "Search...",
                  controller: controller,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
