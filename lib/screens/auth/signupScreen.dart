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
  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  String username;
  String password;
  String firstname;
  String lastname;
  bool isLoading = false;

  void signup(BuildContext context) {
    setState(() {
      this.isLoading = true;
    });
    Provider.of<AuthProvider>(context, listen: false)
        .signup(
          this.firstname,
          this.lastname,
          this.username,
          this.password,
        )
        .then(
          (value) => {
            setState(() {
              this.isLoading = false;
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) {
                  return HomeScreen();
                }),
              );
            })
          },
        );
  }

  void navToLogin(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
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
              // CircleAvatar(
              //   radius: 52,
              //   child: Icon(
              //     Icons.bookmark,
              //     size: 36,
              //   ),
              //   backgroundColor: Theme.of(context).primaryColor,
              // ),
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
                                    .requestFocus(this.usernameFocusNode);
                              },
                              onSaved: (lastname) {
                                this.lastname = lastname;
                              },
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          hoverColor: Theme.of(context).primaryColor,
                        ),
                        focusNode: this.usernameFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(this.passwordFocusNode);
                        },
                        onSaved: (username) {
                          this.username = username;
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
                        child: Text('Signup'),
                        color: Theme.of(context).primaryColor,
                        hoverColor: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () => {
                          this._form.currentState.save(),
                          signup(context),
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
