import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_project/providers/data_provider.dart';
import 'package:template_project/providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final dataProvider = Provider.of<DataProvider>(context);

    userProvider.loadUsers();
    dataProvider.loadCategories();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.0),
            Text(
              'Hello, ${userProvider.name}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 150.0,
              width: double.infinity,
              color: Colors.grey[300],
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 100.0,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Keep Moving Up',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do',
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('See All'),
                ),
              ],
            ),
            if (dataProvider.categories.isEmpty)
              Center(
                child: CircularProgressIndicator(),
              )
            else
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: dataProvider.categories
                    .map((category) => _categoryChip(category))
                    .toList(),
              ),
            SizedBox(height: 20.0),
            Text(
              'Top Courses',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _coursePlaceholder(),
                _coursePlaceholder(),
                _coursePlaceholder(),
                _coursePlaceholder(),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
      //     BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //   ],
      // ),
    );
  }

  Widget _categoryChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[300],
    );
  }

  Widget _coursePlaceholder() {
    return Container(
      height: 100.0,
      width: 70.0,
      color: Colors.grey[300],
      child: Icon(
        Icons.image,
        size: 50.0,
        color: Colors.grey[700],
      ),
    );
  }
}