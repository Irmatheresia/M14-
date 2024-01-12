import 'package:pert_14/main.dart';
import 'package:test/test.dart';

void main() {
  group('Test Start', () {
    test('value is 0', () {
      final counter = Counter();
      expect(counter.value, 0);
    });
    test('value should be 1', () {
      final counter = Counter();
      counter.increment();
      expect(counter.radioGroup, 1);
      expect(counter.value, 1);
    });
    test('value should be 2', () {
      final counter = Counter();
      counter.changes(2);
      counter.increment();
      expect(counter.radioGroup, 2);
      expect(counter.value, 2);
    });
    test('value got reset', () {
      final counter = Counter();
      counter.increment();
      expect(counter.radioGroup, 1);
      expect(counter.value, 1);
      counter.reset();
      expect(counter.value, 0);
    });
  });
}
