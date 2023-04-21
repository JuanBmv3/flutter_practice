import 'package:componentsflutter/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _slideValue = 100;
  bool sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Slider(
              value: _slideValue,
              activeColor: AppTheme.primary,
              min: 50,
              max: 400,
              onChanged: (value) {
                _slideValue = value;
                setState(() {});
              },
            ),
            Checkbox(
                value: sliderEnable,
                onChanged: (value) {
                  sliderEnable = value ?? true;
                  setState(() {});
                }),
            Switch(value: sliderEnable, onChanged: (value) {
              sliderEnable = value ;
              setState(() {});
            }),
            SwitchListTile(value: sliderEnable, onChanged: (value) {
              sliderEnable = value ;
              setState(() {});
            }),
            Image(
              image: const NetworkImage(
                  'https://www.allcitycanvas.com/wp-content/uploads/2019/03/One-punch-man-H-1280x720.png'),
              fit: BoxFit.contain,
              width: _slideValue,
            )
          ],
        ),
      ),
    );
  }
}
