import 'package:flutter/material.dart';
import 'package:litmath/utilities/constants.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/RegisterScreen";
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {
  Widget _NombreTextField(){
    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Nombre',
                          style: kLabelStyle,
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60.0,
                          child: TextField(keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.person,
                              color:Colors.black,
                            ),
                            hintText: 'Ingrese el nombre de su hijo',
                            hintStyle: kHintTextStyle,
                          ),
                        ),
                      ),
                    ],
              );
  }

  Widget _EmailTextField(){
    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Email',
                          style: kLabelStyle,
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60.0,
                          child: TextField(keyboardType: TextInputType.name,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.email,
                              color:Colors.black,
                            ),
                            hintText: 'Ingrese su email',
                            hintStyle: kHintTextStyle,
                          ),
                        ),
                      ),
                    ],
              );
  }

  Widget _PasswordTextField(){
    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Password',
                          style: kLabelStyle,
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60.0,
                          child: TextField(obscureText: true,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.lock,
                              color:Colors.black,
                            ),
                            hintText: 'Ingrese una contraseña',
                            hintStyle: kHintTextStyle,
                          ),
                        ),
                      ),
                    ],
              );
  }

  Widget _CreateAccount() {
    return Container(
      alignment: Alignment.centerRight,
      child:TextButton(style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 15),
      ),
        onPressed: () => print('Crear una cuenta pressed'),
          child: const Text('Crear una cuenta'),
           ),
          );
  }
  
  Widget _RegisterButton() {
  return Container(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            ),
                            primary: Colors.lightBlue,),
                            child: Text(
                              'CREAR UNA CUENTA',
                              style: TextStyle(
                                letterSpacing: 1.5
                              ),
                            ),
                        onPressed: () => {Navigator.of(context).pushReplacementNamed("/FirstScreen")},
                      )
                    );
}

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
           /*  decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1,0.4,0.7,0.9],
                ),
            ), */
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Crear una cuenta',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    _NombreTextField(),
                    SizedBox(height: 30.0),
                    _EmailTextField(),
                    SizedBox(height: 30.0),
                    _PasswordTextField(),
                    _RegisterButton(),
                  ],
                ),
          ),
          ),
        ],
      ) ,
    );
  }
}