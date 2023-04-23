import 'package:bakery_app/profile/controllers/feedback_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/widgets/app_text_button.dart';

class SendFeedbackDialogWidget extends StatelessWidget {
  SendFeedbackDialogWidget({
    Key? key,
  }) : super(key: key);
  FeedbackController controller = Get.put(FeedbackController());
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Send Feedback",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const VSpace(8.0),
            TextField(
              controller: controller.feedbackCtr.value,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Type...',
              ),
            ),
            const VSpace(16.0),
            AppTextButton(
              text: "Submit Feedback",
              onTap: () {
                controller.submitFeedback();
              },
            )
          ],
        ),
      ),
    );
  }
}
