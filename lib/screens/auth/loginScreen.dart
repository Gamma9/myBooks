import 'package:flutter/material.dart';
import 'package:mybooks/providers/auth.provider.dart';
import 'package:mybooks/screens/auth/signupScreen.dart';
import 'package:mybooks/screens/homeScreen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool isLoading = false;
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final passwordFocusNode = FocusNode();

  void login(BuildContext ctx) {
    setState(() {
      this.isLoading = true;
    });
    Provider.of<AuthProvider>(ctx, listen: false)
        .login(this.email, this.password)
        .then(
          (user) => {
            setState(() {
              this.isLoading = false;
            }),
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) {
                  return HomeScreen();
                },
              ),
            )
          },
        );
  }

  void navToSignup(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return SignupScreen();
      }),
    );
  }

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: this._form,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 52,
                child: Icon(
                  Icons.bookmark,
                  size: 36,
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              Center(
                child: Container(
                  width: 300,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hoverColor: Theme.of(context).primaryColor,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(this.passwordFocusNode);
                        },
                        onSaved: (newEmail) {
                          this.email = newEmail;
                        },
                      ),
                      TextFormField(
                        focusNode: this.passwordFocusNode,
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
                        child: Text('Login'),
                        color: Theme.of(context).primaryColor,
                        hoverColor: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () => {
                          this._form.currentState.save(),
                          login(context),
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => HomeScreen(),
                            ),
                          ),
                        },
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      GestureDetector(
                        child: Text(
                          'Forgot Password',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        onTap: () {
                          print('Nav to Forgot Password');
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        child: Text(
                          'Don\'t have an account? Sign Up',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        onTap: () => navToSignup(context),
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
