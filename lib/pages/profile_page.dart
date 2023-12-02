import 'package:flutter/material.dart';
import 'package:minimal_markt/components/my_circular_image.dart';
import 'package:minimal_markt/components/my_drawer.dart';
import 'package:minimal_markt/components/my_heading_text.dart';
import 'package:minimal_markt/components/my_profile_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Profile',
        ),
        //go to cart page
        actions: [
          IconButton(
            onPressed: () {
              //pop drawer
              Navigator.pop(context);

              //log out
              logout();
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(children: [
            //Profile picture
            const MyCircularImage(
              width: 88,
              height: 88,
              padding: 2,
              image: 'assets/ads/6.png',
            ),
            TextButton(
                onPressed: () {}, child: const Text('Change Profile Picture')),

            //Body
            const SizedBox(
              height: 16,
            ),
            const Divider(),

            const SizedBox(
              height: 16,
            ),

            const MyHeading(
              title: 'Profile Information',
              showActionButton: false,
            ),
            const SizedBox(
              height: 16,
            ),

            MyProfileText(
              onPressed: () {},
              title: 'name',
              value: 'Name',
            ),
            MyProfileText(
              onPressed: () {},
              title: 'username',
              value: 'Name',
            ),

            const Divider(),

            const MyHeading(
              title: 'Personal Information',
              showActionButton: false,
            ),

            const SizedBox(
              height: 16,
            ),

            MyProfileText(
              onPressed: () {},
              title: 'userId',
              value: 'Name',
              icon: Icons.copy,
            ),
            MyProfileText(
              onPressed: () {},
              title: 'name',
              value: 'Name',
            ),
            MyProfileText(
              onPressed: () {},
              title: 'name',
              value: 'Name',
            ),
            MyProfileText(
              onPressed: () {},
              title: 'name',
              value: 'Name',
            ),
            MyProfileText(
              onPressed: () {},
              title: 'name',
              value: 'Name',
            ),

            const Divider(),

            const SizedBox(
              height: 16,
            ),


            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Close Account',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
