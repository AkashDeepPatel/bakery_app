import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:get/get.dart';

class ProductDetailsController extends BaseController{


  RxInt qty = 1.obs;

  addQty(){
    qty<5?qty++:null;
  }
  removeQty(){
    qty==1
        ?null
        : qty--;
  }
}