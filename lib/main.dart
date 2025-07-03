import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'auth_provider.dart';
import 'theme_provider.dart';
import 'splash_screen.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'profile_screen.dart';
import 'navigation.dart';
import 'item_exchange_screen.dart';
import 'auction_screen.dart';
import 'admin_panel_screen.dart';
import 'analytics_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Normally initialize Firebase here using DefaultFirebaseOptions
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) {
          return MaterialApp(
            title: 'Poinix',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: theme.themeMode,
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/login': (context) => const LoginScreen(),
              '/signup': (context) => const SignupScreen(),
              '/profile': (context) => const ProfileScreen(),
              '/home': (context) => const Navigation(),
              '/itemExchange': (context) => const ItemExchangeScreen(),
              '/auction': (context) => const AuctionScreen(),
              '/admin': (context) => const AdminPanelScreen(),
              '/analytics': (context) => const AnalyticsScreen(),
            },
          );
        },
      ),
    );
  }
}
