import 'package:api_task/features/posts/model/post_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostModel', () {
    test('fromJson parses a full dummyjson post map', () {
      final json = {
        'id': 1,
        'userId': 121,
        'title': 'His mother had always taught him',
        'body': 'His mother had always taught him not to ever think of himself as better than others.',
      };

      final model = PostModel.fromJson(json);

      expect(model.id, 1);
      expect(model.userId, 121);
      expect(model.title, 'His mother had always taught him');
      expect(model.body.startsWith('His mother'), isTrue);
    });

    test('fromJson falls back gracefully for missing optional fields', () {
      final json = {
        'id': 2,
        'userId': 5,
        'title': 'Minimal post',
        'body': 'Body',
      };

      final model = PostModel.fromJson(json);

      expect(model.id, 2);
    });

    test('toJson round-trips correctly', () {
      final model = PostModel(
        id: 3,
        userId: 7,
        title: 'Round trip',
        body: 'Body text',
      );

      final json = model.toJson();
      expect(json['id'], 3);
      expect(json['tags'], ['a', 'b']);
      expect(PostModel.fromJson(json).id, 3);
    });

  });
}
