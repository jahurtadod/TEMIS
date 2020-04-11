import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:temis/User/bloc/bloc_user.dart';

import 'User/ui/screens/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.dark(
      background: Color(0xff292a2d),
      primaryVariant: Color(0xff7ec7d0),
      secondary: Color(0xff7ec7d0),
      secondaryVariant: Color(0xff7ec7d0),
      surface: Color(0xff7ec7d0),
      primary: Color(0xff7ec7d0),
      error: Color(0xff7ec7d0),
      onPrimary: Color(0xff7ec7d0),
      onSecondary: Color(0xff7ec7d0),
      onSurface: Color(0xff7ec7d0),
      onBackground: Color(0xff7ec7d0),
      onError: Color(0xff7ec7d0),
      //brightness: Color(0xff7ec7d0),
    );

    final TextTheme textTheme = TextTheme(
      body1: GoogleFonts.comfortaa(
        color: Color(0xfff4f4f4),
        fontSize: 24,
      ),
      subtitle: GoogleFonts.roboto(
        color: Color(0xfff4f4f4),
        fontSize: 16,
      ),
      button: GoogleFonts.comfortaa(
        color: Color(0xfff4f4f4),
        fontSize: 12,
      ),
    );

    return BlocProvider(
      bloc: UserBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TEMIS',
        theme: ThemeData(
          colorScheme: colorScheme,
          primaryColor: Color(0xff7ec7d0),
          accentColor: Color(0xff7ec7d0),
          hintColor: Color(0xff7ec7d0),
          buttonColor: Color(0xff7ec7d0),
          textTheme: textTheme,
          primaryTextTheme: textTheme,
        ),
        home: LoginPage(),
      ),
    );
  }
}
