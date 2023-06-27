import 'package:timelapps/all_imports.dart';

class PhoneContainer extends StatelessWidget {
  final Widget child;

  const PhoneContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.sizeOf(context).width;
    final double maxHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: maxWidth * 0.5,
      height: maxHeight * 0.9,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
          bottomLeft: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
        ),
        border: Border.all(color: Colors.black, width: 8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        child: child,
      ),
    );
  }
}
