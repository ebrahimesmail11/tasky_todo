import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/core/widgets/my_custom_cached_network_image.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.white,
        height: 96.h,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: MyCustomCahedNetworkImage(
                taskImage: '',
                height: 64.h,
                width: 64.w,
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpace(14),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Grocery Shopping App',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 9.w, vertical: 5.h),
                            decoration: BoxDecoration(
                              //   color
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Text(
                              'Waiting',
                             
                              style: TextStyles.font12RedMedium.copyWith(
                                  //  color
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'This application is designed for super shops. By using \nthis application they can enlist all their products in one \nplace and can deliver. Customers will get a one-stop \nsolution for their daily shopping.',
                  
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        '',
                       
                        height: 16.h,
                        width: 16.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Medium',
                     
                        style: TextStyles.font12MainPurpleMedium.copyWith(
                          fontSize: 14.sp,
                          //color
                          
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '30/12/2022',

                        style: TextStyles.font12GrayRegular,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.more_vert,
              size: 25.h,
            ),
          ],
        ),
      ),
    );
  }
}
