import 'package:flutter/material.dart';

void main() {
  runApp(WordAnalyzerApp());
}

class WordAnalyzerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Analyzer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WordAnalyzerPage(),
    );
  }
}

class WordAnalyzerPage extends StatefulWidget {
  @override
  _WordAnalyzerPageState createState() => _WordAnalyzerPageState();
}

class _WordAnalyzerPageState extends State<WordAnalyzerPage> {
  String inputWord = '';
  int vowelCount = 0;
  int consonantCount = 0;
  int letterCount = 0;
  bool isPalindrome = false;

  void analyzeWord() {
    // Reset the analysis values
    vowelCount = 0;
    consonantCount = 0;
    letterCount = 0;
    isPalindrome = false;

    // Convert the word into an array of characters
    List<String> characters = inputWord.split('');

    // Analyze each character
    for (String character in characters) {
      if (character.toLowerCase().contains(RegExp('[aeiou]'))) {
        vowelCount++;
      } else {
        consonantCount++;
      }
    }

    // Calculate the number of letters
    letterCount = characters.length;

    // Check if the word is a palindrome
    String reversedWord = characters.reversed.join('');
    if (inputWord.toLowerCase() == reversedWord.toLowerCase()) {
      isPalindrome = true;
    }

    // Update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Analyzer'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                inputWord = value;
              },
              decoration: InputDecoration(
                labelText: 'Enter a word',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: analyzeWord,
              child: Text('Analyze'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Word: $inputWord',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'No of Consonants: $consonantCount',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'No of Vowels: $vowelCount',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'No of Characters: $letterCount',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Palindrome: ${isPalindrome ? 'Yes' : 'No'}',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
