# 🕌 Quran Data App - Flutter

Complete offline Quran application built with Flutter for Android and iOS.

## ✨ Features

| Feature | Description |
|---------|-------------|
| 📖 **114 Surahs** | Complete surah list with Arabic/English names, metadata |
| 🔍 **Smart Search** | Search verses in Arabic or English |
| 🎵 **Audio Playback** | Multiple reciters (Alafasy, Husary, Minshawi) |
| 🔖 **Bookmarks** | Save favorite verses with swipe-to-delete |
| 📍 **Sajda Tracking** | All 15 prostration verses (Obligatory/Recommended) |
| 📚 **Juz Navigation** | Browse Quran by 30 Juz parts |
| 🌙 **Dark Mode** | Automatic light/dark theme |
| 📴 **Offline First** | Works without internet after initial load |
| 📤 **Share** | Share verses via any app |
| ⚙️ **Settings** | Font size, translation toggle, reciter selection |

## 🏗️ Architecture (Clean Architecture + BLoC)

```
lib/
├── models/              # Data models
│   ├── surah_model.dart
│   ├── verse_model.dart
│   ├── sajda_model.dart
│   ├── reciter_model.dart
│   └── juz_model.dart
├── services/            # Business logic
│   ├── database_service.dart      # SQLite CRUD
│   ├── data_loader_service.dart   # JSON to SQLite
│   └── audio_service.dart         # Audio playback
├── blocs/               # State management (BLoC)
│   ├── surah_bloc.dart
│   ├── verse_bloc.dart
│   └── audio_bloc.dart
├── screens/             # UI screens
│   ├── splash_screen.dart
│   ├── home_screen.dart
│   ├── surah_list_screen.dart
│   ├── surah_detail_screen.dart
│   ├── search_screen.dart
│   ├── sajda_screen.dart
│   ├── juz_screen.dart
│   ├── bookmarks_screen.dart
│   └── settings_screen.dart
├── widgets/             # Reusable widgets
│   ├── audio_player_widget.dart
│   └── last_read_widget.dart
├── utils/               # Helpers
│   └── share_helper.dart
└── main.dart            # Entry point
```

## 🚀 Quick Start

### Prerequisites
```bash
flutter --version  # Requires Flutter 3.0+
dart --version     # Requires Dart 3.0+
```

### Installation
```bash
# 1. Navigate to project
cd flutter_quran_app

# 2. Get dependencies
flutter pub get

# 3. Run on device/emulator
flutter run

# 4. Or run with hot reload
flutter run --hot
```

### Build for Production
```bash
# Android APK (release)
flutter build apk --release

# Android App Bundle (for Play Store)
flutter build appbundle --release

# iOS (requires Mac + Xcode)
flutter build ios --release

# Or use build script
./build_android.sh
```

## 📦 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_bloc` | ^8.1.3 | State management |
| `sqflite` | ^2.3.0 | SQLite database |
| `path_provider` | ^2.1.1 | File system access |
| `just_audio` | ^0.9.36 | Audio streaming |
| `audio_session` | ^0.1.18 | Audio session handling |
| `google_fonts` | ^6.1.0 | Custom fonts |
| `share_plus` | ^7.2.1 | Share functionality |
| `scrollable_positioned_list` | ^0.3.8 | Verse navigation |
| `shimmer` | ^3.0.0 | Loading effects |

## 🗄️ Database Schema

```sql
-- 114 Surahs
CREATE TABLE surahs (
  number INTEGER PRIMARY KEY,
  name_ar TEXT, name_en TEXT,
  revelation_place TEXT,
  verses_count INTEGER,
  words_count INTEGER,
  letters_count INTEGER,
  juz_start INTEGER,
  page_start INTEGER,
  page_end INTEGER
);

-- 6236 Verses (structure ready)
CREATE TABLE verses (
  id INTEGER PRIMARY KEY,
  surah INTEGER,
  ayah INTEGER,
  juz INTEGER,
  page INTEGER,
  text_ar TEXT,
  text_en TEXT,
  sajda INTEGER
);

-- 15 Sajdas
CREATE TABLE sajdas (surah, ayah, type, description);

-- 5 Reciters
CREATE TABLE reciters (id, name_ar, name_en, riwaya, bitrate, base_url);

-- User Bookmarks
CREATE TABLE bookmarks (surah, ayah, created_at);
```

