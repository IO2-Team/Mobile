import 'dart:typed_data';

import 'package:azblob/azblob.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';



const connectionString = String.fromEnvironment(
  'BLOB_KEY',
  defaultValue: 'BLOB_KEY NOT FOUND',
);

const container = "/photos/";

class Blob {
  var storage = AzureStorage.parse(connectionString);

  Future<void> put(String path, String content) async {
    await storage.putBlob(container + path, bodyBytes: Uint8List.fromList(content.codeUnits));
  }

  Future<void> delete(String path) async {
    await storage.deleteBlob(container + path);
  }

  Future<String> get(String path) async {
    var content = await storage.getBlob(container + path);
    var response = await content.stream.toBytes();
    return String.fromCharCodes(response);
  }
}
