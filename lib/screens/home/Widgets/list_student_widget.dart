import 'package:databasesample/db/functions/db_functions.dart';
import 'package:databasesample/db/functions/model/data_model.dart';
import 'package:flutter/material.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<StudentModel>>(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            return ListTile(
              title: Text(data.name),
              subtitle: Text(data.age.toString()),
              trailing: IconButton(onPressed: (){
                if(data.id !=  null){
                  deleteStudent(data.id!);
                }else{
                  print("Student id is null. unable to delete");
                }
              }, icon:const  Icon(Icons.delete),color: Colors.red,), // Assuming age is an int
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      },
    );
  }
}
