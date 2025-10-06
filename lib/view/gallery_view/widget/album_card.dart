import 'package:quizzo/export.dart';
import 'package:flutter/cupertino.dart';



Widget albumCard({
  required String albumName,
  required String albumDate,
  required String albumPictures,
  required String albumCoverPic,
  required String privacySetting,
}) {
  return GestureDetector(
    onTap: (){
      Get.to(()=>AlbumView(albumName: albumName, albumGallery: []));

    },
    child: Padding(
      padding:  EdgeInsets.only(bottom: 16.h),
      child: Container(
        height: 120.h,
        padding:  EdgeInsets.symmetric(vertical: 0.h, horizontal: 0.w),
        decoration: BoxDecoration(
          color: AppColors.white,

          border: Border.all(color: AppColors.lightestGreyShade),
          borderRadius: BorderRadius.circular(16),

        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                albumCoverPic,
                width: 140.w,
                height: 120.h,
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpacer(10),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    customText(
                        text: albumName , fontWeight: FontWeight.w700,
                        fontSize: 18, color: AppColors.blackShade
                    ),
                    verticalSpacer(6),
                    Row(
                      children: [
                        customText(
                            text: albumDate , fontWeight: FontWeight.w500,
                            fontSize: 10, color: AppColors.sand.withOpacity(0.90)
                        ),
                        horizontalSpacer(8),
                        customText(
                            text: "•  $albumPictures" , fontWeight: FontWeight.w400,
                            fontSize: 10, color: AppColors.sand.withOpacity(0.90)
                        ),

                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.parent, color: AppColors.forestGrey,
                          height: 16.h,
                          width: 16.w,
                        ),
                        horizontalSpacer(4),
                        customText(
                            text: privacySetting , fontWeight: FontWeight.w500,
                            fontSize: 12, color: AppColors.blackShade.withOpacity(0.90)
                        ),
                      ],
                    ),



                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height:32.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        color: AppColors.redShade,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(child: SvgPicture.asset(AppImages.delete,height: 24.h,width: 24.w,fit: BoxFit.cover,))),
                Spacer(),
                  Container(
                    height:32.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        color: AppColors.freshBlue.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(child: SvgPicture.asset(AppImages.edit,height: 20.h,width: 20.w,fit: BoxFit.cover,))),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
