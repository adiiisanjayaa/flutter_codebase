import 'package:get/get.dart';

import 'translation_keys.dart';

part 'en_us.dart';
part 'id.dart';

/// When implement with translation_keys, you can
/// search by regex "translation\.(.*?)\.tr"
/// to make sure don't forgot ".tr"
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': _EnUS().stringResources,
        'id_ID': _Id().stringResources,
      };
}
