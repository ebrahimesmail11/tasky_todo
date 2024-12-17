import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/theming/colors.dart';

class AddTaskFloatingActionButton extends StatelessWidget {
  const AddTaskFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 64.w,
      height: 64.h,
      child: FloatingActionButton(
       heroTag: 'tag_add',
        onPressed: (){},
        backgroundColor: ColorsManager.mainColor,
        shape:const  CircleBorder(),
        child: Icon(
          Icons.add,  
          size: 30.sp,
          color: Colors.white,),
        ),
    );
  }
}
