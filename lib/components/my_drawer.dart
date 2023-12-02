import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_markt/components/my_list_tile.dart';
import 'package:minimal_markt/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool themeData = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header: logo
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              //shop tile
              MyListTile(
                  text: 'Home',
                  icon: Icons.home_outlined,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/shop_page');
                  }),

              //Favorites tile
              MyListTile(
                  text: 'Favorites',
                  icon: Icons.favorite_border_outlined,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/favorites_page');
                  }),

              //cart tile
              MyListTile(
                  text: 'Cart',
                  icon: Icons.shopping_cart_outlined,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page');
                  }),

              //theme tile
              SwitchListTile(
                title: const Text('Theme'),
                value: themeData,
                onChanged: (bool value) {
                  setState(() {
                    themeData = value;
                  });
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toogleTheme();
                },
                secondary: themeData
                    ? const Icon(Icons.dark_mode_outlined)
                    : const Icon(Icons.light_mode_outlined),
              ),

              //Profile tile
              MyListTile(
                  text: 'Profile',
                  icon: Icons.person_2_outlined,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/profile_page');
                  }),

              //about us tile
              MyListTile(
                  text: 'Privacy policy',
                  icon: Icons.info_outline_rounded,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page');
                  }),

              //Help tile
              MyListTile(
                  text: 'Help',
                  icon: Icons.help_outline_rounded,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page');
                  }),
            ],
          ),
          //exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Column(
              children: [
                MyListTile(
                  text: 'Log Out',
                  icon: Icons.exit_to_app,
                  onTap: () {
                    //pop drawer
                    Navigator.pop(context);

                    //log out
                    logout();
                  },
                  //Navigator.pushNamedAndRemoveUntil(context, '/intro_page', (route) => false),
                ),
                const Text('@iTech company™'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//log out user
void logout() {
  FirebaseAuth.instance.signOut();
}