## 🎨 UI Screenshots

```
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│   Splash Screen │  │  Surah List     │  │  Surah Detail   │
│                 │  │  ┌───────────┐  │  │  ┌───────────┐  │
│   🕌 Quran      │  │  │ Al-Fatiha │  │  │  │ Bismillah │  │
│   Loading...    │  │  │ Al-Baqarah│  │  │  │ Alhamdul..│  │
│   ████████░░    │  │  │ Al-Imran  │  │  │  │ Iyyaka... │  │
│                 │  │  └───────────┘  │  │  └───────────┘  │
└─────────────────┘  └─────────────────┘  └─────────────────┘

┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│     Search      │  │     Juz Grid    │  │   Bookmarks     │
│  ┌───────────┐  │  │  ┌───┐ ┌───┐  │  │  ┌───────────┐  │
│  │ Search... │  │  │  │ 1 │ │ 2 │  │  │  │ Al-Baqarah│  │
│  └───────────┘  │  │  └───┘ └───┘  │  │  │ Ayah 255  │  │
│  Al-Rahman      │  │  ┌───┐ ┌───┐  │  │  │ [Delete]  │  │
│  Ar-Rahman...   │  │  │ 3 │ │ 4 │  │  │  └───────────┘  │
└─────────────────┘  └─────────────────┘  └─────────────────┘
```

## 🔧 Customization Guide

### 1. Add Full Quran Text
```bash
# Download from Tanzil.net (Uthmani script)
# Replace assets/data/verses_sample.json with full 6236 verses
# Run: flutter pub get && flutter run
```

### 2. Add More Reciters
Edit `assets/data/reciters.json`:
```json
{
  "id": "ar.new_reciter",
  "name_ar": "قارئ جديد",
  "name_en": "New Reciter",
  "riwaya": "Hafs An Asim",
  "bitrate": "128kbps",
  "base_url": "https://cdn.islamic.network/quran/audio/128/ar.new_reciter/"
}
```

### 3. Change Theme Colors
Edit `lib/main.dart`:
```dart
theme: ThemeData(
  primaryColor: const Color(0xFFYourColor),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFYourColor),
  ),
),
```

### 4. Add Translations
Add new JSON files in `assets/data/`:
```json
// translations/fr.json
{
  "verses": [
    {"surah": 1, "ayah": 1, "text": "Au nom d'Allah..."}
  ]
}
```

## 📱 Supported Platforms

| Platform | Status | Notes |
|----------|--------|-------|
| Android | ✅ Full | API 21+ |
| iOS | ✅ Full | iOS 12+ |
| Web | ⚠️ Partial | Audio limited |
| Windows | ⚠️ Partial | Untested |
| macOS | ⚠️ Partial | Untested |
| Linux | ⚠️ Partial | Untested |

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test
flutter test test/widget_test.dart
```

## 🐛 Troubleshooting

### Issue: Audio not playing
```bash
# Add to AndroidManifest.xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
```

### Issue: Database locked
```bash
# Clear app data or reinstall
flutter clean
flutter pub get
flutter run
```

### Issue: Fonts not loading
```bash
# Ensure fonts are in assets/fonts/
# Run: flutter pub get
# Restart app completely
```

## 📄 License

MIT License - Free for personal and commercial use.

```
Copyright (c) 2026 Quran Data App

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing`)
5. Open a Pull Request

## 🙏 Credits

- **Quran Text**: [Tanzil.net](https://tanzil.net) (Uthmani Script)
- **Translation**: Sahih International
- **Audio**: [Islamic Network CDN](https://alquran.cloud)
- **Fonts**: [Amiri Font](https://www.amirifont.org)

---

<div align="center">
  <strong>Made with ❤️ for the Ummah</strong>
  <br>
  <sub>May Allah accept this humble effort</sub>
</div>
