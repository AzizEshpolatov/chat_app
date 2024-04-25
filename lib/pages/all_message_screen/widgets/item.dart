import 'package:flutter/material.dart';

import '../../../utils/app_size.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.title,
    required this.imgPath,
  });

  final String title;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(right: 16.w),
      width: 56.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.w),
              border: Border.all(
                width: 2.w,
                color: const Color(0xFFD84D4D),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.w),
              child: Image.network(
                imgPath,
                width: 48.w,
                height: 48.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          4.getH(),
          Text(
            textAlign: TextAlign.center,
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color(0xFF0F1828),
              fontSize: 10.w,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
