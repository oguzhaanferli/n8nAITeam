
# SaaS Todo Uygulaması Ürün Gereksinim Dokümanı (PRD)

## 🎯 Yönetici Özeti (Executive Summary)

Bu doküman, kişisel ve ekip üretkenliğini artırmayı hedefleyen, bulut tabanlı (SaaS) bir yapılacaklar listesi uygulaması geliştirilmesine yöneliktir. Uygulama, görev yönetimini basitleştirmek, önceliklendirmeyi optimize etmek ve kusursuz iş birliği sağlamak için yapay zeka (AI) destekli özelliklerden faydalanacaktır. Freemium gelir modeliyle başlayıp aboneliklere ve kurumsal çözümlere uzanan bir strateji izlenecektir. Minimum Uygulanabilir Ürün (MVP), temel görev oluşturma, önceliklendirme, tek kullanıcı yönetimi ve temel iş birliği özelliklerine odaklanacaktır.

## 👥 Hedef Kitle (Target Audience)

*   **Bireyler:** Yoğun profesyoneller, öğrenciler, girişimciler; günlük iş akışlarını düzenlemek ve zaman yönetimini iyileştirmek isteyenler.
*   **Takımlar:** Görev atama, ilerleme takibi ve proje yönetimi için iş birliği platformuna ihtiyaç duyan küçük ve orta ölçekli işletmeler.

## ✨ Temel Özellikler (Feature List): MVP için Gerekenler

*   **Kullanıcı Yönetimi:**
    *   Kayıt (E-posta/Sosyal Hesaplar): Güvenli kayıt ve doğrulama mekanizması.
    *   Giriş (E-posta/Sosyal Hesaplar): Güvenli giriş ve oturum yönetimi.
    *   Profil Yönetimi: Kullanıcı profilini güncelleme (ad, e-posta, profil fotoğrafı).
    *   Şifre Sıfırlama: Güvenli şifre sıfırlama süreci.
*   **Görev Yönetimi:**
    *   Görev Oluşturma: Görev adı, açıklama, bitiş tarihi, öncelik seviyesi (yüksek, orta, düşük) tanımlama.
    *   Görev Düzenleme: Mevcut görevleri güncelleme (ad, açıklama, bitiş tarihi, öncelik).
    *   Görev Silme: Görevleri kalıcı olarak silme.
    *   Görev Tamamlama: Görevleri tamamlanmış olarak işaretleme ve arşivleme.
    *   Kategoriler/Etiketler: Görevleri kategorilere veya etiketlere ayırma (örn: İş, Kişisel, Alışveriş).
    *   Alt Görevler (Subtasks): Ana görevleri daha küçük, yönetilebilir parçalara ayırma.
    *   Tekrarlayan Görevler (Recurring Tasks): Belirli aralıklarla otomatik olarak oluşturulan görevler (günlük, haftalık, aylık).
*   **AI Destekli Görev Oluşturma:**  (Basit Sürüm)
    *   Doğal Dil İşleme (NLP): Kullanıcının yazdığı metni analiz ederek görev adı, açıklama ve bitiş tarihi önerileri sunma.
    *   Kategori Önerileri: Görev içeriğine göre otomatik kategori veya etiket önerileri.
*   **Önceliklendirme:**
    *   Bitiş Tarihine Göre Önceliklendirme: Görevleri bitiş tarihine göre otomatik olarak sıralama.
    *   Manuel Önceliklendirme: Kullanıcının görevlere manuel olarak öncelik ataması yapabilmesi.
*   **Takvim Entegrasyonu (Temel):**
    *   Google Calendar Entegrasyonu: Tamamlanan ve devam eden görevleri Google Takvime aktarım (yalnızca entegrasyon, senkronizasyon değil).
*   **İş Birliği (Temel):**
    *   Paylaşılabilir Görev Listeleri (Public Lists): Kullanıcının görev listelerini herkesin görebileceği şekilde paylaşabilmesi. (Salt okunur)
