class LanguageModel {
  final String code;
  final String name;
  final String flag;

  const LanguageModel({
    required this.code,
    required this.name,
    required this.flag,
  });
}

final List<LanguageModel> languages = [
  const LanguageModel(
    code: 'en',
    name: 'English',
    flag: '🇺🇸',
  ),
  const LanguageModel(
    code: 'ar',
    name: 'العربية',
    flag: '🇦🇪',
  ),
];
