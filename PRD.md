
# SaaS Todo Uygulaması - Ürün Gereksinim Dokümanı (PRD)

## 🎯 Yönetici Özeti (Executive Summary)

Bu doküman, kişisel ve ekip verimliliğini artırmak amacıyla tasarlanmış, bulut tabanlı (SaaS) bir yapılacaklar listesi (Todo) uygulamasının geliştirilmesi için gereksinimleri tanımlamaktadır. Uygulama, görev yönetimini basitleştirmek, etkili önceliklendirme sağlamak ve kusursuz işbirliği sunmak için yapay zeka (YZ) özelliklerinden faydalanacaktır. Ürün, hem bireysel kullanıcılara hem de küçük ve orta ölçekli işletmelere (KOBİ) hitap edecek şekilde tasarlanmıştır. Gelir modeli, freemium ve abonelik tabanlı katmanlar ile kurumsal çözümler sunarak çeşitli ihtiyaçları karşılayacaktır. Minimum Uygulanabilir Ürün (MVP), temel YZ destekli görev oluşturma, önceliklendirme ve kullanıcı yönetimi özelliklerine odaklanacaktır.

## 👥 Hedef Kitle (Target Audience)

*   **Bireysel Kullanıcılar:** Yoğun profesyoneller, öğrenciler, girişimciler; günlük görevlerini düzenlemek ve zaman yönetimini iyileştirmek isteyenler.
*   **Ekip Kullanıcıları:** Görev dağıtımı, ilerleme takibi ve proje yönetimi için işbirlikçi bir platforma ihtiyaç duyan KOBİ'ler.

## ✨ Temel Özellikler (Feature List)

*   **Kullanıcı Yönetimi:**
    *   Kayıt ve giriş (e-posta/şifre, üçüncü taraf kimlik doğrulama - Google, Microsoft).
    *   Profil yönetimi (ad, e-posta, şifre değişikliği).
    *   Rol tabanlı erişim kontrolü (gelecek geliştirmeler için altyapı).
*   **Görev Oluşturma (Smart Task Creation):**
    *   Doğal Dil İşleme (NLP) entegrasyonu: Kullanıcının yazdığı doğal dildeki metni, görev detaylarına (isim, son tarih, açıklama, etiketler) dönüştürme.
    *   Otomatik son tarih belirleme: Görev tanımındaki ipuçlarından son tarihi çıkarabilme (örneğin, "yarın yapılacak", "önümüzdeki hafta sonu").
    *   Kategorizasyon/Etiketleme: Görevleri kategorilere ayırma ve etiketleme olanağı (manuel ve YZ destekli).
    *   Tekrarlayan Görevler: Günlük, haftalık, aylık veya özel aralıklarla tekrarlayan görevler oluşturma.
*   **Görev Önceliklendirme (Intelligent Prioritization):**
    *   Son tarihe göre önceliklendirme.
    *   Görev bağımlılıklarını belirleme ve buna göre önceliklendirme (Aşağıdaki maddelerin tamamlanmasına bağlı olarak).
    *   Kullanıcı tercihlerine göre önceliklendirme (kullanıcının geçmiş davranışlarına göre öğrenme).
    *   Önceliklendirme algoritmalarını ayarlama (kullanıcının kontrolünde).
    *   Yüksek, Orta, Düşük öncelik seviyeleri.
*   **Görev Yönetimi:**
    *   Görev listesi görüntüleme (liste, takvim, Kanban).
    *   Görev durumu güncelleme (Yapılacak, Devam Ediyor, Tamamlandı, İptal Edildi).
    *   Görev açıklamaları ve notlar ekleme.
    *   Dosya ekleme (görevle ilgili belgeler, resimler vb.).
    *   Alt görevler (subtasks) oluşturma.
*   **İşbirliği Özellikleri (Collaborative Features):**
    *   Görev listelerini paylaşma (okuma/yazma erişimi belirleme).
    *   Görevlere yorum ekleme.
    *   Görev ataması (kullanıcılara görev atama).
    *   Gerçek zamanlı güncellemeler (anında bildirimler).
*   **İlerleme Takibi ve Raporlama (Progress Tracking & Reporting):**
    *   Kişisel ilerleme göstergeleri (tamamlanan görevler, geciken görevler vb.).
    *   Ekip ilerleme göstergeleri (ekip genelinde tamamlanan görevler, geciken görevler vb.).
    *   Grafiksel raporlar (isteğe bağlı).
