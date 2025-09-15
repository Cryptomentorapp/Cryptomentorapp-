import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/themes.dart';
import 'controllers/auth_controller.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(const AppRoot());

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});
  @override State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  final ThemeController _theme = ThemeController();
  final AuthController _auth = AuthController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _theme),
        ChangeNotifierProvider.value(value: _auth),
      ],
      child: Consumer2<ThemeController, AuthController>(
        builder: (_, theme, auth, __) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cryptomentor',
          theme: theme.theme,
          home: auth.isAuthed ? HomeScreen(controller: theme) : const LoginScreen(),
        ),
      ),
    );
  }
}
