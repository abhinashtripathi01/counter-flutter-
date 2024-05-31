import 'package:counter/model/student.dart';
import 'package:counter/view%20model/student_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentView extends ConsumerStatefulWidget {
  const StudentView({super.key});

  @override
  ConsumerState<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends ConsumerState<StudentView> {
  final _gap = const SizedBox(height: 8);
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // listen for the state
    final studentState = ref.watch(studentViewModelProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Student View"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _fnameController,
                decoration: const InputDecoration(
                  hintText: "enter your fname",
                ),
              ),
              _gap,
              TextFormField(
                controller: _lnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your lname",
                ),
              ),
              _gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Student student = Student(
                        fname: _fnameController.text,
                        lname: _lnameController.text);

                    ref
                        .read(studentViewModelProvider.notifier)
                        .addStudent(student);
                  },
                  child: const Text('Add Student'),
                ),
              ),
              _gap,
              studentState.isLoading
                  ? const CircularProgressIndicator()
                  : studentState.lstStudents.isEmpty
                      ? Text('No Data')
                      :

                      //Show List view
                      Expanded(
                          child: ListView.builder(
                          itemCount: studentState.lstStudents.length,
                          itemBuilder: (context, index) {
                            final student = studentState.lstStudents[index];
                            return ListTile(
                              title: Text(student.fname),
                              subtitle: Text(student.lname),
                            );
                          },
                        ))
            ],
          ),
        ));
  }
}
