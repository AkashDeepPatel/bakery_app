import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/widgets/app_text_field.dart';
import '../controllers/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  ChatController controller = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showAppBar: true,

      child: Column(
        children: [
          const Expanded(flex: 11, child: MessagesStream()),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 7,
                      child: TextField(
                        controller: controller.msgCtr.value,
                      )),
                  const HSpace(8),
                  Expanded(
                      flex: 2,
                      child: AppTextButton(
                        text: "Send",
                        onTap: () {
                          controller.sendMessage();
                        },
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
      // ListView(
      //   children: controller.chatList,
      // ),
    );
  }
}
