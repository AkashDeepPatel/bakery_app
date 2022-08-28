import 'package:get/get.dart';

import '../utils/arch_utils/enums/state_types.dart';

class BaseController extends GetxController with StateMixin {
  StateType stateType = StateType.idle;
  setState(StateType state) {
    stateType = state;
    update();
  }
}
