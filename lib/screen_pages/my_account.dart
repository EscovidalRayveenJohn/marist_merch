import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maristcommerce/BottomNavBar/custom_scaffold.dart';
import 'package:maristcommerce/screens_auth/login_screen.dart';

class MyAccount extends StatelessWidget {
  final GoogleSignInAccount? user;

  const MyAccount({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.green[700]),
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    user?.photoUrl != null
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(user!.photoUrl!),
                            radius: 30,
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: Icon(Icons.person,
                                size: 30, color: Colors.green[700]),
                          ),
                    SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.displayName ?? 'User Name',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          user?.email ?? 'user@example.com',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              'images/m3.jpg',
              height: 150,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'My Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ListOfOption(
              icon: Icon(Icons.person_2_outlined, color: Colors.green),
              title: 'Home',
            ),
            ListOfOption(
              icon: Icon(Icons.location_city_outlined, color: Colors.green),
              title: 'Address',
            ),
            ListOfOption(
              icon: Icon(Icons.payment_outlined, color: Colors.green),
              title: 'Payment',
            ),
            ListOfOption(
              icon: Icon(Icons.shopping_bag_outlined, color: Colors.green),
              title: 'Orders',
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ListOfOption(
              icon: Icon(Icons.language_outlined, color: Colors.green),
              title: 'Language',
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title: Text('Sign Out'),
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
              onTap: () async {
                await GoogleSignIn().signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      showBottomNavBar: true,
      initalIndex: 3,
    );
  }
}

class ListOfOption extends StatelessWidget {
  final Icon icon;
  final String title;
  const ListOfOption({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
      onTap: () {},
    );
  }
}
