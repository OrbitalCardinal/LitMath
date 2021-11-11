import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:litmath/models/user.dart';
import 'package:litmath/screens/activities_selection_screens/first_elementary_screen.dart';
import 'package:litmath/screens/activities_selection_screens/second_elementary_screen.dart';
import 'package:litmath/screens/activities_selection_screens/third_elementary_screen.dart';
import 'package:litmath/screens/activities_selection_screens/kinder_screen.dart';
import 'package:litmath/screens/middle_screen.dart';
import 'package:litmath/screens/settings_screen.dart';
import 'package:litmath/widgets/scholarship_card.dart';
import 'package:litmath/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);
  static const routeName = "/selectionScreen";
  

  // Future<void> _submit(
  //     BuildContext context, String email, String password) async {
  //   try {
  //     UserProvider().getUserInfo();
  //   } catch (error) {
  //     showDialog(
  //         context: context,
  //         builder: (_) => AlertDialog(
  //               title: const Text('Error de solicitud HTTP'),
  //               content: Text(error.toString()),
  //             ));
  //     return;
  //   }
  //   showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //             content: const Text('Inició Sesión Correctamente'),
  //             actions: [
  //               TextButton(
  //                 onPressed: () => Navigator.of(context).pop(),
  //                 child: const Text('Okay'),
  //               ),
  //             ],
  //           )).then((_) {
  //     Navigator.of(context).pushReplacementNamed(SelectionScreen.routeName);
  //   });
  // }
  Future <void> _getUserLocalId()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('user');
     
    Map<String,dynamic> userMap = jsonDecode(userPref!) as Map<String, dynamic>;
    print(userMap.values.toList());
  }

  Future <void> _getUserInfo()async {
    UserProvider().getUserInfoD();
  }

  

  @override
  Widget build(BuildContext context) {
    //_getUserLocalId();
    //print('USER ID TOKEN'+UserProvider.idToken);
    //_getUserLocalId();
    _getUserInfo();
//UserProvider().sendReport('Patrones','9','10');
    // UserProvider()._sendReport('Patrones','5','10');
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
              routeName: FirstElementaryScreen.routeName,
            ),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
              imageUrl: "assets/imgs/primaria2.png",
              title: "2° de Primaria",
              color: Colors.green,
              routeName: SecondElementaryScreen.routeName,
            ),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
              imageUrl: "assets/imgs/secundaria.png",
              title: "3° de Primaria",
              color: Colors.red,
              routeName: ThirdElementaryScreen.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
