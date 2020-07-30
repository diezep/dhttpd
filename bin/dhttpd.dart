import 'dart:io';

import 'package:dhttpd/dhttpd.dart';
import 'package:dhttpd/src/options.dart';

Future<void> main(List<String> args) async {
  Options options;
  try {
    options = parseOptions(args);
  } on FormatException catch (e) {
    stderr.writeln(e.message);
    print(usage);
    exitCode = 64;
    return;
  }

  if (options.help) {
    print(usage);
    return;
  }
  
  await Dhttpd.start(path: options.path, port:int.parse(Platform.environment['PORT']), address: options.host);

  print('Server started on port ${int.parse(Platform.environment['PORT'])}');
}