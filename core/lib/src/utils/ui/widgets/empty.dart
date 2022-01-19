import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({
    Key? key,
    this.iconData,
    this.image,
    this.notFoundText,
  }) : super(key: key);

  final IconData? iconData;
  final ImageProvider? image;
  final String? notFoundText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData != null)
              Icon(
                iconData,
                color: Theme.of(context).colorScheme.primary,
                size: 100,
              ),
            const SizedBox(height: 14),
            Text(
              notFoundText ?? 'Data not found',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
