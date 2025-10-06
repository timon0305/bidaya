import 'package:quizzo/export.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthViewModel>();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Consumer<DashboardViewModel>(
            builder: (context, dashboardVM, _) {
              return Column(
                children: [
                  verticalSpacer(20),
                  dashboardHeader(
                    context,
                    name: "Menna!",
                    subtitle: "Wonderful Kids Nursery",
                    avatar: AppImages.avatarPng,
                    onAvatarTap: () {
                      Get.toNamed(AppRoutes.notification);
                    },
                    showOnlineDot: true,
                    avatarSize: 70,
                  ),
                  verticalSpacer(20),
                  Divider(
                    height: 1.w,
                    thickness: 1.w,
                    color: AppColors.lightestGreyShade,
                  ),
                  verticalSpacer(20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          dashboardTopSection(context, auth),
                          verticalSpacer(16),
                          bidiyaFeatureCards(context, auth, dashboardVM),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
