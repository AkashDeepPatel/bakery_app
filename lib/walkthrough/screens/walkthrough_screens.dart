import 'package:bakery_app/walkthrough/controllers/walkthrough_controller.dart';
import 'package:bakery_app/welcome_screen/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../common/screens/common_base_class.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/styles/app_themes.dart';

class WalkThroughScreens extends StatelessWidget {
  WalkThroughScreens({Key? key}) : super(key: key);
  final WalkThroughController _walkThroughController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => CommonBaseClass(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: const BoxDecoration(
                          color: AppThemes.walkthroughBlue,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(190.0),
                              bottomRight: Radius.circular(190.0))),
                      child: Center(
                          child: SvgPicture.asset(_walkThroughController
                              .walkthroughItems[
                                  _walkThroughController.walkthroughIndex.value]
                              .image!)),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60),
                        child: InkWell(
                          onTap: () {
                            Get.offAll(() => const WelcomeScreen());
                          },
                          child: Text(
                            "Skip",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: Text(
                    _walkThroughController
                        .walkthroughItems[
                            _walkThroughController.walkthroughIndex.value]
                        .title!,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const VSpace(20),
                Center(
                  child: Text(
                    _walkThroughController
                        .walkthroughItems[
                            _walkThroughController.walkthroughIndex.value]
                        .description!,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                // const VSpace(20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     for (int i = 0; i < 3; i++)
                //       Padding(
                //         padding: const EdgeInsets.all(3.0),
                //         child: CircleAvatar(
                //           radius: 5,
                //           backgroundColor:
                //               _walkThroughController.walkthroughIndex.value == i
                //                   ? AppThemes.black
                //                   : AppThemes.subtleDark,
                //         ),
                //       ),
                //   ],
                // ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      _walkThroughController.walkthroughIndex <
                              _walkThroughController.walkthroughItems.length - 1
                          ? _walkThroughController.walkthroughIndex++
                          : Get.offAll(() => const WelcomeScreen());
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: AppThemes.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
