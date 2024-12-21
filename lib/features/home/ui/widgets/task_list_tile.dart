import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/helpers/utils.dart';
import 'package:tasky_todo/core/routing/routes.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/core/widgets/my_custom_cached_network_image.dart';
import 'package:tasky_todo/features/home/data/models/todos_response.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({required this.todo, super.key});
  final TodosResponse todo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.detailsTaskScreen,
          arguments: todo.id,
        );
      },
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
                taskImage: todo.image ?? '',
                height: 64.h,
                width: 64.w,
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpace(14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            capitalizeFirstLetter(
                              todo.title ?? '',
                            ),
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
                                color: getRightStatusContainerColor(todo.status ?? ''),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: FittedBox(
                              child: Text(
                                textAlign: TextAlign.center,
                                capitalizeFirstLetter(
                                  todo.status ?? '',
                                ),
                                style: TextStyles.font12RedMedium.copyWith(
                                      color: getRightStatusTextColor(todo.status??'')
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Flexible(
                    child: Text(
                       capitalizeFirstLetter(
                                todo.desc??'',
                              ),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        getFlagImage(todo.priority ?? ''),
                        height: 16.h,
                        width: 16.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        capitalizeFirstLetter(todo.priority??''),
                        style: TextStyles.font12MainPurpleMedium.copyWith(
                          fontSize: 14.sp,
                          color: getFlagTextColor(todo.priority??''),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        convertTimestampToDate(todo.createdAt??''),
                        style: TextStyles.font12GrayRegular,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            8.horizontalSpace,
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
