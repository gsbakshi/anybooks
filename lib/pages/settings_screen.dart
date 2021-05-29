import 'package:anybooks/pages/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (ctx, auth, _) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: auth.isAuth
                  ? ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white.withOpacity(0.2),
                      ),
                      title: Text('User Name'),
                    )
                  : ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      title: Text('Sign Up / Log In'),
                      onTap: () {
                        Navigator.of(context).pushNamed(AuthScreen.routeName);
                      },
                    ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.upload_file,
              color: Colors.white.withOpacity(0.2),
            ),
            title: Text('Manage Uploads'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          Divider(
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.info_outline_rounded,
              color: Colors.white.withOpacity(0.2),
            ),
            title: Text('About'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          Divider(
            indent: 16,
            endIndent: 16,
          ),
          auth.isAuth
              ? ListTile(
                  onTap: auth.logout,
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  title: Text('Logout'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white.withOpacity(0.2),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
