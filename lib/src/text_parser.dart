class TextParser {
  Map<String, String> parseIdDetails(String text) {
    final regexId = RegExp(r'ID Number:\s?(\d+)');
    final regexName = RegExp(r'Name:\s?([\w\s]+)');
    final regexDob = RegExp(r'DOB:\s?(\d{4}-\d{2}-\d{2})');

    final id = regexId.firstMatch(text)?.group(1) ?? 'Unknown';
    final name = regexName.firstMatch(text)?.group(1) ?? 'Unknown';
    final dob = regexDob.firstMatch(text)?.group(1) ?? 'Unknown';

    return {
      'id': id,
      'name': name,
      'dob': dob,
    };
  }
}
