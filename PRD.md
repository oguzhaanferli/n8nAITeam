
```markdown
# SaaS Todo Uygulaması - Ürün Gereksinim Dokümanı (PRD)

## 🎯 Yönetici Özeti (Executive Summary)

Bu doküman, kişisel ve ekip üretkenliğini artırmak üzere tasarlanmış, yapay zeka destekli bir SaaS (Software as a Service) todo uygulaması geliştirilmesini tanımlamaktadır. Uygulama, görev yönetimini basitleştirecek, etkili önceliklendirme yapacak ve kusursuz işbirliği imkanı sunacaktır. Amaç, kullanıcıların görevlerini daha verimli bir şekilde tamamlamalarını sağlayarak zaman yönetimi becerilerini geliştirmelerine yardımcı olmaktır.

## 👥 Hedef Kitle (Target Audience)

*   **Bireysel Kullanıcılar:** Yoğun çalışan profesyoneller, öğrenciler ve iş kuranlar; günlük görevlerini düzenlemek ve zaman yönetimi becerilerini geliştirmek isteyenler.
*   **Ekip Kullanıcıları:** Görev atama, ilerleme takibi ve proje yönetimi için işbirliğine dayalı bir platforma ihtiyaç duyan küçük ve orta ölçekli işletmeler.

## ✨ Temel Özellikler (Feature List)

### 1. Akıllı Görev Oluşturma (Smart Task Creation)

*   **Doğal Dil İşleme (NLP) Motoru:** Kullanıcının serbest metin girdilerini (örneğin: "Yarın sabah 9'da müşteri toplantısı için sunumu hazırla") yapılandırılmış görevlere dönüştürmelidir.
*   **Varlık Tanıma:** Görev metninden tarih, saat, kişi, proje vb. varlıkları otomatik olarak çıkarmalıdır.
*   **Otomatik Son Tarih Atama:** Görev açıklamasında belirtilen tarihe göre otomatik olarak son tarih atanmalıdır. Tarih belirtilmemişse, kullanıcıya son tarih belirleme sorusu sorulmalıdır.
*   **Kategori/Etiket Önerisi:** NLP motoru, görev içeriğine göre otomatik olarak kategori/etiket önermelidir. Kullanıcı bu önerileri kabul edebilir, reddedebilir veya kendisi yeni etiketler ekleyebilir.
*   **Görev Önceliği Ayarı (Başlangıç Seviyesi):**  Görevi Oluştururken öncelik seviyesi seçme imkanı (Yüksek, Orta, Düşük).
*   **Teknik Gereksinimler:** Python, TensorFlow/PyTorch (NLP için), RESTful API.

### 2. Akıllı Önceliklendirme (Intelligent Prioritization)

*   **Görev Bağımlılıkları:** Kullanıcıların görevler arasında bağımlılıklar (öncelik sırası) belirleyebilmesi (örneğin, "Görev B, Görev A tamamlandıktan sonra başlayabilir").
*   **Öncelik Algoritması:** Görevlerin son tarihlerini, bağımlılıklarını ve kullanıcı tercihlerini (gelecek özelliklerde öğrenilen davranışlar) göz önünde bulundurarak bir öncelik sıralaması oluşturmalıdır.
*   **Dinamik Sıralama:** Görevler tamamlandıkça veya yeni görevler eklendikçe öncelik sıralaması otomatik olarak güncellenmelidir.
*   **Kullanıcı Ağırlıklandırması:** Kullanıcıların farklı görevlere farklı ağırlıklar verme imkanı (gelecek özelliklerde).
*   **Teknik Gereksinimler:**  Veritabanı (PostgreSQL/MongoDB), Algoritma geliştirme (Python), RESTful API.

### 3. İşbirliği Özellikleri (Collaborative Features)

*   **Paylaşımlı Görev Listeleri:** Kullanıcıların görev listelerini diğer kullanıcılarla paylaşabilmesi.
*   **Gerçek Zamanlı Güncellemeler:** Görev listesindeki değişikliklerin (yeni görev ekleme, görev atama, görev durumu güncelleme) tüm paylaşılan kullanıcılar tarafından gerçek zamanlı olarak görülebilmesi (WebSockets).
*   **Görev Ataması:** Kullanıcıların görevleri diğer kullanıcılara atayabilmesi.
*   **Yorumlar ve Tartışmalar:** Görevler altında yorum yapabilme ve tartışma başlatabilme imkanı.
*   **Teknik Gereksinimler:**  WebSockets, RESTful API, Kullanıcı Yönetimi Sistemi.

### 4. İlerleme Takibi ve Raporlama (Progress Tracking & Reporting)

*   **Görsel Gösterge Paneli (Dashboard):** Toplam görev sayısı, tamamlanan görev sayısı, bekleyen görev sayısı, geciken görev sayısı gibi temel metrikleri gösteren bir gösterge paneli.
*   **Görev Durumu Görselleştirmesi:** Görevlerin durumunu (başlamadı, devam ediyor, tamamlandı, iptal edildi) görsel olarak gösteren grafikler ve tablolar.
*   **Ekip Performans Raporları:** Ekip üyelerinin tamamladığı görev sayısı, ortalama görev tamamlama süresi gibi metrikleri gösteren raporlar.
*   **Teknik Gereksinimler:**  Veritabanı, Grafik kütüphaneleri (Chart.js, D3.js), Raporlama motoru.

## 💰 Gelir Modeli (Revenue Model)

*   **Freemium:** Temel özellikler (akıllı görev oluşturma, temel önceliklendirme, sınırlı sayıda paylaşımlı liste) ücretsiz olarak sunulur.
*   **Premium:**
    *   **Bireysel Premium:** Gelişmiş AI fonksiyonları (daha detaylı önceliklendirme, otomatik etiket önerileri), artırılmış depolama alanı, gelişmiş takvim entegrasyonu. (Aylık/Yıllık)
    *   **Ekip Premium:** Bireysel Premium özelliklerinin yanı sıra, sınırsız sayıda ekip üyesi, gelişmiş ekip raporları, özel markalama seçenekleri. (Kullanıcı Sayısına Göre Fiyatlandırma – Aylık/Yıllık)
*   **Kurumsal:** Büyük organizasyonlar için özelleştirilmiş çözümler ve özel destek. (Fiyatlandırma, özel gereksinimlere göre belirlenir.)

## 🚀 MVP Kapsamı (MVP Scope)

MVP'nin amacı, temel işlevselliği kanıtlamak ve erken kullanıcı geri bildirimi almaktır.

*   **Akıllı Görev Oluşturma (Temel Seviye):**  Temel NLP desteğiyle görev oluşturma, otomatik son tarih atama, temel kategori belirleme.
*   **Görev Önceliklendirmesi (Son Tarihe Göre):** Görevleri yalnızca son tarihe göre sıralama.
*   **Tek Kullanıcılı Görev Yönetimi:**  Tek kullanıcının görevlerini oluşturup yönetebileceği, tamamlayabileceği bir arayüz.
*   **Temel Takvim Entegrasyonu:** Görevlerin temel bir takvim uygulamasına (örneğin Google Takvim) aktarılabilmesi. (Sadece okuma, görevden takvime)
*   **Paylaşımlı Görev Listeleri (Kamuya Açık):**  Herkese açık olarak paylaşılabilecek temel görev listeleri. (Tamamen kamuya açık, gizlilik kontrolü yok)
*   **Güvenli Kullanıcı Kimlik Doğrulaması ve Veri Şifrelemesi:** Kullanıcı verilerinin güvenliği için temel kimlik doğrulama (e-posta/şifre) ve veri şifreleme.
*   **Platform:** Web Arayüzü (Responsive Tasarım)

## 📝 Kullanıcı Hikayeleri (User Stories)

*   Bir **busy professional** olarak, görevimi doğal dilde yazarak ekleyebildiğimde, görevleri manuel olarak girmeye harcadığım zamanı azaltabilirim.
*   Bir **student** olarak, ödevlerime son tarih belirleyebildiğimde, önemli teslim tarihlerini kaçırmama engel olabilirim.
*   Bir **entrepreneur** olarak, görevlerime kategori ekleyebildiğimde, projelerimi organize tutabilirim.
*   Bir **bireysel kullanıcı** olarak, görevlerime öncelik verebildiğimde, en önemli görevlere odaklanabilirim.
*   Bir **ekip üyesi** olarak, görev listelerini diğer ekip üyeleriyle paylaşabildiğimde, işbirliği yapabilir ve görev paylaşımını kolaylaştırabilirim.
*   Bir **proje yöneticisi** olarak, ekibimin ilerlemesini görsel olarak takip edebildiğimde, darboğazları belirleyebilir ve projeyi başarıyla tamamlayabilirim.
*   Bir **kullanıcı** olarak, güvenli bir şekilde giriş yapabildiğimde, kişisel verilerimin korunacağından emin olabilirim.
*   Bir **kullanıcı** olarak, görevlerimi takvimimle senkronize edebildiğimde, tüm planlarımı tek bir yerde görebilirim.
*   Bir **kullanıcı** olarak, herkese açık bir görev listesi oluşturabildiğimde, belirli projelerde toplulukla işbirliği yapabilirim.
```