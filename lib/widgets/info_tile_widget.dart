import 'package:flutter/material.dart';

class InfoTileWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoTileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  State<InfoTileWidget> createState() => _InfoTileWidgetState();
}

class _InfoTileWidgetState extends State<InfoTileWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title Row
          Row(
            children: [
              Icon(widget.icon, size: screenWidth > 600 ? 24 : 20, color: Colors.blue),
              const SizedBox(width: 10),
              Text(
                '${widget.title}: ',
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 18 : 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          /// Description Text
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Text(
              widget.value,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: screenWidth > 600 ? 16 : 14,
                color: Colors.grey[700],
              ),
              maxLines: isExpanded ? null : 1,
              overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ),

          /// Show more/less button
          if (widget.value.length > 20)
            GestureDetector(
              onTap: () => setState(() => isExpanded = !isExpanded),
              child: Text(
                isExpanded ? 'Show less' : 'Show more',
                style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}