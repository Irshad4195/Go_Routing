import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool isSwitched = false;


  @override
  Widget build(BuildContext context) {
    return Switch(
        value: isSwitched,
        activeThumbImage: const AssetImage('assets/activeCall2.png'),
        inactiveThumbImage: const AssetImage('assets/inactiveCall.png'),
        activeColor: Colors.green[200],
        inactiveTrackColor: Colors.red[200],
        inactiveThumbColor: Colors.red[200],
        activeTrackColor: Colors.green[200],
        onChanged: (value) {
          setState(() {
            isSwitched = value;
          });
        }

    );
  }
}

class ToggleSwitchCall extends StatefulWidget {
  const ToggleSwitchCall({super.key});

  @override
  State<ToggleSwitchCall> createState() => _ToggleSwitchCallState();
}

class _ToggleSwitchCallState extends State<ToggleSwitchCall> {
  bool status7 = false;
  bool status8 = false;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toggle Switch Example'),
      ),
      body: Center(
        child:
        Column(
          children: [
            FlutterSwitch(
              width: 100.0,
              height: 55.0,
              toggleSize: 45.0,
              value: status7,
              borderRadius: 30.0,
              padding: 2.0,
              activeToggleColor: Color(0xFF6E40C9),
              inactiveToggleColor: Color(0xFF2F363D),
              activeSwitchBorder: Border.all(
                color: Color(0xFF3C1E70),
                width: 6.0,
              ),
              inactiveSwitchBorder: Border.all(
                color: Color(0xFFD1D5DA),
                width: 6.0,
              ),
              activeColor: Color(0xFF271052),
              inactiveColor: Colors.white,
              activeIcon: const Icon(
                Icons.call,
                color: Color(0xFFF8E3A1),
              ),
              inactiveIcon: const Icon(
                Icons.phone_disabled,
                color: Color(0xFFFFDF5D),
              ),
              onToggle: (val) {
                setState(() {
                  status7 = val;
                });
              },
            ),
            FlutterSwitch(
              width: 100.0,
              height: 55.0,
              toggleSize: 45.0,
              value: status8,
              borderRadius: 30.0,
              padding: 2.0,
              activeToggleColor: Color(0xFF6E40C9),
              inactiveToggleColor: Color(0xFF2F363D),
              activeSwitchBorder: Border.all(
                color: Color(0xFF3C1E70),
                width: 6.0,
              ),
              inactiveSwitchBorder: Border.all(
                color: Color(0xFFD1D5DA),
                width: 6.0,
              ),
              activeColor: Color(0xFF271052),
              inactiveColor: Colors.white,
              activeIcon: const Icon(
                Icons.nightlight_round,
                color: Color(0xFFF8E3A1),
              ),
              inactiveIcon: const Icon(
                Icons.wb_sunny,
                color: Color(0xFFFFDF5D),
              ),
              onToggle: (val) {
                setState(() {
                  status8 = val;
                });
              },
            ),
        Switch(
            value: isSwitched,
            activeThumbImage: AssetImage('assets/activeCall.png'),
            inactiveThumbImage: AssetImage('assets/inactiveCall.png'),
            activeColor: Colors.green[200],
            inactiveTrackColor: Colors.red[200],
            inactiveThumbColor: Colors.red[200],
            activeTrackColor: Colors.green[200],
            focusColor: Colors.blue,
            hoverColor: Colors.blue[200],
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            }

        ),

          ],
        ),
      ),
    );
  }
}

