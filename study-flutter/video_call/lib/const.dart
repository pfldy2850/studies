import 'package:flutter_dotenv/flutter_dotenv.dart';

final String APP_ID = dotenv.env['APP_ID'].toString();
final String CHANNEL_NAME = dotenv.env['CHANNEL_NAME'].toString();
final String TEMP_TOKEN = dotenv.env['TEMP_TOKEN'].toString();
