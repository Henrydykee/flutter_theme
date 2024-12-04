// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_theme/theme.dart';
import 'package:provider/provider.dart';

// Import the previous theme and extension files


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppTheme()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (context, appTheme, child) {
        return MaterialApp(
          title: 'Theme Switcher App',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: appTheme.themeMode,
          home: MainScaffold(),
        );
      },
    );
  }
}

class MainScaffold extends StatefulWidget {
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SettingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Use the custom extension to access app-specific colors
    final appColors = Theme.of(context).appColors;

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Switcher App'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to the Home Page',
            style: TextStyle(
              color: appColors.textHeaderColor,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 20),
          Container(
            color: appColors.cardBgColor1,
            padding: EdgeInsets.all(16),
            child: Text(
              'This is a sample content with custom theming',
              style: TextStyle(
                color: appColors.textBodyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    final appColors = Theme.of(context).appColors;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Theme Settings',
            style: TextStyle(
              color: appColors.textHeaderColor,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 20),
          // Theme Mode Selector
          DropdownButton<ThemeMode>(
            value: appTheme.themeMode,
            onChanged: (ThemeMode? newMode) {
              if (newMode != null) {
                appTheme.themeMode = newMode;
              }
            },
            items: [
              DropdownMenuItem(
                child: Text('System Theme'),
                value: ThemeMode.system,
              ),
              DropdownMenuItem(
                child: Text('Light Mode'),
                value: ThemeMode.light,
              ),
              DropdownMenuItem(
                child: Text('Dark Mode'),
                value: ThemeMode.dark,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: appColors.brandColor,
            child: Icon(
              Icons.person,
              size: 50,
              color: appColors.whiteColor,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'User Profile',
            style: TextStyle(
              color: appColors.textHeaderColor,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}