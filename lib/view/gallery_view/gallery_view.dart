import 'package:quizzo/export.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.white,
        systemNavigationBarColor: AppColors.white,
      ),
    );
    return Scaffold(
      appBar: customAppBar(title: "Gallery"),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(
            children: [
              Container(
                width: 390.w,
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.purple),
                ),
                child: Center(
                  child: customText(
                    text: " + Add New Album",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.purple,
                  ),
                ),
              ),
              verticalSpacer(20),
              customDivider(height: 1, width: 390, color: AppColors.forestGrey),
              verticalSpacer(20),
              albumCard(
                albumName: "New Year 2025",
                albumDate: "1, January, 2025",
                albumPictures: "4 Pictures",
                albumCoverPic:
                    "https://plus.unsplash.com/premium_vector-1697729804286-7dd6c1a04597?q=80&w=1370&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                privacySetting: "Public",
              ),
              albumCard(
                albumName: "Parents Meeting",
                albumDate: "1, January, 2025",
                albumPictures: "4 Pictures",
                albumCoverPic:
                    "https://plus.unsplash.com/premium_vector-1744658398805-83f76da16c18?q=80&w=415&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                privacySetting: "Public",
              ),
              albumCard(
                albumName: "Ramadan Kareem",
                albumDate: "1, January, 2025",
                albumPictures: "4 Pictures",
                albumCoverPic:
                    "https://images.unsplash.com/vector-1738323259141-18a69b6c1ba3?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                privacySetting: "Public",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
