import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:student/RegisterScreen.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
  ],
);

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  GoogleSignInAccount? _currentUser;
  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
        String mail = _currentUser!.email;
        print('mail '+mail);
      });
      if (_currentUser != null) {

      }
    });
    _googleSignIn.signInSilently();
  }

  // Widget _buildBody() {
  //   GoogleSignInAccount? user = _currentUser;
  //   if (user != null) {
  //     return Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: <Widget>[
  //         ListTile(
  //           leading: GoogleUserCircleAvatar(
  //             identity: user,
  //           ),
  //           title: Text(user.displayName ?? ''),
  //           subtitle: Text(user.email),
  //         ),
  //         const Text("Signed in successfully."),
  //         Text(''),
  //         ElevatedButton(
  //           child: const Text('SIGN OUT'),
  //           onPressed: _handleSignOut,
  //         ),
  //
  //       ],
  //     );
  //   } else {
  //     return Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: <Widget>[
  //         const Text("You are not currently signed in."),
  //         ElevatedButton(
  //           child: const Text('SIGN IN'),
  //           onPressed: _handleSignIn,
  //         ),
  //       ],
  //     );
  //   }
  // }
  @override
  void dispose() {
    super.dispose();
  }
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset : false,
          body: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(

                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xff0C305A),
                          size: 30,
                        ),
                        alignment: Alignment.centerLeft,
                        height: 35,

                      ),
                      Row(
                        children: [
                          Expanded(child: Text('Welcome \nBack',style: TextStyle(
                            color: Color(0xff0C305A),fontSize: 20,fontWeight: FontWeight.bold
                          ),),flex: 4,),
                          Expanded(child: Image.asset(
                            'images/logo.png',

                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                          ),flex: 2,),
                        ],
                      )
                    ],
                  ),
                  flex: 4,
                ),
                Expanded(
                  child: Container(


                    child: Column(

                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 15,left: 10,right: 10),
                          child: TextFormField(
                            style: TextStyle(color: Color(0xff0C305A), fontSize: 14),
                            controller: usernameController,
                            decoration: InputDecoration(
                              labelText: "Username",
                              labelStyle: TextStyle(color:  Colors.blue[70], fontSize: 14),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color:  Colors.blue,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15,left: 10,right: 10),
                          child: TextFormField(
                            style: TextStyle(color: Color(0xff0C305A), fontSize: 14),
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color:  Colors.blue[70], fontSize: 14),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color:  Colors.blue,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {

                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder:
                                            (BuildContext context) =>
                                            RegisterScreen()));
                              },
                              child: Text('Login'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12), // <-- Radius
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Center(
                              child: Text('Forget Password ?',style: TextStyle(
                                color: Color(0xff557EAE),fontSize: 14,
                              ),)
                          ),
                        )
                      ],
                    ),
                  ),
                  flex: 10,
                ),

                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Or Login With',style: TextStyle(
                      color: Color(0xff557EAE),fontSize: 14,
                    ),),
                    Container(
                      padding: EdgeInsets.only(top:10,left: 10,right: 10),
                      child: Row(
                        children: [
                          Expanded(child: Column(
                            children: [
                              Container(

                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        'images/fb_bg.png',
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    Center(
                                      child: Image.asset(
                                        'images/fb_white.png',
                                        height: 25,
                                        width: 25,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(10),
                              ),
                              Text('Facebook',style: TextStyle(
                                color: Color(0xff557EAE),fontSize: 14,
                              ),),
                            ],
                          ),flex: 1,),
                          Expanded(child: InkWell(
                            onTap: (){
                              _handleSignIn();
                            },
                            child: Column(
                              children: [
                                Container(

                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          'images/google_bg.png',
                                          height: 50,
                                          width: 50,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      Center(
                                        child: Image.asset(
                                          'images/google.png',
                                          height: 25,
                                          width: 25,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.all(10),
                                ),
                                Text('Google',style: TextStyle(
                                  color: Color(0xff557EAE),fontSize: 14,
                                ),),
                              ],
                            ),
                          ),flex: 1,),
                          Expanded(child: Column(
                            children: [
                              Container(

                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        'images/apple_bg.png',
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    Center(
                                      child: Image.asset(
                                        'images/apple_white.png',
                                        height: 25,
                                        width: 25,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(10),
                              ),
                              Text('Apple',style: TextStyle(
                                color: Color(0xff557EAE),fontSize: 14,
                              ),),
                            ],
                          ),flex: 1,),
                        ],

                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Center(
                            child: Text('New User ? ',style: TextStyle(
                              color: Color(0xff0C305A),fontSize: 14,fontWeight: FontWeight.bold
                            ),),
                          ),
                          Center(
                            child: Text('Sign up',style: TextStyle(
                              color: Color(0xff057FE9),fontSize: 14,fontWeight: FontWeight.bold
                            ),),
                          ),
                        ],
                      ),
                    )

                  ],
                ),flex: 7,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
