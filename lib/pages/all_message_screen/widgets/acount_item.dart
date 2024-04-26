import 'package:chat_app/data/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../data/repo/repo.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_img.dart';
import '../../../utils/app_size.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({super.key, required this.contactModel});

  final ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: SizedBox(
        height: 56.h,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            4.getW(),
            Stack(
              children: [
                SizedBox(width: 52.w, height: 52.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.w),
                  child: Image.network(
                    contactModel.imageUrl,
                    height: 48.h,
                    width: 48.w,
                    fit: BoxFit.cover,
                  ),
                ),
                contactModel.isOnline
                    ? Positioned(
                        right: 0,
                        top: -2,
                        child: Container(
                          height: 15.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.w,
                              color: Colors.white,
                            ),
                            shape: BoxShape.circle,
                            color: AppColors.c2CC069,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            12.getW(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${contactModel.contactName} ${contactModel.contactLasName}",
                  style: TextStyle(
                    fontSize: 14.w,
                    color: AppColors.c0f,
                  ),
                ),
                2.getH(),
                SizedBox(
                  width: 215.w,
                  height: 17.h,
                  child: Text(
                    allMessages[contactModel.contactId-1].messageText,
                    style: TextStyle(
                      fontSize: 11.w,
                      color: AppColors.cADB5BD,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${contactModel.lastOnlineTime.toString().substring(5, 10)} am",
                  style: TextStyle(
                    fontSize: 10.w,
                    color: AppColors.ca4,
                  ),
                ),
                6.getH(),
                allMessages[contactModel.contactId-1].status
                    ? SvgPicture.asset(
                        AppImages.correct,
                        height: 12.h,
                      )
                    : Container(
                        height: 20.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.cD84D4D1F.withOpacity(.5),
                        ),
                        child: Center(
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 10.w,
                              color: AppColors.cD84D4D1F,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
