import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeWidget extends StatelessWidget {
  const QrCodeWidget({required this.taskId ,super.key});
final String taskId;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 22.h),
        child: SizedBox(
          height: 280.h,
          width: 280.w,
          child: PrettyQrView.data(
            data: taskId,
          ),
        ),
      ),
    );
  }
}