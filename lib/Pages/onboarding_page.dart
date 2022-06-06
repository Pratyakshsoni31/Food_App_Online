import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

bool securetext=true;

class Onboarding extends StatefulWidget {
  const Onboarding({ Key? key }) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}
int x=0;
class _OnboardingState extends State<Onboarding> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user=_googleSignIn.currentUser;
    return Material(
    child: Container(
      color: const Color.fromARGB(251, 252, 255, 255),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30,30,30,0),
            child: Image.asset("assets/onbd.png",
          height: 300,
          width: 300,
          ),),
          const Padding(padding: EdgeInsets.all(7.0),
            child: Text("Quick Food Delivery",
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 18.5,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 35),
              child: Text(
              "Loved the class! Such beautiful and \ncollective impact infrastucture social\nentrepreneur.",
              textAlign: TextAlign.center,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 10,
                color: Color.fromARGB(255, 97, 95, 95)),
            ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: ElevatedButton(
                child: const Text(
                "SIGN IN WITH GOOGLE",
                style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                ),
              ),
                style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                ),  
                fixedSize: const Size(300, 55), primary: Colors.blue[800]),
                onPressed: () async {
                  await _googleSignIn.signIn();
                  setState(() {
                    if(user?.email !=null)
                    {
                      Navigator.pushNamed(context, "/home",arguments: { 'x' : 3});
                    }
                  });
                },
              ),
              ),

              ElevatedButton(
                child: const Text(
                "SIGN IN",
                style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                ),
              ),
                style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                ),  
                fixedSize: const Size(300, 55), primary: const Color.fromARGB(255, 233, 103, 3)),
                onPressed: () {
                 Navigator.pushNamed(context, "/signin");
                },
              ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(),
                const Text("Or Start to",
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 13.8,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            ),
            TextButton(
            child: const Text("Search Now",style: TextStyle(color: Color.fromARGB(255, 233, 103, 3))),
            style: TextButton.styleFrom(fixedSize: const Size.fromHeight(5)),
            onPressed: () {
              Navigator.pushNamed(context, "/home",arguments: { 'x' : 1});
            },
            ),
              ],
            )   
          ],
        ),
      )
    );
  }
}