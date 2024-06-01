import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kliq_components/kliq_componenets.dart';
import 'package:kliq_resources/kliq_resources.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FlutterSwitch(
          height: 42,
          width: 80,
          value: isTrue,
          onToggle: (value) {
            isTrue = value;
            setState(() {});
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
        
        Text('Name'),
        Text('Email')
      ],
    );
  }
}
