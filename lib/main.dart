import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Other stateful widget',
      home: OtherStatefulWidget(),
    ));

class OtherStatefulWidget extends StatefulWidget {
  const OtherStatefulWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OtherStatefulWidget_State();
}

class _OtherStatefulWidget_State extends State<OtherStatefulWidget> {
  bool _switchVal = true;
  bool? _checkBoxVal = true;
  double _slider1Val = 0.5;
  double _slider2Val = 50.0;
  int? _radioVal = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          const Text("Switch"),
          Center(
            child: Switch(
              onChanged: (bool val) {
                setState(() {
                  _switchVal = val;
                });
              },
              value: _switchVal,
            ),
          ),
          const Text("Disable-Switch"),
          const Center(
            child: Switch(value: false, onChanged: null),
          ),
          const Divider(),
          const Text('CheckBox'),
          Checkbox(
              value: _checkBoxVal,
              onChanged: (bool? chkVal) {
                setState(() {
                  _checkBoxVal = chkVal;
                });
              }),
          const Text("Disable-CheckBox"),
          const Center(
            child: Checkbox(value: false, onChanged: null),
          ),
          const Divider(),
          const Text("Slider"),
          Slider(
              value: _slider1Val,
              onChanged: (double val) {
                setState(() {
                  _slider1Val = val;
                });
              }),
          const Text('Slider with divistions and label'),
          Row(
            children: [
              Expanded(
                child: Slider(
                    label: '${_slider2Val.round()}',
                    max: 100,
                    divisions: 5,
                    value: _slider2Val,
                    onChanged: (double val) {
                      setState(() {
                        _slider2Val = val;
                      });
                    }),
              ),
              Text(_slider2Val.toStringAsFixed(1))
            ],
          ),
          const Divider(),
          const Text('LinearProressIndicator'),
          const LinearProgressIndicator(
            color: Colors.green,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text('CircularProressdicator'),
              CircularProgressIndicator(),
            ],
          ),
          const Divider(),
          const Text('Radio'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [0, 1, 2, 3]
                .map((index) => Radio<int>(
                    value: index,
                    groupValue: _radioVal,
                    onChanged: (int? val) {
                      setState(() {
                        _radioVal = val;
                      });
                    }))
                .toList(),
          )
        ],
      ),
    );
  }
}
