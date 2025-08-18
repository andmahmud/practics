import 'package:get/get_navigation/src/routes/get_route.dart';
import '../features/auth/Presentation/screen/forgot_password_screen/create_new_password_screen.dart';
import '../features/auth/Presentation/screen/forgot_password_screen/forgot_password_screen.dart';
import '../features/auth/Presentation/screen/forgot_password_screen/forgot_verify_code_screen.dart';
import '../features/auth/Presentation/screen/login_screen/login_screen.dart';
import '../features/auth/Presentation/screen/sign_up_screen/sign_up_screen.dart';
import '../features/auth/Presentation/screen/sign_up_screen/verify_code_screen.dart';
import '../features/nav_bar/presentation/screen/nav_bar.dart';
import '../features/splash/presentation/screen/splash_screen.dart';

class AppRoute {
  static String init = "/";
  static String splashScreen = "/splashScreen";
  static String navBar = "/navBar";
  static String loginScreen = "/loginScreen";
  static String signUpScreen = "/signUpScreen";
  static String verifyCodeScreen = "/verifyCodeScreen";
  static String forgetPasswordScreen = "/forgetPasswordScreen";
  static String forgotVerifyCodeScreen = "/forgotVerifyCodeScreen";
  static String createNewPasswordScreen = "/createNewPasswordScreen";
  static String profilescreen = "/profilescreen";
  static String profileViewScreen = "/profileViewScreen";
  static String notificationScreen = "/notificationScreen";
  static String searchScreen = "/searchScreen";
  static String friendRequestScreen = "/friendRequestScreen";
  static String messageScreen = "/messageScreen";
  static String viewFullPostScreen = "/ViewFullPostScreen";

  static List<GetPage> routes = [
    GetPage(name: init, page: () => const SplashScreen()),
    GetPage(name: navBar, page: () => NavBar()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: verifyCodeScreen, page: () => VerifyCodeScreen()),
    GetPage(name: forgetPasswordScreen, page: () => ForgetPasswordScreen()),
    GetPage(name: forgotVerifyCodeScreen, page: () => ForgotVerifyCodeScreen()),
    GetPage(
      name: createNewPasswordScreen,
      page: () => CreateNewPasswordScreen(),
    ),
  ];
}
