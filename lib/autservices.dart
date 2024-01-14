import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthManager extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> loginUser(String emailOrUsername, String password) async {
    try {
      UserCredential userCredential;

      // Check if the input is an email
      if (emailOrUsername.contains('@')) {
        userCredential = await _auth.signInWithEmailAndPassword(
          email: emailOrUsername,
          password: password,
        );
      } else {
        // If not an email, assume it's a username
        // Find user by username in Firestore
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('username', isEqualTo: emailOrUsername)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          // If username is found, login using the associated email
          String email = querySnapshot.docs.first['email'];
          userCredential = await _auth.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
        } else {
          // If username is not found, throw an exception or handle as needed
          throw FirebaseAuthException(
            code: 'user-not-found',
            message: 'User with this username not found.',
          );
        }
      }

      // Return the logged-in user
      return userCredential.user;
    } catch (e) {
      // Handle login error
      print('Error during login: $e');
      return null;
    }
  }

  Future<User?> signInUser(
      String username, String email, String password) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get UID of the newly created user
      String uid = userCredential.user!.uid;

      // Save user information to Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': uid,
        'username': username,
        'email': email,
        'password': password,
        // Add other fields as needed
      });

      // Return the newly created user
      return userCredential.user;
    } catch (e) {
      // Handle sign-up error
      print('Error during sign-up: $e');
      return null;
    }
  }

  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      // Handle logout error
      print('Error during logout: $e');
    }
  }

  // Additional functions if needed

  // ...
}
