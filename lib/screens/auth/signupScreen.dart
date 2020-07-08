import 'package:flutter/material.dart';
import 'package:mybooks/providers/auth.provider.dart';
import 'package:mybooks/screens/auth/loginScreen.dart';
import 'package:mybooks/screens/homeScreen.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _form = GlobalKey<FormState>();
  final lastNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  // final firstnameTextController = TextEditingController();
  // final lastnameTextController = TextEditingController();
  // final emailTextController = TextEditingController();
  // final passwordTextController = TextEditingController();

  String email;
  String password;
  String firstname;
  String lastname;
  bool isLoading = false;

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _onSignup(BuildContext context) {
    this._form.currentState.save();
    setState(() {
      this.isLoading = true;
    });
    Provider.of<AuthProvider>(context, listen: false)
        .signup(
      this.firstname,
      this.lastname,
      _authData['email'],
      _authData['password'],
    )
        .then(
      (_) {
        setState(() {
          this.isLoading = false;
        });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return HomeScreen();
          }),
        );
      },
    );
  }

  void navToLogin(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return LoginScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: this._form,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'My Books',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                child: Container(
                  width: 300,
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Firstname',
                                hoverColor: Theme.of(context).primaryColor,
                              ),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(this.passwordFocusNode);
                              },
                              onSaved: (firstname) {
                                this.firstname = firstname;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Lastname',
                                hoverColor: Theme.of(context).primaryColor,
                              ),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(this.emailFocusNode);
                              },
                              onSaved: (lastname) {
                                this.lastname = lastname;
                              },
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        focusNode: this.emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hoverColor: Theme.of(context).primaryColor,
                        ),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(this.passwordFocusNode);
                        },
                        onSaved: (email) {
                          this.email = email;
                        },
                      ),
                      TextFormField(
                        focusNode: this.passwordFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hoverColor: Theme.of(context).primaryColor,
                        ),
                        onSaved: (password) {
                          this.password = password;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      RaisedButton(
                        child: Text('Signup'),
                        color: Theme.of(context).primaryColor,
                        hoverColor: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () => _onSignup(context),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      GestureDetector(
                        child: Text(
                          'Already Have An Account? Login',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        onTap: () => navToLogin(context),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
