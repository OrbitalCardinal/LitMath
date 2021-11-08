import 'package:flutter/material.dart';
import 'package:litmath/screens/slides_screens/slide_show_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const routeName = "/settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuración"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTile(
                title: Text("Terminos y condiciones"),
                leading: Icon(Icons.insert_drive_file_outlined),
                onTap: () {}),
            ListTile(
              title: Text("Acerca de"),
              leading: Icon(Icons.help_outline),
              onTap: () {},
            ),
            ListTile(
              title: Text("Cerrar sesión"),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.of(context).pushNamed(SlideShowScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
