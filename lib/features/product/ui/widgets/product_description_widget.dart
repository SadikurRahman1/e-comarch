import 'package:flutter/material.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({
    super.key,
    required this.textThem,
    required this.name,
    required this.description,
    required this.icon,
  });

  final TextTheme textThem;
  final IconData icon;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const SizedBox(height: 16),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 15,
              child: Icon(
                icon,
                size: 18,
                color: Colors.black45,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              name,
              style: textThem.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          description,
          /// TODO: See all text go to the next page . make a new page or on tap max line unlimited .
          // maxLines: 3,
          // overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
