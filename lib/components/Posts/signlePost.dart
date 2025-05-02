import 'package:flutter/material.dart';

class SignlePost extends StatelessWidget {
  final String title;
  final String likes;
  final String views;
  final String comments;
  final String date;
  // final String description; // Assuming this is the description of the post, not the image ur
  final String image; // Assuming this is an asset path or URL
  const SignlePost({super.key, required this.title, required this.likes, required this.comments,required this.views,required this.date ,required this.image});

  @override
  Widget build(BuildContext context) {
    // Remove the Scaffold. Return the actual content widget for the post.
    // Using a Card as an example container.
    return Card(
      elevation: 0,
      color: Colors.transparent,
      margin: const EdgeInsets.all(10.0), // Add some margin
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center, // Align text left
          children: [
            
             Container(
               height: 220,
               
               alignment: Alignment.topLeft,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black
               ),
               child: SizedBox(
                height: 200,
                width: 300,
                child: Column(children: [
                  const SizedBox(height:20),
                  Row(children: [
                    const SizedBox(width:10),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue
                    ),
                    // child: Image.asset(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("username", style: TextStyle(color: Colors.white),),
                  )
                ],)
                ],)
               )
             ),
            const SizedBox(height: 10),
             // Spacing
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge, // Use theme styles
            ),
            const SizedBox(height: 4), // Spacing
            Row(
              children: [
                SizedBox(width: 16), // Spacing from the left edg
                Icon(Icons.thumb_up, color: Colors.green), // Likes icon
                SizedBox(width: 4), // Spacing
                Text(likes), // Likes count
                SizedBox(width: 16), // Spacing
                Icon(Icons.remove_red_eye, color: Colors.blue), // Views icon
                SizedBox(width: 4), // Spacing
                Text(views), // Views count
                SizedBox(width: 16), // Spacing
                Icon(Icons.comment, color: Colors.grey), // Comments icon
                SizedBox(width: 4), // Spacing
                Text(comments), // Comments count
                SizedBox(width: 16), // Spacing
                Icon(Icons.calendar_today, color: Colors.grey), // Date icon
                SizedBox(width: 4), // Spacing
                Text(date), // Date
              ],
            )
          ],
        ),
      ),
      
    );
  }
}