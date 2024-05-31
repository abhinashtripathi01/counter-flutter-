import 'package:counter/model/student.dart';

class StudentState {
  final List<Student> lstStudents;
  final bool isLoading;
  // cons
  StudentState({
    required this.lstStudents,
    required this.isLoading,
  });
// another const
  factory StudentState.intial() {
    return StudentState(lstStudents: [], isLoading: false);
  }

  StudentState copyWith({Student? student, bool? isLoading}) {
    return StudentState(
      lstStudents: student != null ? [...lstStudents, student] : lstStudents,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
