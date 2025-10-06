 import 'package:quizzo/export.dart';
class AlbumView extends StatefulWidget {
  final String albumName;
  final List<String> albumGallery;
  const AlbumView({super.key, required this.albumName, required this.albumGallery});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  List<String> gallery=[
    AppImages.attendance,
    AppImages.reports,
    AppImages.billing,
    AppImages.calender,
    AppImages.gallery,
    AppImages.inventory,
    AppImages.live,
    AppImages.nursery,

  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));
    return  Scaffold(
      appBar: customAppBar(title: "Gallery → ${widget.albumName}"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
        child: Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            padding: EdgeInsets.zero,
            childAspectRatio: 183 / 120,
            physics: ScrollPhysics(),
            children: gallery.map((item) {
              return  ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(item,width: 105.w,height: 105.h,fit: BoxFit.cover,));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
