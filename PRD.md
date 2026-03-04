
# SaaS Todo Uygulaması - Ürün Gereksinimleri Dokümanı (PRD)

## 🎯 Yönetici Özeti

Bu doküman, kişisel ve ekip verimliliğini artırmayı hedefleyen, bulut tabanlı (SaaS) bir todo uygulaması geliştirmek için gerekli gereksinimleri detaylandırmaktadır. Uygulama, görev yönetimini basitleştirmek, etkili önceliklendirme sağlamak ve sorunsuz işbirliği sunmak amacıyla yapay zeka (AI) destekli özelliklerden faydalanacaktır. Bu PRD, yazılım ekibinin net bir yol haritası izlemesini sağlamak ve ürünün başarıyla piyasaya sürülmesini temin etmek için oluşturulmuştur.

## 👥 Hedef Kitle

*   **Bireyler:** Yoğun profesyoneller, öğrenciler ve zaman yönetimini iyileştirmek isteyen girişimciler.
*   **Ekipler:** Görev dağıtımı, ilerleme takibi ve proje yönetimi için işbirliği platformuna ihtiyaç duyan küçük ve orta ölçekli işletmeler.

## ✨ Temel Özellikler (Feature List)

*   **Akıllı Görev Oluşturma (AI-Powered Task Creation):**
    *   **Doğal Dil İşleme (NLP) Entegrasyonu:** Kullanıcının doğal dilde girdiği metinleri (örneğin, “Yarın sabah 9’da raporu bitir”) otomatik olarak görevlere dönüştürme yeteneği.
    *   **Varlık Tanıma (Entity Recognition):** Metinden tarihler, saatler, kişiler ve anahtar kelimeler gibi önemli bilgileri çıkarma.
    *   **Otomatik Son Tarih Ayarlama:** Görev tanımında yer alan tarih bilgisine göre otomatik son tarih atama ve kullanıcıya bu öneriyi sunma.
    *   **Kategori Önerileri:** Görev tanımına göre ilgili kategorileri (örneğin, "iş", "kişisel", "alışveriş") önerme.
    *   **Görev Önceliği Tahmini:** Görev içeriğine göre öncelik seviyesi (yüksek, orta, düşük) önerisi sunma.
*   **Akıllı Önceliklendirme (Intelligent Prioritization):**
    *   **Bağımlılık Analizi:** Görevler arasındaki bağımlılıkları (öncelik koşulları) belirleme ve önceliklendirme algoritmalarına dahil etme.
    *   **Önceliklendirme Algoritmaları:**
        *   **Son Tarih Önceliği:** En yakın son tarihe sahip görevleri önceliklendirme.
        *   **Önem-Aciliyet Matrisi:** Kullanıcının görevleri önem ve aciliyet derecesine göre sınıflandırmasına izin verme ve buna göre önceliklendirme.
        *   **Kullanıcı Tercihlerine Göre Öğrenme:** Kullanıcının geçmiş görev tamamlama alışkanlıklarını analiz ederek, gelecekteki görevler için kişiselleştirilmiş öncelik skorları oluşturma (Makine Öğrenimi).
    *   **Öncelik Sıralaması Güncellemesi:** Görevlerdeki değişikliklerin (son tarih, bağımlılık, kategori) otomatik olarak öncelik sıralamasını güncellemesini sağlama.
*   **İşbirliği Özellikleri (Collaborative Features):**
    *   **Paylaşılan Görev Listeleri:** Kullanıcıların projeler veya konulara göre görev listelerini diğer kullanıcılarla paylaşabilmesi.
    *   **Gerçek Zamanlı Güncellemeler (Real-time Updates):** Görevlerdeki değişikliklerin (durum, son tarih, açıklama) paylaşılan listedeki tüm kullanıcılara anında bildirilmesi.
    *   **Görev Ataması:** Görevleri belirli kullanıcılara atama ve takip etme.
    *   **Görev Üzerinden Yorumlar:** Görevlere yorum ekleyerek tartışma ve geri bildirim paylaşımı sağlama.
    *   **Bildirimler (Notifications):** Yeni görev atamaları, tamamlanan görevler veya güncellenen görevler hakkında e-posta veya uygulama içi bildirimler gönderme.
