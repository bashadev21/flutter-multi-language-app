import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multilanguage/translations.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final MyController con = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MultiLanguage Demo',
      locale: Locale(con.lancode.value, con.lancountry.value),
      translations: ChangeLanguage(),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('title'.tr),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'welcome'.tr,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Change Language'),
        onPressed: () {
          Get.dialog(Popup());
        },
        tooltip: 'Increment',
        icon: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Popup extends StatelessWidget {
  final MyController con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 200,
            child: Column(
              children: [
                ListTile(
                    onTap: () {
                      Get.back();
                      Get.updateLocale(Locale('en', 'US'));
                      con.setlancode('en');
                      con.setlancountry('US');
                    },
                    leading: Icon(Icons.language),
                    title: Text('English')),
                Divider(),
                ListTile(
                    onTap: () {
                      Get.back();
                      con.setlancode('de');
                      con.setlancountry('DE');
                      Get.updateLocale(Locale('de', 'DE'));
                    },
                    leading: Icon(Icons.language),
                    title: Text('தமிழ்')),
                Divider(),
                ListTile(
                    onTap: () {
                      Get.back();
                      con.setlancode('vi');
                      con.setlancountry('VN');
                      Get.updateLocale(Locale('vi', 'VN'));
                    },
                    leading: Icon(Icons.language),
                    title: Text('हिंदी')),
              ],
            )),
      ),
    );
  }
}

class MyController extends GetxController {
  var lancode = 'en'.obs;
  var lancountry = 'US'.obs;

  @override
  void onInit() {
    lancode.value= GetStorage().read('lancode');
    lancountry.value= GetStorage().read('lancountry');
    super.onInit();
  }

  setlancode(String code) {
    lancode(code);
     GetStorage().write('lancode',code);
  }
  
  setlancountry(String countrycode) {
     GetStorage().write('lancountry', countrycode);
    lancountry(countrycode);
  }
}
