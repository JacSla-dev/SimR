# Instrukcje

**English version available at the bottom of this document.**

## Instrukcje

Wklej folder `10_Scenario_TLK_Krk_Suw` do ścieżki `..\SteamLibrary\steamapps\common\SimRail\SimRail_Data\StreamingAssets\Sceneries\3_Krakow\Scenarios\\`.

## Scenariusz

- TLK Wigry z Krakowa do Suwałk;
- Bazuje na istniejącym scenariuszu **07_Scenario_EIP_Krk_Wwa**, w którym wprowadzono modyfikacje;
- Dodano dodatkowe postoje na stacjach:
  - Kraków Batowice
  - Miechów
  - Kozłów
  - Włoszczowa Północ
  - Opoczno
  - Grodzisk Mazowiecki
- Przygotowano nowy plik ze składami AI, pozbawiony nowszych jednostek (takich jak ED250 czy Dragony), aby scenariusz lepiej oddawał realia wcześniejszych lat.
- Po dojechaniu na stację Warszawa Wschodnia podsumowanie scenariusza pojawia się po upływie ok. 5 minut (ja tam lubię sobie pooglądać skład po długiej drodze, przed podsumowaniem).

## Błędy/Feature

- W najbliższym czasie planowana jest korekta rozkładu jazdy.
- Uwzględnić w nr pociągu przynależność do obszarów konstrukcyjnych.

## Fixy

- Dodano referencje do angielskich dźwięków, które odwołują się do polskich odpowiedników, aby zapobiec zatrzymaniu działania skryptu Lua w przypadku napotkania brakującego dźwięku (v1.2.1).
- Wyłączono debug mode w pliku Lua.
- Poprawiony błędny rozkład w Zastowie.
- Wszystkie pliki locals znajdują się w folderze ze scenariuszem, przez co nie ma potrzeby aktualizowania po update'cie symulatora.
- Poprawiono format komunikatów radiowych.

## Komunikaty radiowe

- Wykorzystano darmowe syntezatory mowy, co może wpłynąć na jakość komunikatów.

## Podziękowania

... i pozdrowienia dla zespołu SimRail za wkład włożony w rozwój symulatora oraz możliwości do tworzenia modyfikacji.

---

# Instructions

## Instructions

Paste the folder `10_Scenario_TLK_Krk_Suw` into the path `..\SteamLibrary\steamapps\common\SimRail\SimRail_Data\StreamingAssets\Sceneries\3_Krakow\Scenarios\\`.

## Scenario

- TLK Wigry from Krakow to Suwalki;
- Based on the existing scenario **07_Scenario_EIP_Krk_Wwa**, with modifications;
- Additional stops added at the stations:
  - Kraków Batowice
  - Miechów
  - Kozłów
  - Włoszczowa Północ
  - Opoczno
  - Grodzisk Mazowiecki
- A new AI consist file was prepared, excluding newer units (such as ED250 or Dragony) to better reflect the earlier era.
- After arriving at Warsaw East station, the scenario summary appears approximately 5 minutes later (I like to watch the consist after a long journey before the summary).

## Bugs/Features

- Schedule adjustments are planned soon.
- Include train number assignments reflecting construction areas.

## Fixes

- Added references to English sounds pointing to their Polish equivalents to prevent Lua script crashes when encountering missing sounds (v1.2.1).
- Disabled debug mode in the Lua file.
- Corrected an erroneous schedule in Zastow.
- All local files are now located in the scenario folder, so no updates are needed after simulator updates.
- Improved the format of radio messages.

## Radio Messages

- Free speech synthesizers were used, which may affect the quality of messages.

## Acknowledgments

... and greetings to the SimRail team for their contribution to the development of the simulator and enabling modifications.
