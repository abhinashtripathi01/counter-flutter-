import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> todos = [
    {'title': 'electricity', 'completed': false, 'favourite': true},
    {'title': 'Call', 'completed': false, 'favourite': true},
    {'title': 'Visit', 'completed': false, 'favourite': false},
    {'title': 'Buy sweets', 'completed': true, 'favourite': true},
  ];

  String filter = 'All';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredTodos = todos.where((todo) {
      if (filter == 'All') return true;
      if (filter == 'Active') return !todo['completed'];
      if (filter == 'Favourite') return todo['favourite'];
      if (filter == 'Done') return todo['completed'];
      return true;
    }).toList();

    int completedTasks = todos.where((todo) => todo['completed']).length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Manage your\nTodos in your elegant\nTodopad',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'What do you want to do?',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$completedTasks of ${todos.length} tasks completed',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterChip('All', filter == 'All'),
                _buildFilterChip('Active', filter == 'Active'),
                _buildFilterChip('Favourite', filter == 'Favourite'),
                _buildFilterChip('Done', filter == 'Done'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTodos.length,
              itemBuilder: (context, index) {
                final todo = filteredTodos[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  child: ListTile(
                    leading: Checkbox(
                      value: todo['completed'],
                      onChanged: (bool? value) {
                        setState(() {
                          todo['completed'] = value!;
                        });
                      },
                    ),
                    title: Text(todo['title']),
                    trailing: IconButton(
                      icon: Icon(
                        todo['favourite'] ? Icons.star : Icons.star_border,
                        color: todo['favourite'] ? Colors.amber : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          todo['favourite'] = !todo['favourite'];
                        });
                      },
                    ),
                    tileColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool value) {
        setState(() {
          filter = label;
        });
      },
      selectedColor: Colors.green,
      backgroundColor: Colors.grey.shade200,
    );
  }
}
