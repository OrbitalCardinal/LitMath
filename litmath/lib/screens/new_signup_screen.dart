import 'package:flutter/material.dart';

class NewSignUpScreen extends StatefulWidget {
  const NewSignUpScreen({Key? key}) : super(key: key);
  static const routeName = "/newSignupScreen";

  @override
  _NewSignUpScreenState createState() => _NewSignUpScreenState();
}

class _NewSignUpScreenState extends State<NewSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          height: deviceHeight,
          child: Stack(
            children: [
              const Image(
                image: AssetImage("assets/imgs/signupBackground.png"),
                fit: BoxFit.cover,
                height: double.infinity,
                alignment: Alignment.center,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 150),
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
                            "Registrate para que puedas aprovechar los beneficios de aprender con LitMath",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: Theme.of(context).colorScheme.copyWith(
                                primary: Colors.cyan[600],
                              ),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Correo electronico")),
                        ),
                      ),
                      // SizedBox(height: 20),
                      Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: Theme.of(context).colorScheme.copyWith(
                                primary: Colors.cyan[600],
                              ),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Contraseña"),
                          ),
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: Theme.of(context).colorScheme.copyWith(
                                primary: Colors.cyan[600],
                              ),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Confirmar contraseña"),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.cyan[600]),
                        child: const Text(
                          "Registrarse",
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
