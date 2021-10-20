import 'package:flutter/material.dart';
import 'package:litmath/providers/user_provider.dart';
import 'package:sizer/sizer.dart';

class NewLoginScreen extends StatefulWidget {
  const NewLoginScreen({Key? key}) : super(key: key);
  static const routeName = "/newLoginScreen";

  @override
  _NewLoginScreenState createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _validInfo = false;
  bool _validateMail = false;
  bool _validatePass = false;

  final _key = GlobalKey<FormState>();

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
      BuildContext context, String email, String password) async {
    try {
      UserProvider().signIn(email, password);
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
              content: const Text('Inició Sesión Correctamente'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Okay'),
                ),
              ],
            )).then((_) {
      Navigator.of(context).pushReplacementNamed(NewLoginScreen.routeName);
    });
  }

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
              Image(
                image: AssetImage("assets/imgs/loginBackground.png"),
                fit: BoxFit.cover,
                height: double.infinity,
                width: 100.w,
                alignment: Alignment.center,
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 15.2.w, vertical: 27.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Bienvenido a LitMath",
                            style: TextStyle(fontSize: 17.sp),
                          ),
                          Text(
                            "Inicia sesión para empezar a aprender",
                            style: TextStyle(color: Colors.grey[700],fontSize: 14.sp),
                          ),
                        ],
                      ),
                      Form(
                          key: _key,
                          child: Column(
                            children: [
                              TextFormField(
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
                                  contentPadding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w ),
                                    border: OutlineInputBorder(),
                                    label: Text("Correo electronico")),
                              ),
                              // SizedBox(height: 20),
                              SizedBox(height: 20),
                              TextFormField(
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
                                  contentPadding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w ),
                                  border: OutlineInputBorder(),
                                  label: Text("Contraseña"),
                                ),
                              ),
                            ],
                          )),
                      TextButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            _submit(context, emailController.text,
                                passwordController.text);
                          }
                        },
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
