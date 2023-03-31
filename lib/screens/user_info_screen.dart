import 'package:firebase/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  final User user;
  const UserInfoScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User name: ${user.displayName}'),
            Text('User email: ${user.email}'),
            StreamBuilder<User?>(
              builder: (context, AsyncSnapshot<User?> snapshot) {
                if (snapshot.data == null) {
                  return const Text('User not found');
                }
                final user = snapshot.data!;
                user.reload();
                if (user.emailVerified) {
                  return Text('Email: is Verify: ${user.emailVerified}');
                } else {
                  return Column(
                    children: [
                      Text('Email: is Verify: ${user.emailVerified}'),
                      TextButton(
                          child: const Text('Verify Email'),
                          onPressed: () {
                            FirebaseService().onVerifyEmail();
                          }),
                    ],
                  );
                }
              },
              stream: FirebaseService().auth.userChanges(),
            ),
            TextButton(
              onPressed: () {
                FirebaseService().logOut();
              },
              child: const Text('logout'),
            ),
          ],
        ),
      ),
    );
  }
}
