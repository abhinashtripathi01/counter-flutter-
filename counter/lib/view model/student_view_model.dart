// import 'package:counter/model/student.dart';
// import 'package:counter/state/student_state.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final studentViewModelProvider =
//     StateNotifierProvider<StudentViewModel, StudentState>(
//         (ref) => StudentViewModel());

// class StudentViewModel extends StateNotifier<StudentState> {
//   StudentViewModel() : super(StudentState.intial());

//   void addStudent(Student student) async{
//     state = state.copyWith(isLoading: true);
//     //wait for 2 sec and updart ther student list
//     await Future.delayed(const Duration(seconds:2));
//     state = state.copyWith(isLoading: false, student : student);
//   }
// }