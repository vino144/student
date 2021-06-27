import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
  ],
);

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomeScreen();
  }
}

class _WelcomeScreen extends State<WelcomeScreen> {
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

            child: Column(
              children: [
                Expanded(
                  child:
                  CarouselSlider(
                      items: banners(),
                      options: CarouselOptions(
                        height: 800,
                        aspectRatio: 16/9,
                        viewportFraction: 1.5,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (int index, CarouselPageChangedReason reason){

                        },
                        scrollDirection: Axis.horizontal,
                      )
                  ),
                  flex: 5,
                ),
                Expanded(
                  child: Container(


                    child: Column(

                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 5,left: 10,right: 10),
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Register'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12), // <-- Radius
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5,left: 10,right: 10),
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Login'),

                              style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12), // <-- Radius
                                ),

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 2,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }


   List<Widget> banners(){
    List<Widget> banner = [] ;
    for(int i = 0;i<4;i++){
      Widget bannerwid = new Container(
        child: Image.asset(
          'images/banner.jpg',


          alignment: Alignment.center,
        ),
      );
      banner.add(bannerwid);
    }
    return banner;
  }
}
