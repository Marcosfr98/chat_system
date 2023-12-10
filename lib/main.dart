import "package:chat_system/View/login.dart";
import "package:chat_system/firebase_options.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.42857142857, 731.42857142857),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              systemOverlayStyle: const SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.teal,
                systemNavigationBarIconBrightness: Brightness.light,
              ),
              backgroundColor: Colors.teal,
              toolbarHeight: 55.h,
              foregroundColor: Colors.white,
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
              ),
              iconTheme: IconThemeData(
                size: 20.r,
                color: Colors.white,
              ),
            ),
            textTheme: TextTheme(
              bodyLarge: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.teal),
                textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 18.sp),
                ),
                shape: MaterialStateProperty.all(
                  const StadiumBorder(),
                ),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                  Size.fromHeight(50.h),
                ),
                shape: MaterialStateProperty.all(
                  const StadiumBorder(),
                ),
              ),
            ),
            fontFamily: "Poppins",
            inputDecorationTheme: InputDecorationTheme(
              fillColor: const Color(0xFFEFEFEF),
              filled: true,
              labelStyle: TextStyle(
                fontSize: 18.sp,
              ),
              hintStyle: TextStyle(
                fontSize: 18.sp,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const Login(),
        );
      },
    );
  }
}