*   **Entegrasyonlar:**
    *   Takvim entegrasyonu (Google Calendar, Outlook Calendar).
    *   E-posta entegrasyonu (görev oluşturma ve hatırlatıcılar için).
*   **Güvenlik:**
    *   Veri şifreleme (hem veritabanında hem de aktarım sırasında).
    *   Güvenli kullanıcı kimlik doğrulaması.
    *   Düzenli güvenlik denetimleri.
    *   GDPR uyumluluğu.

## 💰 Gelir Modeli (Revenue Model)

*   **Freemium:** Temel özellikler (sınırlı sayıda görev, temel önceliklendirme, sınırlı işbirliği) ücretsiz olarak sunulacak.
*   **Abonelik Tabanlı (Premium):**
    *   **Bireysel Premium:** Gelişmiş YZ fonksiyonları, artırılmış depolama, sınırsız görev, öncelikli destek. Aylık ve yıllık seçenekler.
    *   **Ekip Premium:** Bireysel Premium özelliklerine ek olarak, ekip işbirliği özellikleri, kullanıcı yönetimi, gelişmiş raporlama. Kullanıcı sayısına göre fiyatlandırma.
*   **Kurumsal (Enterprise):** Özel çözümler, adanmış destek, güvenlik özellikleri, özelleştirme seçenekleri. Fiyatlandırma, özel gereksinimlere göre belirlenecek.

## 🚀 MVP Kapsamı (MVP Scope)

*   Kullanıcı kayıt/giriş ve profil yönetimi.
*   Smart Task Creation (temel NLP desteği ile).
*   Son tarihe göre görev önceliklendirme.
*   Tek kullanıcılı görev yönetimi.
*   Temel takvim entegrasyonu (sadece görevlerin takvime aktarılması).
*   Görev listelerini paylaşma (sadece okunabilir izinlerle).
*   Güvenli kullanıcı kimlik doğrulaması ve veri şifreleme.
*   Temel görev durumu yönetimi (Yapılacak, Devam Ediyor, Tamamlandı).

**MVP'de Olmayacaklar:**

*   Gelişmiş NLP özellikleri (örn: görev bağımlılıklarını çıkarma).
*   Ekip işbirliği özellikleri (yorumlar, görev ataması).
*   Gelişmiş raporlama.
*   E-posta entegrasyonu.
*   Diğer takvimlerle (Outlook) entegrasyon.
*   Rol tabanlı erişim kontrolü.
*   Mobil uygulamalar.

## 📝 Kullanıcı Hikayeleri (User Stories)

*   Bir **bireysel kullanıcı** olarak, görevleri doğal dilde yazarak eklemek istiyorum, böylece görevleri hızlı ve kolay bir şekilde oluşturabilirim.
*   Bir **bireysel kullanıcı** olarak, görevlerime otomatik olarak bir son tarih atamasını istiyorum, böylece zamanımı daha iyi planlayabilirim.
*   Bir **bireysel kullanıcı** olarak, görevlerime öncelik atamak istiyorum, böylece en önemli görevlere odaklanabilirim.
*   Bir **bireysel kullanıcı** olarak, görevlerimi takvimimde görmek istiyorum, böylece günümü daha iyi planlayabilirim.
*   Bir **ekip üyesi** olarak, görev listelerini diğer ekip üyeleriyle paylaşmak istiyorum, böylece herkesin ne üzerinde çalıştığını bilebiliriz.
*   Bir **ekip üyesi** olarak, görevlerin durumunu güncelleyebilmek istiyorum, böylece ilerlemeyi takip edebiliriz.
*   Bir **yönetici** olarak, ekibimin görev ilerlemesini görebilmek istiyorum, böylece darboğazları tespit edebilir ve kaynakları daha verimli kullanabilirim.
*   Bir **yönetici** olarak, kullanıcıları sisteme ekleyebilmek ve kaldırabilmek istiyorum, böylece ekip üyeliğini yönetebilirim.
*   Bir **yeni kullanıcı** olarak, kolayca kayıt olabilmek ve sisteme giriş yapabilmek istiyorum, böylece uygulamayı hızlıca kullanmaya başlayabilirim.
*   Bir **güvenliği önemseyen kullanıcı** olarak, verilerimin güvenli bir şekilde saklandığından emin olmak istiyorum, böylece kişisel bilgilerim korunur.
