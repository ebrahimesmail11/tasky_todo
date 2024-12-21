import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_todo/core/helpers/images_manger.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/features/addtask/logic/upload/upload_image_cubit.dart';

class EditTaskImageButton extends StatelessWidget {
  const EditTaskImageButton({required this.imageUrl, super.key});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم رفع الصورة بنجاح!')),
          ),
          failure: (error) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error)),
          ),
        );
      },
      builder: (context, state) {
        final uploadImageCubit = context.read<UploadImageCubit>();
        // final imageUrl = uploadImageCubit.getimageUrl;
        return state.maybeWhen(loading: () {
          return Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 15.h),
            child: GestureDetector(
              onTap: () {},
              child: DottedBorder(
                radius: const Radius.circular(10),
                color: ColorsManager.mainColor,
                borderType: BorderType.RRect,
                child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 100.w, vertical: 12.h),
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.mainColor,
                      ),
                    )),
              ),
            ),
          );
        }, orElse: () {
          return Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 15.h),
            child: GestureDetector(
              onTap: () async {
                await uploadImageCubit.uploadImage();
              },
              child: Stack(
                children: [
                  DottedBorder(
                    radius: const Radius.circular(10),
                    color: ColorsManager.mainColor,
                    borderType: BorderType.RRect,
                    child: Container(
                      margin: EdgeInsets.zero,
                      height: 90.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(
                            uploadImageCubit.getimageUrl.isEmpty
                                ? imageUrl
                                : uploadImageCubit.getimageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  if (uploadImageCubit.getimageUrl.isEmpty)
                    Positioned(
                      height: 90.h,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(IconsManager.addPhoto),
                          horizontalSpace(10),
                          Text(
                            'Add Img',
                            style: TextStyles.font19purplemedium,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
