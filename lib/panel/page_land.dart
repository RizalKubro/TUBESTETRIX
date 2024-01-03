import 'package:flutter/material.dart';
import 'package:tetrix/main.dart';
import 'package:tetrix/panel/controller.dart';
import 'package:tetrix/panel/screen.dart';

class PageLand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    height -= MediaQuery.of(context).viewInsets.vertical;
    return SizedBox.expand(
      child: Container(
        color: BACKGROUND_COLOR,
        child: Padding(
          padding: MediaQuery.of(context).padding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    SystemButtonGroup(),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, bottom: 40),
                      child: DropButton(),
                    ),
                  ],
                ),
              ),
              _ScreenDecoration(child: Screen.fromHeight(height * 0.8)),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    DirectionController(),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScreenDecoration extends StatelessWidget {
  final Widget child;

  const _ScreenDecoration({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Your decoration properties go here
      child: child,
    );
  }
}
