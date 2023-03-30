import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../data/data.dart';
import '../screens/login_screen.dart';
import '../screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      onTap: () => onTap(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Stack(
          children: [
            Image(
              height: 200,
              width: double.infinity,
              image: AssetImage(currentUser.backgroundImageUrl),
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 5,
                        color: Theme
                            .of(context)
                            .primaryColor,
                      ),
                    ),
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(currentUser.profileImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    //currentUser.name,
                    (FirebaseAuth.instance.currentUser)!.email.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        _buildDrawerOption(
            Icon(Icons.dashboard),
            'Home',
                () =>
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => HomeScreen()))),
        _buildDrawerOption(Icon(Icons.chat), 'Chat', () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
        }),
        _buildDrawerOption(Icon(Icons.location_on), 'Map', () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
        }),
        _buildDrawerOption(Icon(Icons.account_circle), 'Your Profile', () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => ProfileScreen(user: currentUser)));
        }),
        _buildDrawerOption(Icon(Icons.settings), 'Settings', () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
        }),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: _buildDrawerOption(Icon(Icons.logout), 'Logout', () {
              FirebaseAuth.instance.signOut().then((value) {
                print('Signed Out!');
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              });
            }),
          ),
        )
      ]),
    );
  }
}
