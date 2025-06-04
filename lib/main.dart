import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/auth_screen.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/products_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
      ],
      child: MaterialApp(
        title: 'GlowySkin',
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFFFFC0CB, {
            50: Color(0xFFFFF0F3),
            100: Color(0xFFFFE0E6),
            200: Color(0xFFFFC0CB),
            300: Color(0xFFFFB3BC),
            400: Color(0xFFFFA6B3),
            500: Color(0xFFFF99A9),
            600: Color(0xFFFF8CA0),
            700: Color(0xFFFF7F96),
            800: Color(0xFFFF728D),
            900: Color(0xFFFF6583),
          }),
          scaffoldBackgroundColor: Color(0xFFFFF5F5),
          textTheme: GoogleFonts.poppinsTextTheme(),
          colorScheme: ColorScheme.light(
            primary: Color(0xFFFFC0CB),
            secondary: Color(0xFFFFE4E1),
            surface: Colors.white,
            background: Color(0xFFFFF5F5),
          ),
        ),
        home: AuthScreen(),
      ),
    );
  }
} 