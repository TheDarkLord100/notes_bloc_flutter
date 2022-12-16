import 'package:flutter/material.dart';

showLoadingIndicator(context, String title) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: const SizedBox(
              height: 50, child: Center(child: CircularProgressIndicator())),
        );
      });
}

class MaterialButtonWidget extends StatelessWidget {
  final Color color;
  final String text;
  final void Function()? function;
  const MaterialButtonWidget({
    Key? key,
    required this.color,
    required this.text,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          elevation: 5.0,
          color: color,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: function,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

const mytextFieldDecoration = InputDecoration(
  hintText: 'Enter your email',
  hintStyle: TextStyle(color: Colors.white),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  filled: true,
  fillColor: Color(0xFF3B3B3B),
  focusColor: Color(0xFF3B3B3B),

  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 0.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
);
