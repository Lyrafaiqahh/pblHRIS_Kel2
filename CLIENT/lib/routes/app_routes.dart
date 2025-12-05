import 'package:go_router/go_router.dart';
import '../features/home/screens/home_screen.dart';
import '../features/letter/screens/letter_list_screen.dart';
import '../features/letter/screens/letter_create_screen.dart';
import '../features/letter/screens/letter_detail_screen.dart';

// IMPORT APPROVAL
import '../features/approval/screens/approval_list_screen.dart';
import '../features/approval/screens/approval_detail_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/letters',
      builder: (context, state) => const LettersListScreen(),
    ),
    GoRoute(
      path: '/letter/create',
      builder: (context, state) {
        final extra = state.extra;
        return LetterCreateScreen(jenisSurat: extra);
      },
    ),
    GoRoute(
      path: '/letter/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return LetterDetailScreen(id: id);
      },
    ),




 // LIST APPROVAL (Admin melihat semua pengajuan)
    GoRoute(
      path: '/approval',
      builder: (context, state) => const ApprovalListScreen(),
    ),

    // DETAIL APPROVAL (Admin membuka salah satu pengajuan)
    GoRoute(
      path: '/approval/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ApprovalDetailScreen(id: id);
      },
    ),


  ],
);
