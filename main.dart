import 'package:daily_journal_app/screens/home_screen.dart';
import 'package:daily_journal_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ddhkbahbwpbogtchskog.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRkaGtiYWhid3Bib2d0Y2hza29nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMxNTMyNDQsImV4cCI6MjA1ODcyOTI0NH0.I6kTy6WY-URbOwoK1AhZ77_QLDByg1TbgSEws_qodnA',
  );

  final session = Supabase.instance.client.auth.currentSession;

  runApp(MyApp(isLoggedIn: session != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyDaily Journal',
          theme: ThemeData.dark(),
          home: isLoggedIn ? const HomeScreen() : const WelcomeScreen(),
        );
      },
    );
  }
}
//jihane
