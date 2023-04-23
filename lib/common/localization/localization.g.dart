import 'package:get/get.dart';
class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_us': {
'app_name': 'Crown Bakery',
'button.home': 'Home',
},
'fr_fr': {
'app_name': 'Boulangerie de couronne',
'button.home': 'Maison',
},
'zh-hans_cn': {
'app_name': '皇冠面包店',
'button.home': '家',
},
'hi_in': {
'app_name': 'क्राउन बेकरी',
'button.home': 'घर',
},
        };
         static const appName = 'app_name'; 
 static const buttonHome = 'button.home'; 

      }
      