import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TweenAnimationBuilder'),
      ),
      body: Center(child: HSVColorSelector()),
    );
  }
}

class HSVColorSelector extends StatefulWidget {
  @override
  _HSVColorSelectorState createState() => _HSVColorSelectorState();
}

class _HSVColorSelectorState extends State<HSVColorSelector> {

  double _hue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: _hue),
          duration: Duration(milliseconds: 1500),
          builder: (context, hue, child){
            return Container(
              width: 200,
              height: 200,
              color: HSVColor.fromAHSV(1.0, hue, 1.0, 1.0).toColor()
            );
          },
        ),
        SizedBox(height: 40,),
        Container(
          height: 40,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                for(double hue = 0; hue <= 360; hue ++)
                  HSVColor.fromAHSV(1.0, hue, 1.0, 1.0).toColor()
              ],
              stops: [
                for(double hue = 0; hue <= 360; hue ++)hue / 360
              ]
            )
          ),
        ),
        Slider.adaptive(
          value: _hue,
          min: 0.0,
          max: 360,
          onChanged: (value) => setState((){_hue = value;}),
        )
      ],
    );
  }
}
