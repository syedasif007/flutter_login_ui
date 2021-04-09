import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: h * .2),
            Container(
              // width: w * .5,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: w < h ? (h * .15) : (h * .15),
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/launcher/icon.png",
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Text(
              'App Content Title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(height: h * .1),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 5.0),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.green,
                        primaryColorDark: Colors.green,
                      ),
                      child: TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please provide your username';
                          } else if (value.length < 3) {
                            return 'Username is minimum 6 digits long';
                          }
                          return null;
                        },
                        autocorrect: true,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        decoration: new InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                          ),
                          hintText: 'Enter Username',
                          labelText: 'Username',
                          prefixIcon: IconButton(
                            icon: Icon(
                              Icons.account_circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 5.0),
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.green,
                        primaryColorDark: Colors.green,
                      ),
                      child: TextFormField(
                        obscureText: true,
                        controller: _pwdController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please provide your password';
                          } else if (value.length < 5) {
                            return 'Password must be minimum 6 digits long';
                          }
                          return null;
                        },
                        autocorrect: true,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        decoration: new InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                          ),
                          hintText: 'Enter Password',
                          labelText: 'Password',
                          prefixIcon: IconButton(
                            icon: Icon(
                              Icons.lock,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            ButtonTheme(
              minWidth: w,
              height: w < h ? (w * .12) : (w * .06),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: w < h
                      ? EdgeInsets.fromLTRB(w * 0.39, 15.0, w * 0.39, 15.0)
                      : EdgeInsets.fromLTRB(w * 0.44, 15.0, w * 0.44, 15.0),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Login Successful!'),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.green,
                        // action: SnackBarAction(
                        //   label: 'ACTION',
                        //   onPressed: () {},
                        // ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Provide valid data!'),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }
}
