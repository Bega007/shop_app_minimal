import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_markt/auth/auth.dart';
import 'package:minimal_markt/auth/login_or_register.dart';
import 'package:minimal_markt/firebase_options.dart';
import 'package:minimal_markt/models/adds.dart';
import 'package:minimal_markt/models/shop.dart';
import 'package:minimal_markt/pages/cart_page.dart';
import 'package:minimal_markt/pages/favorites_page.dart';
import 'package:minimal_markt/pages/intro_page.dart';
import 'package:minimal_markt/pages/product_detail_page.dart';
import 'package:minimal_markt/pages/profile_page.dart';
import 'package:minimal_markt/pages/shop_page.dart';
import 'package:minimal_markt/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Shop(),
        ),
        ChangeNotifierProvider(
          create: (context) => Adds(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/auth': (context) => const AuthPage(),
        '/login_or_register': (context) => const LoginOrRegister(),
        '/shop_page': (context) => const ShopPage(),
        '/favorites_page': (context) => const FavoritesPage(),
        '/cart_page': (context) => const CartPage(),
        '/profile_page': (context) => const ProfilePage(),
        '/setings_page': (context) => const IntroPage(),
        '/product_detail_page' : (context) => const ProductDetailPage(),
      },
    );
  }
}
