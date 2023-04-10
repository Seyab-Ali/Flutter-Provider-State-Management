import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
  NotifyListnerScreen({Key? key}) : super(key: key);

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notify Listner'),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _toggle,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: _toggle.value,
                decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                      onTap: () {
                        _toggle.value = !_toggle.value;
                      },
                      child: Icon(_toggle.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility),
                    )),
              );
            },
          ),
          Center(
              child: ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Text(
                _counter.value.toString(),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
      ),
    );
  }
}
