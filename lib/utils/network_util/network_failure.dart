import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easylogger/flutter_logger.dart';

class CleanFailure extends Equatable {
  final String tag;
  final CleanError error;
  final bool enableDialogue;
  final int statusCode;

  const CleanFailure({
    required this.tag,
    required this.error,
    this.enableDialogue = true,
    this.statusCode = -1,
  });

  CleanFailure copyWith({
    String? tag,
    CleanError? error,
    int? statusCode,
  }) {
    return CleanFailure(
      tag: tag ?? this.tag,
      error: error ?? this.error,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  factory CleanFailure.withData(
      {required String tag,
      required String url,
      required String method,
      required int statusCode,
      required Map<String, String> header,
      required Map<String, dynamic> body,
      bool enableDialogue = true,
      required CleanError error}) {
    final String t = tag == 'Type' ? url : tag;
    // final Map<String, dynamic> errorMap = {
    //   'url': url,
    //   'method': method,
    //   if (header.isNotEmpty) 'header': header,
    //   if (body.isNotEmpty) 'body': body,
    //   'error': error,
    //   if (statusCode > 0) 'status_code': statusCode
    // };
    // final encoder = JsonEncoder.withIndent(' ' * 2);
    // // return encoder.convert(toJson());
    // final String errorStr = encoder.convert(errorMap);
    return CleanFailure(
        tag: t,
        error: error,
        enableDialogue: enableDialogue,
        statusCode: statusCode);
  }

  factory CleanFailure.none() {
    return CleanFailure(tag: '', error: CleanError.none());
  }

  @override
  String toString() {
    return 'CleanFailure(tag: $tag, error: $error, statusCode: $statusCode)';
  }

  showDialogue(BuildContext context) {
    if (enableDialogue) {
      CleanFailureDialogue.show(context, failure: this);
    } else {
      Logger.e(this);
    }
  }

  @override
  List<Object> get props => [tag, error, enableDialogue, statusCode];

  Map<String, dynamic> toMap() {
    return {
      'tag': tag,
      'error': error.toMap(),
      'enableDialogue': enableDialogue,
      'statusCode': statusCode,
    };
  }

  factory CleanFailure.fromMap(Map<String, dynamic> map) {
    return CleanFailure(
      tag: map['tag'] ?? '',
      error: CleanError.fromMap(map['error']),
      enableDialogue: map['enableDialogue'] ?? false,
      statusCode: map['statusCode']?.toInt() ?? 0,
    );
  }
}

class CleanError extends Equatable {
  final String message;

  const CleanError({
    required this.message,
  });

  factory CleanError.none() => const CleanError(message: '');

  CleanError copyWith({
    String? message,
  }) {
    return CleanError(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
    };
  }

  factory CleanError.fromMap(Map<String, dynamic> map) {
    return CleanError(
      message: map['message'] ?? '',
    );
  }

  @override
  String toString() => 'CleanError(message: $message)';

  @override
  List<Object> get props => [message];
}

class CleanFailureDialogue extends StatelessWidget {
  final CleanFailure failure;
  const CleanFailureDialogue(this.failure, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      contentTextStyle: const TextStyle(color: Colors.black),
      titleTextStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.error_outline_sharp,
            color: Colors.red,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              failure.tag,
              maxLines: 2,
            ),
          ),
        ],
      ),
      content: Text(
        failure.error.message,
        maxLines: 4,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ignore')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, shape: const StadiumBorder()),
            onPressed: () {
              Navigator.of(context).pop();

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CleanFailureDetailsPage(failure: failure)));
            },
            child: const Text('View details'))
      ],
    );
  }

  static show(BuildContext context, {required CleanFailure failure}) {
    if (failure != CleanFailure.none()) {
      showDialog(
          context: context,
          builder: (context) => CleanFailureDialogue(failure));
    }
  }
}

class CleanFailureDetailsPage extends StatelessWidget {
  final CleanFailure failure;
  const CleanFailureDetailsPage({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.red[100],
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.error_outline_rounded,
                        color: Colors.red,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Error',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const StadiumBorder(),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              visualDensity: VisualDensity.compact),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.arrow_left_circle,
                                  color: Colors.purple[900]),
                              Text('Go back',
                                  style: TextStyle(color: Colors.purple[900])),
                            ],
                          )),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                  width: 2, color: Colors.purple[900]!),
                              shape: const StadiumBorder(),
                              visualDensity: VisualDensity.compact),
                          onPressed: () {
                            Clipboard.setData(
                                ClipboardData(text: failure.error.message));
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Copied to Clipboard')));
                          },
                          child: Text('Copy code',
                              style: TextStyle(color: Colors.purple[900]))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                children: [
                  Text(
                    failure.tag,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    failure.error.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
