import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Widget showCustomFlushSnackbar({
  required BuildContext context,
  required String message,
  Color? backgroundColor,
  TextStyle? textStyle,
  Duration? duration,
  Widget? icon,
  EdgeInsets? margin,
  FlushbarPosition? position,
  FlushbarIconType? iconType,
}) {
  return Flushbar(
    flushbarPosition: position ?? FlushbarPosition.TOP,
    routeBlur: 1,
    routeColor: Colors.black38,
    icon: icon ??
        Icon(
          _getIconType(iconType),
          size: 24,
          color: Colors.white,
        ),
    margin: margin ?? const EdgeInsets.only(left: 8, right: 8, top: 20),
    borderRadius: BorderRadius.circular(10),
    messageText: Text(
      message,
      style: textStyle ??
          TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
    ),
    duration: duration ?? const Duration(seconds: 5),
    backgroundColor: backgroundColor ?? Colors.blue,
  )..show(context);
}

IconData _getIconType(FlushbarIconType? iconType) {
  switch (iconType) {
    case FlushbarIconType.info:
      return Icons.info_outline;
    case FlushbarIconType.success:
      return Icons.info_outline;
    case FlushbarIconType.warning:
      return Icons.info_outline;
    case FlushbarIconType.failure:
      return Icons.info_outline;
    default:
      return Icons.info_outline;
  }
}

class CustomFlushSnackBar extends StatelessWidget {
  /// The message to display
  final String message;

  /// The background color of the [FlushSnackBar]
  final Color? backgroundColor;

  /// TextStyle of the message displayed
  final TextStyle? textStyle;

  /// The duration of the animation
  final Duration? duration;
  final Widget? icon;

  /// The position the [FlushSnackBar] is to animate from
  final FlushbarPosition? position;
  final FlushbarIconType? iconType;

  const CustomFlushSnackBar({
    Key? key,
    required this.message,
    this.backgroundColor,
    this.textStyle,
    this.duration,
    this.position,
    this.iconType,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showFlushSnackbar(context),
    );
  }

  Widget showFlushSnackbar(
    BuildContext context,
  ) {
    return Flushbar(
      flushbarPosition: position ?? FlushbarPosition.TOP,
      routeBlur: 1,
      routeColor: Colors.black38,
      icon: icon ??
          Icon(
            _getIconType(iconType!),
            size: 24,
            color: Colors.white,
          ),
      margin: const EdgeInsets.only(left: 8, right: 8, top: 20),
      borderRadius: BorderRadius.circular(10),
      messageText: Text(
        message,
        style: textStyle ??
            TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
      ),
      duration: duration ?? const Duration(seconds: 5),
      backgroundColor: backgroundColor ?? Colors.blue,
    )
      ..dismiss()
      ..show(context);
  }

  IconData _getIconType(FlushbarIconType iconType) {
    switch (iconType) {
      case FlushbarIconType.info:
        return Icons.info_outline;
      case FlushbarIconType.success:
        return Icons.info_outline;
      case FlushbarIconType.warning:
        return Icons.info_outline;
      case FlushbarIconType.failure:
        return Icons.info_outline;
      default:
        return Icons.info_outline;
    }
  }
}

enum FlushbarIconType {
  warning,
  success,
  failure,
  info,
}

Widget showFlushSnackbar(
  BuildContext context,
  String? message,
  bool isResponseSuccessful,
) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    routeBlur: 1,
    routeColor: Colors.black38,
    icon: !isResponseSuccessful
        ? const Icon(
            Icons.info_outline,
            size: 24,
            color: Colors.white,
          )
        : const Icon(
            Icons.verified_user,
            size: 24,
            color: Colors.white,
          ),
    margin: const EdgeInsets.only(left: 8, right: 8, top: 20),
    borderRadius: BorderRadius.circular(10),
    messageText: !isResponseSuccessful
        ? Text(
            '$message',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          )
        : Text(
            '$message!',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
    duration: const Duration(seconds: 5),
    backgroundColor:
        !isResponseSuccessful ? Colors.pink : Colors.green,
  )
    ..dismiss()
    ..show(context);
}

Widget showFlushSnackbar2(BuildContext context, String message) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    routeBlur: 1,
    routeColor: Colors.black38,
    icon: const Icon(
      Icons.warning,
      size: 24,
      color: Colors.white,
    ),
    margin: const EdgeInsets.only(left: 8, right: 8, top: 20),
    borderRadius: BorderRadius.circular(10),
    messageText: Text(
      message,
      style: TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
    ),
    duration: const Duration(seconds: 8),
    backgroundColor: Colors.yellow,
  )
    ..dismiss()
    ..show(context);
}

Widget showFlushSnackbar3({
  required BuildContext context,
  required String message,
  String? subMessage,
  required bool isResponseSuccessful,
  Duration? duration,
}) {
  print(subMessage);
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    routeBlur: 1,
    routeColor: Colors.black38,
    icon: !isResponseSuccessful
        ? const Icon(
            Icons.info_outline,
            size: 24,
            color: Colors.white,
          )
        : const Icon(
            Icons.verified_user,
            size: 24,
            color: Colors.white,
          ),
    margin: const EdgeInsets.only(left: 8, right: 8, top: 20),
    borderRadius: BorderRadius.circular(10),
    messageText: isResponseSuccessful
        ? Text(
            message,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          )
        : SizedBox(
            child: subMessage == null
                ? Text(
                    '$message!',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$message!',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        subMessage ?? '',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
          ),
    duration: duration ?? const Duration(seconds: 3),
    backgroundColor:
        !isResponseSuccessful ? Colors.red : Colors.green,
  )..show(context);
}
