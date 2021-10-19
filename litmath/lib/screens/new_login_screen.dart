import 'package:flutter/material.dart';

class NewLoginScreen extends StatefulWidget {
  const NewLoginScreen({Key? key}) : super(key: key);
  static const routeName = "/newLoginScreen";

  @override
  _NewLoginScreenState createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          height: deviceHeight,
          child: Stack(
            children: [
              const Image(
                image: AssetImage("assets/imgs/loginBackground.png"),
                fit: BoxFit.cover,
                height: double.infinity,
                alignment: Alignment.center,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Bienvenido a LitMath",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Inicia sesión para empezar a aprender",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Correo electronico")),
                      ),
                      // SizedBox(height: 20),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Contraseña"),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.red[400]),
                        child: const Text(
                          "Iniciar sesión",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
