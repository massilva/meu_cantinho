import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cantinho/config/providers.dart';
import 'package:meu_cantinho/data/repositories/services/storage_service.dart';
import 'package:meu_cantinho/main.dart';
import 'package:meu_cantinho/utils/constants/keys.dart';
import 'package:meu_cantinho/utils/strings/app_string.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../testing/fake_storage.dart';

class MockStorageService extends Mock implements StorageService {}

void main() {
  late MockStorageService mockStorageService;

  setUp(() {
    mockStorageService = MockStorageService();
  });

  group('HomePage :: listagem de local', () {
    testWidgets('Exibe a mensagem de nenhum local cadastro',
        (WidgetTester tester) async {
      when(() => mockStorageService.fetchPlaces()).thenAnswer((_) async => []);

      await tester.pumpWidget(
        MultiProvider(
          providers: Providers.all(
            storageService: [
              Provider<StorageService>(create: (_) => mockStorageService),
            ],
          ),
          child: const MainApp(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byKey(AppKeys.appTitle), findsOneWidget);
      expect(find.text(AppString.appTitle), findsOneWidget);
      expect(find.byKey(AppKeys.placesEmpty), findsOneWidget);
      expect(find.text(AppString.emptyPlaces), findsOneWidget);
      expect(find.byKey(AppKeys.places), findsNothing);
    });

    testWidgets('Exibe a lista de locais', (WidgetTester tester) async {
      when(() => mockStorageService.fetchPlaces())
          .thenAnswer((_) async => fakeStorage);

      await tester.pumpWidget(
        MultiProvider(
          providers: Providers.all(
            storageService: [
              Provider<StorageService>(create: (_) => mockStorageService),
            ],
          ),
          child: const MainApp(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byKey(AppKeys.appTitle), findsOneWidget);
      final firstPlaceSave = fakeStorage.first;
      final placeOne = find.byKey(
        AppKeys.placeItem(firstPlaceSave.id.toString()),
      );
      expect(placeOne, findsOneWidget);
    });
  });
}
