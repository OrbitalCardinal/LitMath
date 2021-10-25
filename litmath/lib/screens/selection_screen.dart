import 'package:flutter/material.dart';

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
              onTap: () {},
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
              color: Theme.of(context).colorScheme.primary,
              routeName: "ruta",
            ),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
              imageUrl: "assets/imgs/primaria.png",
              title: "Primaria",
              color: Theme.of(context).colorScheme.primary,
              routeName: "ruta",
            ),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
              imageUrl: "assets/imgs/secundaria.png",
              title: "Secundaria",
              color: Theme.of(context).colorScheme.primary,
              routeName: "ruta",
            ),
          ],
        ),
      ),
    );
  }
}

class ScholarshipCard extends StatelessWidget {
  String imageUrl;
  String title;
  Color color;
  String routeName;
  ScholarshipCard(
      {required this.imageUrl,
      required this.title,
      required this.color,
      required this.routeName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 50,
            child: InkWell(
              onTap: () {
                // Navigation push routename
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: color),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                height: 100,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
            ),
          ),
          Image(
            image: AssetImage(imageUrl),
            width: 100,
          ),
        ],
      ),
    );
  }
}
