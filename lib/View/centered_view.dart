import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {

  final Widget child;
  const CenteredView({Key key, this.child}): super(key : key);


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal:70 , vertical: 40),
      alignment:  Alignment.topCenter,
      child: ConstrainedBox(constraints:  BoxConstraints(maxWidth: screenSize.size.width * 0.8),
      child: child),
    );
  }
}
