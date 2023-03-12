import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for CategoriesApi
void main() {
  final instance = Openapi().getCategoriesApi();

  group(CategoriesApi, () {
    // Create new category
    //
    //Future<Category> addCategories(String sessionToken, String categoryName) async
    test('test addCategories', () async {
      // TODO
    });

    // Return list of all categories
    //
    //Future<BuiltList<Category>> getCategories() async
    test('test getCategories', () async {
      // TODO
    });

  });
}
