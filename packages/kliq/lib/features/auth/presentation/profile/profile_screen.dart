import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import 'package:kliq/app/widgets/kliq_dialog.dart';
import 'package:kliq/app_setup/controller/base_state.dart';
import 'package:kliq/config/route/paths.dart';
import 'package:kliq/features/auth/controllers/auth_controller.dart';
import 'package:kliq/features/auth/controllers/auth_status_provider.dart';
import 'package:kliq_components/kliq_componenets.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(logoutControllerProvider.notifier);
    final authState = ref.watch(logoutControllerProvider);
    final user = ref.watch(authStatusProvider).user;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FlutterSwitch(
          height: 42,
          width: 80,
          value: isTrue,
          onToggle: (value) async {
            isTrue = value;
            setState(() {});
            LogoutAlertDialogue.showAlert(context);
          },
          activeColor: Colors.orange,
          inactiveColor: Colors.black,
          inactiveIcon: const Icon(
            size: 24,
            Icons.nightlight_rounded,
          ),
          activeIcon: const Icon(
            size: 24,
            Icons.sunny,
            color: Colors.amber,
          ),
        ),
        VerticalGap.l,
        Text('Name : ${user?.displayName ?? ""}'),
        VerticalGap.l,
        Text('Email  : ${user?.email ?? ""}'),
        VerticalGap.l,
        Text('Is Verified email : ${user?.emailVerified ?? ""}'),
        VerticalGap.l,
        SizedBox(
          height: context.height * .06,
          width: context.width / 1.2,
          child: KliqButton(
            label: "Logout",
            showProgress: authState is BaseLoading,
            ontap: () async {
              await auth.logout();
              if (context.mounted) {
                context.go(Paths.appStateObserver.path);
              }
            },
          ),
        )
      ],
    );
  }
}
