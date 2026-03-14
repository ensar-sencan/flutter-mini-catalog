#  Mini Katalog Uygulaması

Flutter ile geliştirilmiş, eğitim amaçlı bir ürün kataloğu mobil uygulaması.

##  Ekranlar

| Ana Sayfa | Ürün Detayı | Sepet |
|-----------|-------------|-------|
| Ürün listesi, arama, kategori filtresi | Tam açıklama, özellikler, sepet butonu | Miktar kontrolü, toplam fiyat, sipariş |

##  Özellikler

-  **Arama**: Ürün adı ve açıklamasına göre anlık arama
-  **Kategori Filtresi**: Kategoriye göre filtreleme
-  **Sepet Yönetimi**: Ürün ekle/çıkar, miktar artır/azalt
-  **API Entegrasyonu**: wantapi.com'dan gerçek veri çekimi (offline fallback destekli)
-  **Pull to Refresh**: Listeyi yenilemek için aşağı çek
-  **Material 3 UI**: Modern tasarım dili

##  Proje Yapısı

```
lib/
├── main.dart                    # Uygulama giriş noktası
├── models/
│   ├── product.dart             # Ürün veri modeli (fromJson/toJson)
│   └── cart.dart                # Sepet modeli ve mantığı
├── screens/
│   ├── home_screen.dart         # Ana sayfa (GridView, arama, banner)
│   ├── product_detail_screen.dart # Ürün detay ekranı
│   └── cart_screen.dart         # Sepet ekranı
├── services/
│   └── api_service.dart         # HTTP istekleri, API entegrasyonu
└── widgets/
    └── product_card.dart        # Yeniden kullanılabilir ürün kartı widget'ı
```

## 🛠️ Kullanılan Teknolojiler

- **Flutter SDK**: >=3.0.0
- **Dart SDK**: >=3.0.0
- **Paketler**:
  - `http: ^1.1.0` — API istekleri
  - `cached_network_image: ^3.3.0` — Görsel önbellekleme

##  Çalıştırma Adımları

### Gereksinimler
- Flutter SDK (3.0.0 veya üzeri)
- Android Studio + Android Emulator **veya** fiziksel Android cihaz
- VS Code (önerilen)

### Kurulum

```bash
# 1. Projeyi klonla
git clone https://github.com/KULLANICI_ADIN/mini_katalog.git
cd mini_katalog

# 2. Bağımlılıkları yükle
flutter pub get

# 3. Emülatör veya cihazın bağlı olduğunu kontrol et
flutter devices

# 4. Uygulamayı çalıştır
flutter run
```

### Build (APK)

```bash
flutter build apk --release
```

APK dosyası: `build/app/outputs/flutter-apk/app-release.apk`

## 📚 Öğrenilen Konular

Bu proje aşağıdaki Flutter konularını kapsamaktadır:

-  Stateless & Stateful Widget
-  Widget ağacı ve setState()
-  Navigator.push / pop ile sayfa geçişleri
-  Route Arguments (constructor ile veri taşıma)
-  GridView.builder ve ListView.builder
-  JSON veri modeli (fromJson / toJson)
-  HTTP ile API isteği (http paketi)
-  CustomScrollView + SliverAppBar
-  Arama ve filtreleme mantığı
-  Basit state yönetimi (sepet simülasyonu)
-  Asset yönetimi

##  Geliştirici

**[Ensar Şencan]**  
Flutter Projesi
