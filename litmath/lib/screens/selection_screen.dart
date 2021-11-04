import 'package:flutter/material.dart';
import 'package:litmath/screens/elementary_screen.dart';
import 'package:litmath/screens/kinder_screen.dart';
import 'package:litmath/screens/middle_screen.dart';
import 'package:litmath/screens/settings_screen.dart';
import 'package:litmath/widgets/scholarship_card.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);
  static const routeName = "/selectionScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escolaridad"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: const Text(
                  "Menu de opciones",
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                )),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Perfil"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Configuración"),
              onTap: () {
                Navigator.of(context).pushNamed(SettingsScreen.routeName);
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScholarshipCard(
              imageUrl: "assets/imgs/preescolar.png",
              title: "Preescolar",
              color: Colors.cyan.shade400,
              routeName: KinderScreen.routeName,
            ),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
              imageUrl: "assets/imgs/primaria.png",
              title: "1° de Primaria",
              color: Colors.purple,
              routeName: ElementaryScreen.routeName,
            ),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
              imageUrl: "assets/imgs/primaria2.png",
              title: "2° de Primaria",
              color: Colors.green,
              routeName: ElementaryScreen.routeName,
            ),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
              imageUrl: "assets/imgs/secundaria.png",
              title: "3° de Primaria",
              color: Colors.red,
              routeName: MiddleScreen.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
