import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseService {
  static final SupabaseClient _client = Supabase.instance.client;
  static const String _baseUrl = "https://qdhwcuqtnerlxdhllidu.supabase.co";

  static Future<FunctionResponse?> generalEdgeFunction({
    required String functionName,
    Map<String, dynamic>? body,
    Map<String, String>? query,
  }) async {
    final res = await _client.functions.invoke(
      functionName,
      body: body,
      queryParameters: query,
    );
    return res;
  }

  static Future<bool> multipartEdgeFunction({
    required String functionName,
    required Map<String, dynamic> fields,
    required String filePath,
    String fileFieldName = "file",
    String mimeType = "png",
  }) async {
    try {
      final accessToken = _client.auth.currentSession?.accessToken;
      if (accessToken == null) {
        throw Exception("User not logged in. No access token found.");
      }

      final url = Uri.parse("$_baseUrl/functions/v1/$functionName");

      final request = http.MultipartRequest("POST", url);

      fields.forEach((key, value) {
        request.fields[key] = value is String ? value : jsonEncode(value);
      });

      request.files.add(
        await http.MultipartFile.fromPath(
          fileFieldName,
          filePath,
          contentType: MediaType("image", mimeType),
        ),
      );

      request.headers['Authorization'] = "Bearer $accessToken";
      request.headers['Accept'] = "application/json";

      final response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
