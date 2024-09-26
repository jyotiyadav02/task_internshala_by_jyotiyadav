// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import '../models/movie.dart';
// // import '../widgets/movie_card.dart';

// // class HomeScreen extends StatefulWidget {
// //   @override
// //   _HomeScreenState createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   late Future<List<Movie>> _movies;

// //   Future<List<Movie>> fetchMovies() async {
// //     final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));

// //     if (response.statusCode == 200) {
// //       List jsonResponse = json.decode(response.body);
// //       return jsonResponse.map((movie) => Movie.fromJson(movie)).toList();
// //     } else {
// //       throw Exception('Failed to load movies');
// //     }
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _movies = fetchMovies();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Movies'),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.search),
// //             onPressed: () {
// //               Navigator.of(context).pushNamed('/search');
// //             },
// //           ),
// //         ],
// //       ),
// //       body: FutureBuilder<List<Movie>>(
// //         future: _movies,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else {
// //             return ListView.builder(
// //               itemCount: snapshot.data!.length,
// //               itemBuilder: (context, index) {
// //                 return MovieCard(movie: snapshot.data![index]);
// //               },
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/movie.dart';
// import '../widgets/movie_card.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<Movie>> _movies;

//   Future<List<Movie>> fetchMovies() async {
//     final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));

//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((movie) => Movie.fromJson(movie)).toList();
//     } else {
//       throw Exception('Failed to load movies');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _movies = fetchMovies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[900],  // Dark background for a modern look
//       appBar: AppBar(
//         title: Text(
//           'Movies',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.red,  // Bold color for AppBar
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.white),
//             onPressed: () {
//               Navigator.of(context).pushNamed('/search');
//             },
//           ),
//         ],
//       ),
//       body: FutureBuilder<List<Movie>>(
//         future: _movies,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)));
//           } else {
//             return Padding(
//               padding: const EdgeInsets.all(10.0),  // Add padding around the list
//               child: ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   // Stripping HTML tags from the summary
//                   final movie = snapshot.data![index];
//                   movie.summary = _stripHtmlTags(movie.summary);
                  
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 12.0),  // Add space between movie cards
//                     child: MovieCard(movie: movie),
//                   );
//                 },
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }

//   // Utility function to remove HTML tags from the summary
//   String _stripHtmlTags(String htmlText) {
//     RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
//     return htmlText.replaceAll(exp, '');
//   }
// }


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';
import '../widgets/movie_card.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> _movies;
  int _selectedIndex = 0;

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  void initState() {
    super.initState();
    _movies = fetchMovies();
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.pushNamed(context, '/search');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Movies', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.red,
         actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushNamed('/search');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Movie>>(
        future: _movies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final movie = snapshot.data![index];
                movie.summary = _stripHtmlTags(movie.summary);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MovieCard(movie: movie),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  String _stripHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
}
