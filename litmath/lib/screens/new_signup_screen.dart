import 'package:flutter/material.dart';
import 'package:litmath/providers/user_provider.dart';

class NewSignUpScreen extends StatefulWidget {
  const NewSignUpScreen({Key? key}) : super(key: key);
  static const routeName = "/newSignupScreen";

  @override
  _NewSignUpScreenState createState() => _NewSignUpScreenState();
}

class _NewSignUpScreenState extends State<NewSignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  static final RegExp nameRegExp = RegExp('[a-zA-Z]');

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  Future<void> _submit(
      BuildContext context, String email, String password, String name) async {
    try {
      UserProvider().signup(email, password, name);
    } catch (error) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text('Error de solicitud HTTP'),
                content: Text(error.toString()),
              ));
      return;
    }
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: const Text('Se registró correctamente'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Okay'),
                ),
              ],
            )).then((_) {
      Navigator.of(context).pushReplacementNamed(NewSignUpScreen.routeName);
    });
  }

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
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
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
                      Form(
                          key: _key,
                          child: Column(
                            children: [
                              Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme:
                                      Theme.of(context).colorScheme.copyWith(
                                            primary: Colors.cyan[600],
                                          ),
                                ),
                                child: TextFormField(
                                  controller: nameController,
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value == null ||
                                        !nameRegExp.hasMatch(value) ||
                                        value.toString().isEmpty) {
                                      return 'Ingrese un nombre valido';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("Nombre del niño(a)"),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme:
                                      Theme.of(context).colorScheme.copyWith(
                                            primary: Colors.cyan[600],
                                          ),
                                ),
                                child: TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null ||
                                        !validateEmail(value) ||
                                        value.toString().isEmpty) {
                                      return 'Ingrese un email valido';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text("Correo electronico")),
                                ),
                              ),
                              SizedBox(height: 20),
                              Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme:
                                      Theme.of(context).colorScheme.copyWith(
                                            primary: Colors.cyan[600],
                                          ),
                                ),
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null ||
                                        validateStructure(value) ||
                                        value.toString().isEmpty) {
                                      return 'Ingrese una contraseña valida';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("Contraseña"),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme:
                                      Theme.of(context).colorScheme.copyWith(
                                            primary: Colors.cyan[600],
                                          ),
                                ),
                                child: TextFormField(
                                  controller: confirmPasswordController,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null ||
                                        validateStructure(value) ||
                                        value.toString().isEmpty) {
                                      return 'Ingrese una contraseña valida';
                                    }
                                    if (value != passwordController.text) {
                                      return 'La contraseña no coincide';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("Confirmar contraseña"),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      TextButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            _submit(context, emailController.text,
                                passwordController.text, nameController.text);
                          }
                        },
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