*   **Veri Güvenliği:**
    *   SSL Şifreleme: Veri aktarımının güvenli bir şekilde şifrelenmesi.
    *   Veri Yedekleme: Düzenli veri yedekleme mekanizması.
*   **Arayüz (UI):**
    *   Duyarlı Tasarım (Responsive Design): Farklı cihazlarda (masaüstü, tablet, mobil) uyumlu arayüz.
    *   Basit ve Kullanıcı Dostu Arayüz: Kolayca anlaşılabilir ve kullanılabilir tasarım.

## 💰 Gelir Modeli (Revenue Model)

*   **Freemium:** Temel özellikler (yukarıda listelenen MVP özellikleri) ücretsiz olarak sunulur.
*   **Abonelik Tabanlı:**
    *   **Premium Bireysel:** Gelişmiş AI özellikleri, daha fazla depolama alanı,  otomatik görev önceliklendirme algoritmaları.
    *   **Premium Takım:** Ekip iş birliği özellikleri (yorumlar, görev atamaları, ekip ilerleme takibi), gelişmiş raporlama.
    *   Aylık ve Yıllık abonelik seçenekleri sunulur.
*   **Kurumsal:** Büyük ölçekli kuruluşlar için özelleştirilmiş çözümler, özel destek ve entegrasyonlar.

## 🚀 MVP Kapsamı (MVP Scope)

MVP'nin temel amacı, çekirdek kullanıcı deneyimini doğrulamak ve erken kullanıcı geri bildirimlerini toplamaktır. Bu nedenle aşağıdaki özellikler kesinlikle dahil edilmelidir:

*   Kullanıcı Kaydı/Girişi ve Profil Yönetimi
*   Görev Oluşturma, Düzenleme, Silme ve Tamamlama
*   Kategoriler/Etiketler
*   Bitiş Tarihine Göre Önceliklendirme
*   AI Destekli Temel Görev Oluşturma (basit öneriler)
*   Google Calendar ile Temel Entegrasyon (aktarım)
*   Paylaşılabilir Görev Listeleri (Salt okunur)
*   Güvenli Veri Depolama (SSL, Yedekleme)

**Kapsam Dışı:**

*   Gelişmiş AI algoritmaları (otomatik önceliklendirme, akıllı öneriler).
*   Ekip iş birliği özellikleri (yorumlar, atamalar).
*   Gelişmiş Takvim Entegrasyonu (senkronizasyon).
*   Mobil Uygulamalar (sadece web uygulaması).
*   Raporlama ve Analizler.

## 📝 Kullanıcı Hikayeleri (User Stories)

*   Bir **Birey** olarak, kolayca bir görev oluşturmak istiyorum, böylece yapılacak işlerimi hızlıca listeleyebilirim.
*   Bir **Birey** olarak, görevlere bitiş tarihi eklemek istiyorum, böylece zaman yönetimi konusunda daha bilinçli olabilirim.
*   Bir **Birey** olarak, görevleri kategorilere ayırmak istiyorum, böylece işlerimi organize edebilirim.
*   Bir **Birey** olarak, görevlere öncelik atamak istiyorum, böylece en önemli işlerime odaklanabilirim.
*   Bir **Birey** olarak, tamamladığım görevleri işaretlemek istiyorum, böylece ilerlememi takip edebilirim.
*   Bir **Birey** olarak, Google Takvimime görevlerimi aktarmak istiyorum, böylece tüm planlarımı tek bir yerde görebilirim.
*   Bir **Kullanıcı** olarak, doğal dil ile görev oluşturmak istiyorum, böylece daha hızlı ve kolay bir şekilde görev ekleyebileyim.
*   Bir **Takım Üyesi** olarak, bir görevi başkasıyla paylaşmak istiyorum, böylece iş birliği içinde çalışabiliriz.
*   Bir **Takım Lideri** olarak, paylaşılan bir görev listesini görmek istiyorum, böylece ekibimin ne üzerinde çalıştığını takip edebilirim.
*   Bir **Kullanıcı** olarak, güvenli bir şekilde kayıt olmak ve giriş yapmak istiyorum, böylece kişisel verilerimin güvende olduğundan emin olabilirim.
