import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends BaseController{

Razorpay razorpay = Razorpay();
  @override
  void onInit() {
    super.onInit();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
// Do something when payment succeeds
    print("Payment Done");
  }

  void handlePaymentError(PaymentFailureResponse response) {
// Do something when payment fails
    print("Payment Fail");
  }

  void handleExternalWallet(ExternalWalletResponse response) {
// Do something when an external wallet is selected
  }

  var options = {
    'key': "rzp_test_3uUdABps5fa5pj",
    'name': 'Razorpay Payment Gateway',
    'description': 'Demo',
    'timeout': 300, // in seconds
    'prefill': {
      'contact': '8787878787',
      'email': 'demo@gmail.com'
    }
  };

}