*   **İlerleme Takibi ve Raporlama (Progress Tracking & Reporting):**
    *   **Görsel Göstergeler (Visual Dashboards):** Görev tamamlanma oranlarını, geciken görevleri ve takım performansını gösteren grafikler ve tablolar.
    *   **Görev Durumu Filtreleme:** Görevleri duruma göre filtreleme (örneğin, "yapılacak", "devam ediyor", "tamamlandı").
    *   **Rapor Oluşturma:**  Belirli bir zaman aralığı için görev tamamlama raporları oluşturma (CSV, PDF formatlarında dışa aktarma).
    *   **Proje İlerleme Takibi:** Projeler için genel ilerleme takibi ve kilometre taşı belirleme.
*   **Güvenlik ve Veri Yönetimi:**
    *   **Güvenli Kullanıcı Kimlik Doğrulaması:** Şifre politikaları, iki faktörlü kimlik doğrulama (2FA) desteği.
    *   **Veri Şifreleme:** Verilerin hem aktarım sırasında (HTTPS) hem de depolanırken (AES-256 gibi) şifrelenmesi.
    *   **Veri Yedekleme:** Periyodik veri yedekleme stratejisi uygulaması.

## 💰 Gelir Modeli

*   **Freemium:** Temel özellikler (sınırlı sayıda görev, temel önceliklendirme, tek kullanıcı) ücretsiz olarak sunulacak.
*   **Abonelik Tabanlı (Subscription-based):**
    *   **Bireysel Premium:** Daha fazla görev sayısı, gelişmiş AI özellikleri, öncelikli destek.
    *   **Takım Premium:** İşbirliği özellikleri (paylaşılan listeler, görev ataması), gelişmiş raporlama, daha fazla depolama alanı.
    *   **Fiyatlandırma:** Aylık veya yıllık abonelik seçenekleri sunulacak. Fiyatlandırma, pazar araştırması ve rekabet analizi ile belirlenecek.
*   **Kurumsal (Enterprise):** Büyük kuruluşlar için özelleştirilmiş çözümler, özel entegrasyonlar, öncelikli destek ve SLA (Hizmet Seviyesi Anlaşması) sunulacak. Fiyatlandırma özel olarak teklif verilecektir.

## 🚀 MVP Kapsamı

MVP, ilk sürümde aşağıdaki temel işlevlere odaklanacaktır:

*   **Akıllı Görev Oluşturma:** Temel kategorizasyon ile birlikte (iş, kişisel, alışveriş).
*   **Görev Önceliklendirme:** Sadece son tarihe dayalı önceliklendirme.
*   **Tek Kullanıcılı Görev Yönetimi:** Temel takvim entegrasyonu (Google Takvim ve Outlook Takvim ile senkronizasyon).
*   **Paylaşılan Görev Listeleri:** Sadece herkese açık görev listeleri oluşturma ve paylaşma imkanı (izin kontrolü olmadan).
*   **Güvenli Kullanıcı Kimlik Doğrulaması ve Veri Şifreleme:** Temel güvenlik standartları.

**MVP Kapsamına Dahil Olmayanlar:**

*   AI destekli gelişmiş önceliklendirme algoritmaları.
*   Ekip işbirliği özellikleri (görev ataması, yorumlar, bildirimler).
*   Detaylı raporlama ve analizler.
*   Kurumsal özellikler.
*   Mobil uygulama (web uygulaması öncelikli).

## 📝 Kullanıcı Hikayeleri

*   **Birey olarak**, yeni bir görev eklemek istiyorum, böylece yapmam gerekenleri not alabilirim.
*   **Birey olarak**, görevime bir son tarih belirlemek istiyorum, böylece zamanımı daha iyi yönetebilirim.
*   **Birey olarak**, görevlerime kategori eklemek istiyorum, böylece görevlerimi düzenleyebilirim.
*   **Birey olarak**, görevlerimi son tarihlerine göre sıralamak istiyorum, böylece en önemli görevlere odaklanabilirim.
*   **Birey olarak**, takvimimle senkronize olan görevler görmek istiyorum, böylece planlarımı takip edebilirim.
*   **Takım Üyesi olarak**, bir görevi bir ekip arkadaşıma atamak istiyorum, böylece sorumlulukları dağıtabilirim.
*   **Takım Üyesi olarak**, paylaşılan bir görev listesine erişmek istiyorum, böylece proje ilerlemesini takip edebilirim.
*   **Takım Lideri olarak**, takım üyelerimin görev tamamlanma oranlarını görmek istiyorum, böylece performansı değerlendirebilirim.
*   **Yönetici olarak**, verilerin güvenli bir şekilde saklandığından emin olmak istiyorum, böylece gizliliğimi koruyabilirim.
*   **Herhangi bir kullanıcı olarak**, güvenli bir şekilde giriş yapmak istiyorum, böylece hesabıma yetkisiz erişimin önüne geçebilirim.
