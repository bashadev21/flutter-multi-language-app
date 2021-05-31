import 'package:get/get.dart';

class ChangeLanguage extends Translations{
  @override

  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'title':'Language App',
      'welcome':'Welcome'   
    },
     'vi_VN':{
      'title':'भाषा ऐप',
      'welcome':'स्वागत हे'   
    },
      'de_DE':{
      'title':'மொழி பயன்பாடு',
      'welcome':'வரவேற்பு'   
    }
  };

}