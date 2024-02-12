import 'package:databasesample/db/functions/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
late Database _db;

Future<void> initalizeDataBase() async {
  _db = await openDatabase(
    'student.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE student(id INTEGER PRIMARYKEY,name TEXT,age TEXT)');
    },
  );
}

Future<void> addStudent(StudentModel value) async {
  await _db.rawInsert(
    'INSERT INTO student (name,age) VALUES(?,?)',
    [value.name, value.age],
  );
  getAllStudents();
}


Future<void> getAllStudents() async {
  final _values = await _db.rawQuery('SELECT * FROM student');
  print(_values);
  studentListNotifier.value.clear();
  _values.forEach((map) {
    final student = StudentModel.fromMap(map);
    studentListNotifier.value.add(student);
  });
  studentListNotifier.notifyListeners();
}
Future<void> deleteStudent(int id) async {
  getAllStudents();
}
