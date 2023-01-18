import 'package:business_app/core/models/user_model.dart';
import 'package:business_app/core/providers/auth_provider.dart';
import 'package:business_app/core/services/auth_service.dart';
import 'package:business_app/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _errorMessage;
  late AuthService authService;

  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    auth.updateCompanyList();
    super.initState();
    _userController.addListener(() {
      setState(() {});
    });
    _passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    void logInUser(User user) async {
      setState(() {
        _errorMessage = null;
      });
      try {
        await auth.logInUserPwDb(user);
        context.findAncestorStateOfType<NavigatorState>()?.pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()));
      } catch (err) {
        setState(() {
          _errorMessage = err.toString();
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Log In',
                      style: TextStyle(fontSize: 25),
                    )),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Consumer<AuthProvider>(
                              builder: (context, auth, child) =>
                                  auth.companyList.isEmpty
                                      ? const CircularProgressIndicator()
                                      : DropdownButtonFormField(
                                          hint: const Text("Pick a company"),
                                          value: auth.currentCompany,
                                          items: auth.companyList
                                              .map((e) => DropdownMenuItem(
                                                    value: e,
                                                    child: Text(e.companyName),
                                                  ))
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              auth.currentCompany = value;
                                            });
                                          },
                                          validator: (value) => value == null ? 'Please choose a company' : null,
                                        ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFormField(
                              controller: _userController,
                              onChanged: (value) {
                                setState(() {
                                  if (_errorMessage != null) {
                                    _errorMessage = null;
                                  }
                                });
                              },
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Username',
                                  hintText: 'Enter a username'),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a username';
                                }
                                return null;
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          //padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            onChanged: (value) {
                              setState(() {
                                // reset error message when user starts typing
                                if (_errorMessage != null) {
                                  _errorMessage = null;
                                }
                              });
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                hintText: 'Enter your password'),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 250,
                          margin: const EdgeInsets.symmetric(vertical: 25),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            onPressed: (() {
                              if (_formKey.currentState!.validate()) {
                                var user = User(
                                    userName: _userController.text,
                                    password: _passwordController.text,
                                    companyDB: auth.currentCompany!.companyDB);
                                logInUser(user);
                              }
                            }),
                            child: const Text(
                              'Log in',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: _errorMessage != null
                        ? Text(_errorMessage!,
                            style: const TextStyle(color: Colors.red))
                        : null),
              ]),
        ),
      ),
    );
  }
}
