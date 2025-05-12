import 'package:flutter/material.dart';
import 'package:sincapp/components/BottomNavBar/customNavBar.dart';
import 'package:sincapp/components/app_bar.dart';
import 'package:sincapp/components/Filters/filters_list.dart';
import 'package:sincapp/components/Posts/signlePost.dart';
import 'package:sincapp/pages/accountPage.dart';
import 'package:sincapp/pages/favoritePage.dart';
import 'package:sincapp/pages/postPage.dart';
import 'package:sincapp/pages/searchPage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sincapp/services/Auth/firebaseauth.dart';
import 'package:sincapp/services/Auth/auth_providers.dart';

// Feedview is a stateful widget that uses Riverpod for state management
class Feedview extends ConsumerStatefulWidget {
  const Feedview({super.key});

  @override
  ConsumerState<Feedview> createState() => _Feedview();
}

class _Feedview extends ConsumerState<Feedview> {
  // Function to sign out the user using the AuthService provider
  Future<void> signOutTapped() async {
    await ref.read(authServiceProvider).signOut();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the authStateChangesProvider to get the current user reactively
    final userAsync = ref.watch(authStateChangesProvider);
    // Use the 'when' method to handle loading, error, and data states
    return userAsync.when(
      data: (user) {
        // Extract the display name or show 'Guest' if not signed in
        final displayName = user?.displayName ?? "Guest";
        return SingleChildScrollView(
          child: Column(
            children:[
              // Custom app bar with sign out button
              Padding(
                padding: const EdgeInsets.only(left:40 , right:10),
                child: appBar(signOutTapped: signOutTapped,)
              ),
              // Welcome message with user's display name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Welcome, $displayName'),
              ),
              // List of filters and posts
              FiltersList(),
              SignlePost(title: "My new Apple MacBook Pro M2 ", likes: "2.7",views: "14k", comments: "1.1k", date: "3 days ago" , image: "image"),
              SignlePost(title: "My new Apple MacBook Pro M2 ", likes: "2.7",views: "14k", comments: "1.1k", date: "3 days ago" , image: "image"),
              SignlePost(title: "My new Apple MacBook Pro M2 ", likes: "2.7",views: "14k", comments: "1.1k", date: "3 days ago" , image: "image"),
              SignlePost(title: "My new Apple MacBook Pro M2 ", likes: "2.7",views: "14k", comments: "1.1k", date: "3 days ago" , image: "image"),
              SignlePost(title: "My new Apple MacBook Pro M2 ", likes: "2.7",views: "14k", comments: "1.1k", date: "3 days ago" , image: "image"),
            ]
          ),
        );
      },
      // Show loading spinner while waiting for user data
      loading: () => Center(child: CircularProgressIndicator()),
      // Show error message if something goes wrong
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}