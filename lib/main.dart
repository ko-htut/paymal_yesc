import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/controllers/drawer_index_controller.dart';
import 'package:admin/data/myprefs.dart';
import 'package:admin/screens/login/login.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MyPrefs.init().then((value) => runApp(MyApp()));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DrawerIndexController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MOEE Management Portall',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          canvasColor: secondaryColor,
        ),
        home: MyPrefs.getBool('loggedIn',false)?MainScreen():LoginScreen(),
      ),
    );
  }
}
