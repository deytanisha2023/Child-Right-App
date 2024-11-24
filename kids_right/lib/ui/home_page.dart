import 'package:flutter/material.dart';
import 'package:kids_right/interactive_story.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:kids_right/user_profile_page.dart';
import 'package:kids_right/games_page.dart';
import 'package:kids_right/blog_page.dart'; // Import the BlogPage

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _username = '';
  String _email = '';
  String _feedback = '';
  int _currentIndex = 0;
  final List<String> _imageUrls = [
    ('https://media.istockphoto.com/id/1310000093/vector/happy-childrens-day-kids-drawing-vector-illustration.jpg?s=612x612&w=0&k=20&c=o5ZolJVh5aTudxTfJLJUr9UTHkIeVE_0OQwkJioZuvg=')
  ];

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
    //_startImageSlider();
  }

  void _loadUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'User';
      _email = prefs.getString('email') ?? 'No Email';
      _feedback = prefs.getString('feedback') ?? 'No Feedback Submitted';
    });
  }

  /*void _startImageSlider() {
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentIndex < _imageUrls.length - 1) {
        setState(() {
          _currentIndex++;
        });
      } else {
        setState(() {
          _currentIndex = 0;
        });
      }
    });
  }*/

  void _saveFeedback(String feedback) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('feedback', feedback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 195, 216, 56),
                Colors.yellow,
                Color.fromARGB(255, 216, 202, 11),
                Color.fromARGB(255, 231, 157, 9)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal Scrolling Images Section
            Container(
              height: 300,
              margin: EdgeInsets.only(bottom: 20),
              child: PageView.builder(
                itemCount: _imageUrls.length,
                itemBuilder: (context, index) {
                  return _buildImageCard(_imageUrls[index]);
                },
              ),
            ),

            // About Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBA0617khbPuASjE2xCm5PLYtxvsf5tv-b_A&s', // Replace with your child-related logo
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About Children\'s Rights',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Children\'s rights are fundamental human rights that apply to all individuals under the age of 18. These rights aim to protect children from abuse and exploitation, ensure access to education and healthcare, and promote their overall well-being.',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Feedback Form
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 33, 8, 67).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                constraints: BoxConstraints(
                  maxWidth: 500,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Feedback Form',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 249, 68))),
                    SizedBox(height: 10),
                    _buildTextField('Username'),
                    SizedBox(height: 10),
                    _buildTextField('Email'),
                    SizedBox(height: 10),
                    _buildTextField('Message', maxLines: 4),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle feedback submission
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Feedback submitted')));
                      },
                      child: Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 141, 32, 104),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Contact Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Address: 1234 Main St, City, Country',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                          SizedBox(height: 10),
                          Text('Phone: +123 456 7890',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                          SizedBox(height: 10),
                          Text('Email: contact@yourapp.com',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    ),
                    Icon(Icons.contact_mail, size: 60, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _currentIndex == 0
                    ? Colors.red
                    : Color.fromARGB(255, 113, 92, 186)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video,
                color: _currentIndex == 1
                    ? Colors.yellow
                    : Color.fromARGB(255, 116, 183, 153)),
            label: 'Animation & Tutorial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad,
                color: _currentIndex == 2 ? Colors.green : Colors.grey),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book,
                color: _currentIndex == 3 ? Colors.blue : Colors.grey),
            label: 'Blog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _currentIndex == 4 ? Colors.purple : Colors.grey),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              // Navigate to Home Page
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              break;
            case 1:
              // Navigate to Animation & Tutorial Page
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InteractiveStory()));
              break;
            case 2:
              // Navigate to Games Page
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GamesPage()));
              break;
            case 3:
              // Navigate to Blog Page
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BlogPage()));
              break;
            case 4:
              // Navigate to Profile Page
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserProfilePage()));
              break;
          }
        },
      ),
    );
  }

  Widget _buildImageCard(String imageUrl) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent)),
        SizedBox(height: 5),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          onChanged: (value) {
            // Update feedback form state
            if (label == 'Username') {
              setState(() {
                _username = value;
              });
            } else if (label == 'Email') {
              setState(() {
                _email = value;
              });
            } else if (label == 'Message') {
              setState(() {
                _feedback = value;
              });
              _saveFeedback(value);
            }
          },
        ),
      ],
    );
  }
}
