import 'package:flutter/services.dart' show rootBundle;

/// Converts Simplified Chinese to Traditional Chinese (Taiwan standard
/// characters), the way OpenCC's "s2tw" configuration does: phrases are
/// converted first (longest match), single characters fill in the rest and
/// the Taiwan variants (e.g. 裏 -> 裡) are applied on top.
///
/// Vocabulary differences between the regions (e.g. 软件 / 軟體) are not
/// handled. The dictionaries come from OpenCC (Apache-2.0), see
/// assets/data/opencc/LICENSE.
class ChineseConverter {
  // The first code unit that can start something worth converting
  static const int _firstConvertible = 0x2E80;

  static Map<String, String> _phrases = {};
  // First code unit of a phrase -> the phrase lengths that exist, longest first
  static Map<int, List<int>> _phraseLengths = {};
  static Map<int, int> _characters = {};
  static Future<void> _loading;

  /// Starts loading the dictionaries (once) and completes when they are ready.
  /// It can be called without awaiting to warm up in the background.
  static Future<void> ensureLoaded() => _loading ??= _loadAssets();

  static Future<void> _loadAssets() async {
    List<String> texts = await Future.wait([
      rootBundle.loadString('assets/data/opencc/STPhrases.txt'),
      rootBundle.loadString('assets/data/opencc/STCharacters.txt'),
      rootBundle.loadString('assets/data/opencc/TWVariants.txt'),
    ]);

    loadFromStrings(
      phrases: texts[0],
      characters: texts[1],
      twVariants: texts[2],
    );
  }

  /// Builds the converter from the contents of OpenCC's STPhrases.txt,
  /// STCharacters.txt and TWVariants.txt.
  static void loadFromStrings({String phrases, String characters, String twVariants}) {
    Map<int, int> variants = {};
    _parse(twVariants, (key, value) {
      if (key.length == 1 && value.length == 1) {
        variants[key.codeUnitAt(0)] = value.codeUnitAt(0);
      }
    });

    Map<int, int> characterMap = {};
    _parse(characters, (key, value) {
      if (key.length == 1 && value.length == 1) {
        int target = value.codeUnitAt(0);
        characterMap[key.codeUnitAt(0)] = variants[target] ?? target;
      }
    });
    // Text that is already traditional can still contain variants
    variants.forEach((from, to) => characterMap.putIfAbsent(from, () => to));

    Map<String, String> phraseMap = {};
    Map<int, Set<int>> lengths = {};
    _parse(phrases, (key, value) {
      if (key.length < 2) {
        return;
      }

      phraseMap[key] = _mapUnits(value, variants);
      lengths.putIfAbsent(key.codeUnitAt(0), () => Set<int>()).add(key.length);
    });

    _phraseLengths = lengths.map((first, set) =>
      MapEntry(first, (set.toList()..sort((a, b) => b.compareTo(a)))));
    _phrases = phraseMap;
    _characters = characterMap;
  }

  // Lines look like "key<TAB>value1 value2", only the first value is used
  static void _parse(String text, void Function(String key, String value) onEntry) {
    for (String line in text.split('\n')) {
      if (line.isEmpty || line.startsWith('#')) {
        continue;
      }

      int tab = line.indexOf('\t');
      if (tab < 1) {
        continue;
      }

      String value = line.substring(tab + 1).trim();
      int space = value.indexOf(' ');
      if (space > 0) {
        value = value.substring(0, space);
      }

      if (value.isNotEmpty) {
        onEntry(line.substring(0, tab), value);
      }
    }
  }

  static String _mapUnits(String text, Map<int, int> map) {
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      int unit = text.codeUnitAt(i);
      buffer.writeCharCode(map[unit] ?? unit);
    }

    return buffer.toString();
  }

  static String convert(String input) {
    if (input == null || !_hasConvertible(input)) {
      return input;
    }

    StringBuffer output = StringBuffer();
    int length = input.length;
    int i = 0;

    while (i < length) {
      int unit = input.codeUnitAt(i);

      if (unit < _firstConvertible) {
        output.writeCharCode(unit);
        i++;
        continue;
      }

      List<int> candidates = _phraseLengths[unit];
      bool matched = false;

      if (candidates != null) {
        for (int candidate in candidates) {
          if (i + candidate > length) {
            continue;
          }

          String converted = _phrases[input.substring(i, i + candidate)];

          if (converted != null) {
            output.write(converted);
            i += candidate;
            matched = true;
            break;
          }
        }
      }

      if (!matched) {
        output.writeCharCode(_characters[unit] ?? unit);
        i++;
      }
    }

    return output.toString();
  }

  static bool _hasConvertible(String input) {
    for (int i = 0; i < input.length; i++) {
      if (input.codeUnitAt(i) >= _firstConvertible) {
        return true;
      }
    }

    return false;
  }

  /// Converts every string value of decoded JSON in place. Keys are left alone.
  static dynamic convertJson(dynamic data) {
    if (data is String) {
      return convert(data);
    }

    if (data is List) {
      for (int i = 0; i < data.length; i++) {
        data[i] = convertJson(data[i]);
      }
    } else if (data is Map) {
      for (dynamic key in data.keys.toList()) {
        data[key] = convertJson(data[key]);
      }
    }

    return data;
  }
}
