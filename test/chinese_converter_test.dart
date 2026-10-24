import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:guildwars2_companion/core/utils/chinese_converter.dart';

void main() {
  setUpAll(() {
    ChineseConverter.loadFromStrings(
      phrases: File('assets/data/opencc/STPhrases.txt').readAsStringSync(),
      characters: File('assets/data/opencc/STCharacters.txt').readAsStringSync(),
      twVariants: File('assets/data/opencc/TWVariants.txt').readAsStringSync(),
    );
  });

  group('names returned by the API for lang=zh', () {
    final Map<String, String> expected = {
      '怪异莓棒': '怪異莓棒',
      '球形灵质': '球形靈質',
      '超级武勇法印': '超級武勇法印',
      '半人马歼灭者': '半人馬殲滅者',
      '鹰身女妖歼灭者': '鷹身女妖殲滅者',
      '龙蜥歼灭者': '龍蜥殲滅者',
      '团队协作': '團隊協作',
      '狮子拱门': '獅子拱門',
      '女王谷': '女王谷',
    };

    expected.forEach((simplified, traditional) {
      test(simplified, () => expect(ChineseConverter.convert(simplified), traditional));
    });
  });

  group('words whose traditional form depends on the word', () {
    final Map<String, String> expected = {
      '皇后': '皇后',
      '头发': '頭髮',
      '干净': '乾淨',
      '复杂': '複雜',
      '制造': '製造',
      '关系': '關係',
      '收获': '收穫',
      '放松': '放鬆',
    };

    expected.forEach((simplified, traditional) {
      test(simplified, () => expect(ChineseConverter.convert(simplified), traditional));
    });
  });

  test('applies the Taiwan variants', () {
    // 這裡 and not 這裏
    expect(ChineseConverter.convert('这里'), '這裡');
  });

  test('keeps markup, latin text and numbers', () {
    expect(
      ChineseConverter.convert('<c=@flavor>对敌人造成 250 点伤害。</c> Fire x3'),
      '<c=@flavor>對敵人造成 250 點傷害。</c> Fire x3',
    );
  });

  test('returns the very same string when there is nothing to convert', () {
    final String english = 'Strike for 1,000 damage';
    expect(identical(ChineseConverter.convert(english), english), isTrue);
    expect(ChineseConverter.convert(''), '');
    expect(ChineseConverter.convert(null), null);
  });

  test('convertJson converts values but not keys', () {
    final Map<String, dynamic> json = {
      'id': 5,
      'name': '龙蜥歼灭者',
      '龙': '龙',
      'tiers': [
        {'count': 3, 'description': '团队协作'},
        '干净',
        null,
        true,
      ],
    };

    expect(ChineseConverter.convertJson(json), {
      'id': 5,
      'name': '龍蜥殲滅者',
      '龙': '龍',
      'tiers': [
        {'count': 3, 'description': '團隊協作'},
        '乾淨',
        null,
        true,
      ],
    });
  });

  test('converts a realistic amount of text quickly', () {
    final String sentence = '对敌人造成伤害，并且为团队中的盟友恢复生命值。';
    final String text = List.filled(40000, sentence).join();
    final Stopwatch stopwatch = Stopwatch()..start();
    final String converted = ChineseConverter.convert(text);
    stopwatch.stop();

    // ignore: avoid_print
    print('converted ${text.length} characters in ${stopwatch.elapsedMilliseconds} ms');
    expect(converted.startsWith('對敵人造成傷害，並且為團隊中的盟友恢復生命值。'), isTrue);
  });
}
