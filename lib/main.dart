import 'package:com/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // for varying the theme
  var theme = ThemeMode.dark;
  var icon = Icons.light_mode;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // changing the theme of app
    void changeTheme() {
      setState(() {
        if (theme == ThemeMode.dark) {
          theme = ThemeMode.light;
          icon = Icons.dark_mode;
        } else {
          theme = ThemeMode.dark;
          icon = Icons.light_mode;
        }
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'e-ignitify',
      // Dark Mode theme
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 5,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),

      // Light Mode Theme
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 5,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                color: kColorScheme.onSecondaryContainer,
                fontWeight: FontWeight.normal,
              ),
            ),
      ),

      themeMode: theme,

      // body of the main page
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Image.asset(
            theme == ThemeMode.dark
                ? 'assets/egnitify.png'
                : 'assets/white.png',
            height: 25,
          ),
          actions: [
            IconButton(
              onPressed: () {
                changeTheme();
              },
              icon: Icon(icon),
            ),
            const SizedBox(width: 10),
          ],
        ),
        drawer: Drawer(
          width: width > 600 ? width * 0.25 : width * 0.875,
          child: const Center(
            child: Text(
              "LOL 😂\nbuy it and \nbuild yourself,...",
              style: TextStyle(
                fontSize: 20,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              '    Egnitify:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Text(
                "Egnitify might derive from 'ignite' suggesting sparking, 'E' representing electronic, "
                "blended to symbolize igniting businesses through digital means.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[550],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // buy button
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  String phoneNumber = '923200094995';
                  String message =
                      'I am interested in buying domain, gmail, linkedin and instagram.';

                  String url =
                      'https://wa.me/$phoneNumber/?text=${Uri.parse(message)}';

                  if (!await launchUrl(
                    Uri.parse(url),
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: const Text(
                  "Tap to Buy",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      heightFactor: 2,
                      child: Text(
                        "Package Includes...",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),

                    // items include in package
                    CardItem(
                      number: '1',
                      heading: 'Domain: ',
                      value: 'egnitify.com',
                      url: 'https://egnitify.com',
                    ),
                    CardItem(
                      number: '2',
                      heading: 'Gmail: ',
                      value: 'egnitify@gmail.com',
                      url: 'mailto:egnitify@gmail.com',
                    ),
                    CardItem(
                      number: '3',
                      heading: 'Instagram: ',
                      value: 'egnitify',
                      url: 'https://instagram.com/egnitify',
                    ),
                    CardItem(
                      number: '4',
                      heading: 'LinkedIn: ',
                      value: 'egnitify',
                      url: 'https://linkedin.com/company/egnitify',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
