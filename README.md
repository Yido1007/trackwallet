# TrackWallet

Kişisel gelir–gider takibi için **Flutter** ile geliştirilmiş bir uygulama.  
Hızlı kayıt, kategori/bütçe yönetimi, grafikler ve (opsiyonel) dışa aktarma gibi temel özellikleri örneklemek amacıyla hazırlanmıştır.


## Özellikler
- ✅ **Gelir/Gider** kaydı ekleme, düzenleme, silme
- ✅ **Kategoriler** (ör. Market, Ulaşım, Eğlence) ve alt kategori desteği
- ✅ **Bütçe** tanımlama ve aşım uyarıları
- ✅ **Filtre/Sıralama** (tarih, tutar, kategori, tür)
- ✅ **Grafikler** (gün/hafta/ay harcama dağılımları)
- ✅ **Çoklu para birimi** ve sembol gösterimi
- ✅ **CSV dışa aktarma/içe aktarma** (opsiyonel)
- ✅ **Tema** (Açık/Koyu)
- ✅ Çoklu platform: Android, iOS, Web, (isteğe bağlı) masaüstü

##Ekran Görüntüleri

<p float="left">
  <img src="https://github.com/user-attachments/assets/3a504d5d-afd0-452e-8222-09403c3c1a44" width="240"/>
  <img src="https://github.com/user-attachments/assets/3777ebe8-b438-4359-a3a3-2ffb44b040ea" width="240"/>
  <img src="https://github.com/user-attachments/assets/37cf965e-3e02-442e-a000-5f25ee0dadc1" width="240"/>
  <img src="https://github.com/user-attachments/assets/49f6a304-2d85-4dbc-8ad9-9f592d19244c" width="240"/>
  <img src="https://github.com/user-attachments/assets/8f0973c4-1bb2-4b1e-a213-45df63c49544" width="240"/>
  <img src="https://github.com/user-attachments/assets/34f2582c-6de4-4ed0-93e3-03df18d67054" width="240"/>
  <img src="https://github.com/user-attachments/assets/f82c9f44-56cf-4b0c-8f4a-f3d686c724d5" width="240"/>
  <img src="https://github.com/user-attachments/assets/d06d6805-cb07-45f9-b5b6-16f61d005ffe" width="240"/>
  
</p>

## Veri Modeli
Basit bir örnek veri şeması:

```text
Transaction {
  id: String
  type: enum('income','expense')
  amount: num
  currency: String   # TRY, USD, EUR...
  categoryId: String
  note: String?
  date: DateTime
  tags: List<String>?
}

Category {
  id: String
  name: String
  parentId: String?   # alt kategori için
  color: int?         # 0xFF...
  icon: String?       # Material icon adı
}

Budget {
  id: String
  categoryId: String
  period: enum('monthly','weekly','custom')
  limit: num
  startDate: DateTime
}
```

> Uygulamada Hive/Sqflite kullanıyorsan adaptör ve tablo/box tanımlarını bu şemaya göre düzenleyebilirsin.

## Mimari ve Paketler
- **Flutter** çoklu platform
- Katmanlar: `UI` → `State/Model` → `Repository/Service`
- Durum yönetimi: _Provider / Riverpod / Bloc_ (projeye göre uyarlayın)
- Yerel depolama: _Hive / Sqflite / SharedPreferences_
- Tarih/format: _intl_
- Grafik: _fl_chart_ (veya alternatif)
- Dosya: _csv_, _path_provider_, _file_picker_ (opsiyonel dışa aktarma)

> Lütfen `pubspec.yaml`’daki gerçek paketlere göre bu kısmı netleştirin.

## Kurulum
1. **Flutter** kur (3.x+): <https://docs.flutter.dev/get-started/install>
2. Depoyu klonla:
   ```bash
   git clone https://github.com/Yido1007/trackwallet.git
   cd trackwallet
   ```
3. Bağımlılıkları indir:
   ```bash
   flutter pub get
   ```

## Çalıştırma
```bash
# cihazları listele
flutter devices

# varsayılan cihaza çalıştır
flutter run

# belirli platform
flutter run -d chrome   # Web
flutter run -d android  # Android
flutter run -d ios      # iOS
```

## Build
```bash
# Android
flutter build apk
flutter build appbundle

# iOS (release)
flutter build ios

# Web (release)
flutter build web
```

## Proje Yapısı
Tipik bir dizin düzeni (repoya göre uyarlayın):

```
trackwallet/
├─ lib/
│  ├─ main.dart
│  ├─ core/              # tema, renkler, sabitler, utils
│  ├─ data/
│  │  ├─ models/         # Transaction, Category, Budget
│  │  └─ repositories/   # repository arayüzleri/uygulamaları
│  ├─ services/          # local storage, csv, analytics
│  ├─ features/
│  │  ├─ dashboard/      # ana panel + grafikler
│  │  ├─ transactions/   # liste/ekleme/düzenleme
│  │  ├─ categories/     # kategori yönetimi
│  │  └─ budgets/        # bütçe ekranları
│  └─ widgets/           # ortak bileşenler
├─ assets/               # fonts, images, screenshots
├─ pubspec.yaml
└─ README.md
```

## Kalite (Lint/Format/Test)
```bash
# format
dart format .

# analiz
flutter analyze

# test
flutter test
```


## Yol Haritası
- [ ] Tekrarlayan işlemler (abonelikler)
- [ ] Raporlama & gelişmiş filtreler (tarih aralığı, etiket)
- [ ] Çoklu para birimi dönüştürme oranları
- [ ] iCloud/Google Drive ile yedekleme/senkronizasyon
- [ ] Widget/golden testler
- [ ] CI (GitHub Actions) + otomatik format/lint

## Katkı
Katkılar memnuniyetle kabul edilir!
1. Bir **issue** aç veya **fork**la.
2. Dal oluştur: `feat/kisa-aciklama`
3. Lint/testleri çalıştır.
4. Açıklayıcı bir PR gönder.
