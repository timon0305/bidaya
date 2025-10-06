import 'export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await Supabase.initialize(
    url: 'https://qdhwcuqtnerlxdhllidu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFkaHdjdXF0bmVybHhkaGxsaWR1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU4MDM2NDEsImV4cCI6MjA2MTM3OTY0MX0.NlZGuYsMwn6vqeuSG0tjgOvsoe0QU21bn09eX6vghBI',
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: RegisterAllProviders.allProvidersList,
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        designSize: Size(430, 932),
        child: GetMaterialApp(
          title: 'quizzo',
          initialBinding: AppBindings(),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          getPages: AppRoutes.routes,
        ),
      ),
    );
  }
}
