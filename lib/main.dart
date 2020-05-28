import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:temis/User/model/user.dart';
import 'package:temis/User/repository/auth.dart';
import 'package:temis/User/ui/screens/case_inactive.dart';
import 'package:temis/User/ui/screens/chat._case.dart';
import 'package:temis/User/ui/screens/home.dart';
import 'package:temis/User/ui/screens/judgment.dart';
import 'package:temis/User/ui/screens/sign_in.dart';
import 'package:temis/User/ui/screens/start_game.dart';
import 'package:temis/wrapper.dart';

import 'User/ui/screens/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.dark(
      background: Color(0xfffdfdfd),
      primary: Color(0xff00acc1),
      secondary: Color(0xffffab00),
      primaryVariant: Color(0xff0C0A12),
      onBackground: Color(0xffF4F4F4),
      //secondaryVariant: Color(0xff7ec7d0),
      // surface: Color(0xff7ec7d0),
      // primary: Color(0xff7ec7d0),
      // error: Color(0xff7ec7d0),
      // onPrimary: Color(0xff7ec7d0),
      onSecondary: Color(0xfff9f9f9),
      // onSurface: Color(0xff7ec7d0),
      // onError: Color(0xff7ec7d0),
      // brightness: Color(0xff7ec7d0),
    );

    final TextTheme textTheme = TextTheme(
      title: GoogleFonts.comfortaa(
        color: Color(0xff0C0A12),
        fontSize: 28,
      ),
      subtitle: GoogleFonts.roboto(
        color: Color(0xffA5A5A7),
        fontSize: 16,
      ),
      display1: GoogleFonts.roboto(
        color: Color(0xff020202),
        fontSize: 12,
      ),
      caption: GoogleFonts.roboto(
        color: Color(0xffffab00),
        fontSize: 12,
      ),
      button: GoogleFonts.comfortaa(
        color: Color(0xfff4f4f4),
        fontSize: 12,
      ),
    );

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TEMIS',
        theme: ThemeData(
          colorScheme: colorScheme,
          //bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.black),

          // primaryColor: Color(0xff7ec7d0),
          // accentColor: Color(0xff7ec7d0),
          // hintColor: Color(0xff7ec7d0),
          buttonColor: Color(0xff00acc1),
          textTheme: textTheme,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => Wrapper(),
          'login_page': (_) => LoginPage(),
          'sign_in': (_) => SignIn(),
          'home': (_) => Home(),
          'chat': (_) => ChatCase(),
          '/startgame': (_) => StarGame(),
          '/error_case': (_) => CaseInactive(),
          '/judgment': (_) => ScreenJudgment(),
        },
      ),
    );
  }
}
