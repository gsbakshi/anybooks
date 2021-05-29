import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/books.dart';
import '../util/home_sections_list.dart';
import '../util/explore_sections_list.dart';

class BooksProvider extends ChangeNotifier {
  List<Map<String, Object>> _homeSections = [];

  List<Map<String, Object>> _genres = [];

  List<Map<String, Object>> get sections {
    _homeSections = homeSections;
    return [..._homeSections];
  }

  List<Map<String, Object>> get genres {
    _genres = exploreSections;
    return [..._genres];
  }

  Map<String, Object> findSectionById(String id) {
    return _homeSections.firstWhere((section) => section['id'] == id);
  }

  Map<String, Object> findGenresById(String id) {
    return _genres.firstWhere((section) => section['id'] == id);
  }

  List<Book> _books = [];
  List<VolumeInfo> _volume = [];

  List<Book> get books {
    return [..._books];
  }

  List<Book> get favoriteBooks {
    return _books.where((book) => book.isFavorite).toList();
  }

  Book findBookById(String id) {
    return _books.firstWhere((book) => book.id == id);
  }

  List<VolumeInfo> get volume {
    return [..._volume];
  }

  VolumeInfo findVolumeByTitle(String title) {
    return _volume.firstWhere((book) => book.title == title);
  }

  Future<void> fetchBooks(String query, {int maxResults = 10}) async {
    assert(query.isNotEmpty);
    var url = 'https://www.googleapis.com/books/v1/volumes?q=' +
        '${query.trim().replaceAll(' ', '+')}' +
        '&maxResults=$maxResults';
    try {
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body) as Map<String, dynamic>;
      if (data == null) {
        return;
      }
      final List<Book> loadedBooks = [];
      data.forEach((bookId, bookData) {
        loadedBooks.insert(
            0,
            Book(
              id: bookId,
              selfLink: bookData['selfLink'],
              volumeInfo: bookData['volumeInfo'],
            ));
      });
      _books = loadedBooks;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> queryBook(String url, String id) async {
    try {
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body) as Map<String, dynamic>;
      if (data == null) {
        return;
      }
      final List<VolumeInfo> loadedBook = [];
      data.forEach((id, bookData) {
        loadedBook.insert(
            0,
            VolumeInfo(
              title: bookData['title'],
              authors: bookData['authors'],
              description: bookData['description'],
            ));
      });
      _volume = loadedBook;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
