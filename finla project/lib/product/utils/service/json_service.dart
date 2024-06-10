import 'dart:convert';
import 'dart:io';

import 'package:dev_template/product/core/model/jewel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

/// IJsonService
abstract class IJsonService {
  /// Get shoes
  Future<List<Jewel>> getJewel();

  /// Save shoes
  Future<void> saveJewel(List<Jewel> shoes);

  /// Load shoes from a selected JSON file
  Future<List<Jewel>> loadJewelFromField();
}

/// JsonService
class JsonService implements IJsonService {
  @override
  Future<List<Jewel>> getJewel() async {
    // JSON dosyasını assetlerden oku
    final response = await rootBundle.loadString('assets/jewel/jewel.json');
    // JSON verisini decode et
    final data = json.decode(response) as List<dynamic>;

    // JSON verisini Shoe modeline çevir
    final shoes =
        data.map((e) => Jewel.fromJson(e as Map<String, dynamic>)).toList();

    return shoes;
  }

  @override
  Future<void> saveJewel(List<Jewel> shoes) async {
    // JSON verisini encode et
    final jsonString = json.encode(shoes.map((e) => e.toJson()).toList());

    // Dosya yolunu al
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/shoes.json';

    // Dosyaya yaz
    final file = File(filePath);
    await file.writeAsString(jsonString);
  }

  @override
  Future<List<Jewel>> loadJewelFromField() async {
    // File Picker ile dosya seç
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result == null) {
      // Dosya seçilmedi
      return [];
    }

    // Seçilen dosyanın yolunu al
    final file = File(result.files.single.path!);

    // JSON dosyasını oku
    final jsonString = await file.readAsString();

    // JSON verisini decode et
    final data = json.decode(jsonString) as List<dynamic>;

    // JSON verisini Shoe modeline çevir
    final shoes =
        data.map((e) => Jewel.fromJson(e as Map<String, dynamic>)).toList();

    return shoes;
  }
}
