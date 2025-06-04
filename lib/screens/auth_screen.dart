import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'home_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _isLoading = false;
  final _passwordController = TextEditingController();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'name': '',
  };

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    try {
      if (_isLogin) {
        await Provider.of<AuthProvider>(context, listen: false)
            .login(_authData['email']!, _authData['password']!);
      } else {
        await Provider.of<AuthProvider>(context, listen: false)
            .signup(_authData['email']!, _authData['password']!, _authData['name']!);
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => HomeScreen()),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Authentication failed. Please try again.'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  Theme.of(context).colorScheme.secondary.withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
                      child: Text(
                        'GLOWYSKIN',
                        style: TextStyle(
                          color: Theme.of(context).primaryTextTheme.titleLarge?.color,
                          fontSize: 50,
                          fontFamily: 'Anton',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 8.0,
                      child: Container(
                        width: deviceSize.width * 0.75,
                        padding: EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                if (!_isLogin)
                                  TextFormField(
                                    decoration: InputDecoration(labelText: 'Name'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _authData['name'] = value!;
                                    },
                                  ),
                                TextFormField(
                                  decoration: InputDecoration(labelText: 'E-Mail'),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty || !value.contains('@')) {
                                      return 'Invalid email!';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _authData['email'] = value!;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(labelText: 'Password'),
                                  obscureText: true,
                                  controller: _passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 5) {
                                      return 'Password is too short!';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _authData['password'] = value!;
                                  },
                                ),
                                if (!_isLogin)
                                  TextFormField(
                                    decoration: InputDecoration(labelText: 'Confirm Password'),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value != _passwordController.text) {
                                        return 'Passwords do not match!';
                                      }
                                      return null;
                                    },
                                  ),
                                SizedBox(height: 20),
                                if (_isLoading)
                                  CircularProgressIndicator()
                                else
                                  ElevatedButton(
                                    child: Text(_isLogin ? 'LOGIN' : 'SIGN UP'),
                                    onPressed: _submit,
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                                      backgroundColor: Theme.of(context).primaryColor,
                                      foregroundColor: Theme.of(context).primaryTextTheme.labelLarge?.color,
                                    ),
                                  ),
                                TextButton(
                                  child: Text(
                                    '${_isLogin ? 'SIGNUP' : 'LOGIN'} INSTEAD',
                                    style: TextStyle(color: Theme.of(context).primaryColor),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isLogin = !_isLogin;
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 