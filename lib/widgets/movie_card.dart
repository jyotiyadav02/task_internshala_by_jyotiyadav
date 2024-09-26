// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// // // import '../models/movie.dart';

// // // class MovieCard extends StatelessWidget {
// // //   final Movie movie;

// // //   MovieCard({required this.movie});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Card(
// // //       margin: EdgeInsets.all(8.0),
// // //       child: InkWell(
// // //         onTap: () {
// // //           Navigator.of(context).pushNamed('/details', arguments: movie);
// // //         },
// // //         child: Row(
// // //           children: [
// // //             Image.network(
// // //               movie.imageUrl,
// // //               width: 100,
// // //               height: 150,
// // //               fit: BoxFit.cover,
// // //             ),
// // //             Expanded(
// // //               child: Padding(
// // //                 padding: const EdgeInsets.all(8.0),
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Text(
// // //                       movie.title,
// // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //                     ),
// // //                     SizedBox(height: 8),
// // //                     RatingBarIndicator(
// // //                       rating: movie.rating / 2, // Assuming the rating is out of 10
// // //                       itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
// // //                       itemCount: 5,
// // //                       itemSize: 20.0,
// // //                     ),
// // //                     SizedBox(height: 8),
// // //                     Text(
// // //                       movie.summary,
// // //                       maxLines: 3,
// // //                       overflow: TextOverflow.ellipsis,
// // //                       style: TextStyle(color: Colors.white70),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// // import '../models/movie.dart';

// // class MovieCard extends StatelessWidget {
// //   final Movie movie;

// //   MovieCard({required this.movie});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       margin: EdgeInsets.all(8.0),
// //       child: InkWell(
// //         onTap: () {
// //           Navigator.of(context).pushNamed('/details', arguments: movie);
// //         },
// //         child: Row(
// //           children: [
// //             Image.network(
// //               movie.imageUrl,
// //               width: 100,
// //               height: 150,
// //               fit: BoxFit.cover,
// //             ),
// //             Expanded(
// //               child: Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       movie.title,
// //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                     ),
// //                     SizedBox(height: 8),
// //                     RatingBarIndicator(
// //                       rating: movie.rating / 2, // Assuming the rating is out of 10
// //                       itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
// //                       itemCount: 5,
// //                       itemSize: 20.0,
// //                     ),
// //                     SizedBox(height: 8),
// //                     Text(
// //                       _stripHtml(movie.summary),
// //                       maxLines: 3,
// //                       overflow: TextOverflow.ellipsis,
// //                       style: TextStyle(color: Colors.white70),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // Utility function to strip HTML tags from the summary
// //   String _stripHtml(String htmlString) {
// //     RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
// //     return htmlString.replaceAll(exp, '').trim(); // Removes HTML tags and trims whitespace
// //   }
// // }


// // movie_card.dart
// import 'package:flutter/material.dart';
// import '../models/movie.dart';
// import '../screens/details_screen.dart';

// class MovieCard extends StatelessWidget {
//   final Movie movie;

//   MovieCard({required this.movie});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).pushNamed(
//           '/details',
//           arguments: movie,
//         );
//       },
//       child: Card(
//         color: Colors.black54,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(movie.imageUrl, fit: BoxFit.cover),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 movie.title,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color:Colors.black12,
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/details', arguments: movie);
        },
        child: Row(
          children: [
            Image.network(
              movie.imageUrl,
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    RatingBarIndicator(
                      rating: movie.rating / 2, // Assuming the rating is out of 10
                      itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
                      itemCount: 5,
                      itemSize: 20.0,
                    ),
                    SizedBox(height: 8),
                    Text(
                      _stripHtml(movie.summary),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Utility function to strip HTML tags from the summary
  String _stripHtml(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '').trim(); // Removes HTML tags and trims whitespace
  }
}