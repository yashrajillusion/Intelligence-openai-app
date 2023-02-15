import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intelligence/infrastructure/provider/completion_provider.dart';

final completionProvider = ChangeNotifierProvider((ref) => CompletionProvider());
