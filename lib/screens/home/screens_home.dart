import 'package:databasesample/db/functions/db_functions.dart';
import 'package:databasesample/screens/home/Widgets/add_student_widget.dart';
import 'package:databasesample/screens/home/Widgets/list_student_widget.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AddStudentWidget(),
            const Expanded(child: ListStudentWidget())
          ],
        ),
      ),
    );
  }
}
