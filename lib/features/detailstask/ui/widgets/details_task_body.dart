import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/core/widgets/my_custom_cached_network_image.dart';
import 'package:tasky_todo/features/detailstask/data/models/details_task_response.dart';
import 'package:tasky_todo/features/detailstask/ui/widgets/color_chanaging_status_container.dart';
import 'package:tasky_todo/features/detailstask/ui/widgets/color_changing_priority_container.dart';
import 'package:tasky_todo/features/detailstask/ui/widgets/end_data_containrt.dart';
import 'package:tasky_todo/features/detailstask/ui/widgets/qr_code_widget.dart';

class DetailsTaskBody extends StatelessWidget {
  const DetailsTaskBody({
    required this.detailsTask,
    super.key,
  });
final DetailsTaskResponse detailsTask;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyCustomCahedNetworkImage(
          taskImage: detailsTask.image,
          height: 225.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        verticalSpace(16.h),
       Padding(
         padding:  EdgeInsets.symmetric(horizontal: 22.w),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
            detailsTask.title,
            style: TextStyles.font24BlackBold,
          ),
          verticalSpace(8.h),
          Text(
           detailsTask.desc,
            style: TextStyles.font12GrayMedium.copyWith(fontSize: 14),
          ),
          verticalSpace(16.h),
          const EndDataContainer(),
          verticalSpace(8.h),
                ColorChanagingStatusContainer(status:detailsTask.status  ,),
                verticalSpace(8.h),
                ColorChangingPriorityContainer(
                    priority:detailsTask.priority ,),
                    QrCodeWidget(taskId: detailsTask.id,),
          ],
         ),
       )
      ],
    );
  }
}