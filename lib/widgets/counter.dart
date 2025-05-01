import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final int count;
  final void Function(int) onChanged;

  const CounterWidget({
    super.key,
    required this.count,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(Icons.remove, () {
            if (count > 1) {
              onChanged(count - 1);
            }
          }),
          const SizedBox(width: 12),
          Text(
            '$count',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 12),
          _buildButton(Icons.add, () {
            onChanged(count + 1);
          }),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Icon(icon, size: 20),
    );
  }
}
