import 'package:flutter/material.dart';

class SelectionPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onPop;
  const SelectionPageAppBar({super.key, required this.title, this.onPop});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      forceMaterialTransparency: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Theme.of(context).colorScheme.onError,
        ),
        onPressed:
            onPop ??
            () {
              Navigator.pop(context);
            },
      ),
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


// SizedBox(
//       width: MediaQuery.sizeOf(context).width,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           IconButton(
//             icon: Icon(
//               Icons.arrow_back_ios_new_outlined,

//               color: Theme.of(context).colorScheme.onError,
//             ),
//             onPressed: () => Navigator.pop(context),
//           ),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.headlineSmall,
//           ),
//         ],
//       ),
//     );