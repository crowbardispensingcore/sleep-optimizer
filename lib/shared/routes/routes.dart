import 'package:go_router/go_router.dart';
import 'package:sleep_optimizer/models/sleep_record_model.dart';
import 'package:sleep_optimizer/pages/home_page.dart';
import 'package:sleep_optimizer/pages/onboarding_page.dart';
import 'package:sleep_optimizer/pages/save_tracking_page.dart';
import 'package:sleep_optimizer/pages/set_wake_up_time_page.dart';
import 'package:sleep_optimizer/pages/sleep_record_page.dart';
import 'package:sleep_optimizer/pages/stats_page/stats_page.dart';
import 'package:sleep_optimizer/pages/tracking_page.dart';

bool isFirstLaunch = true;

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      redirect: (context, state) {
        if (isFirstLaunch) {
          isFirstLaunch = false;
          return '/first-launch-setup';
          // return '/records';
          // return '/set-wake-up-time';
        }
      },
    ),
    GoRoute(
      path: '/first-launch-setup',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/set-wake-up-time',
      builder: (context, state) => const SetWakeUpTimePage(),
    ),
    GoRoute(
      path: '/tracking',
      builder: (context, state) => const TrackingPage(),
    ),
    GoRoute(
      path: '/save-tracking',
      builder: (context, state) => const SaveTrackingPage(),
    ),
    GoRoute(
      path: '/stats',
      builder: (context, state) => const StatsPage(),
    ),
    GoRoute(
      path: '/records',
      builder: (context, state) => const SleepRecordPage(),
    )
  ],
  // errorBuilder:(context, state) => const HomePage(),
);
