import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/movie_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Movie> _searchResults = [];
  int _selectedIndex = 1;
  final TextEditingController _searchController = TextEditingController();

  Future<void> searchMovies(String searchTerm) async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=$searchTerm'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      setState(() {
        _searchResults = jsonResponse.map((movie) => Movie.fromJson(movie)).toList();
      });
    }
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, '/home');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Movies'),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onSubmitted: searchMovies,
                style: TextStyle(color:Colors.red),
                decoration: InputDecoration(
                  hintText: 'Search movies...',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.search, color: Colors.red),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: _searchResults.isEmpty
                ? Center(child: Text('No results found'))
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      return MovieCard(movie: _searchResults[index]);
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
