import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String textoBtt;
  final void Function() onSelection;
  Respostas(this.textoBtt, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        backgroundColor:  Colors.purple[900], // background
         foregroundColor: Colors.white, // foreground
        ),
        onPressed: onSelection,
        child: Text(textoBtt),
      ),
    );
  }
}
