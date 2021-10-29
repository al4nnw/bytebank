import 'package:bytebank/estilos/cores.dart';
import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final Function onPressed;
  const BottomBarItem(
      {Key? key, required this.icon, required this.active, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          splashRadius: 0.01,
          onPressed: () => onPressed(),
          icon: Icon(
            icon,
            color: cinza,
          ),
          constraints: const BoxConstraints(maxHeight: 30, minWidth: 200),
        ),
        Text(
          label,
          style: const TextStyle(color: cinza),
        ),
      ],
    );
  }
}
