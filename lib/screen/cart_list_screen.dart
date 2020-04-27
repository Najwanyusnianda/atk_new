import 'package:atktemp/screen/atk_request_list.dart';
import 'package:flutter/material.dart';

class CartListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Konfirmasi'),
      ),
      body: AtkRequestList(),
    );
  }
}
