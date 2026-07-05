# تحديثات التطبيق — Changelog v2.0

## ✅ الملفات الجديدة / Nouveaux fichiers

### `lib/services/prayer_service.dart`
- خدمة مواقيت الصلاة عبر API AlAdhan
- Service de calcul des horaires via l'API AlAdhan (gratuite)
- Calcul de la prochaine prière + temps restant

### `lib/pages/prayer_page.dart`  
- صفحة مواقيت الصلاة الكاملة
- Grille des 6 temps (Fajr, Shurouq, Dhuhr, Asr, Maghrib, Isha)
- Bannière prochaine prière avec countdown
- Date hijri + grégorienne
- Sélecteur de 10 villes (Algérie + France + Arabie)

### `lib/utils/app_localizations.dart`
- نظام الترجمة العربي/الفرنسي
- 50+ clés traduites AR ↔ FR
- Sauvegarde du choix via SharedPreferences

## ✅ الملفات المعدّلة / Fichiers modifiés

### `lib/pages/quran_page.dart`
- ➕ onglet **Sourates** + onglet **Juz'** (inspiré Quran-Flutter)
- ➕ Badge Juz' sur chaque ligne de sourate
- ➕ Vue groupée par Juz' avec ExpansionTile
- ➕ Support multilingue (titres AR/FR)

### `lib/widgets/bottom_nav.dart`
- ➕ Nouvel onglet **مواقيت الصلاة / Prières** (index 2, bleu)
- Tab Tarteel remplacé par Prière (fonctionnalité plus utile)
- Labels dynamiques selon la langue

### `lib/main.dart`
- ➕ Provider `AppLocalizations`
- ➕ Routing vers `PrayerPage` (index 2)
- ➕ FAB 🌐 sur l'accueil pour changer de langue
- ➕ BottomSheet sélecteur de langue AR / FR

### `pubspec.yaml`
- Version bumped à 2.0.0+2

## 🔌 API utilisées
| API | Usage | Gratuit |
|-----|-------|---------|
| api.aladhan.com | Horaires de prière | ✅ |
| api.quran.com | Texte & traductions | ✅ |
| verses.quran.com | Audio MP3 | ✅ |
