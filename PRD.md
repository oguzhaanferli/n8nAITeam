
# SaaS Todo Uygulaması - Ürün Gereksinim Dokümanı (PRD)

## 1. 🎯 Yönetici Özeti

Bu doküman, kişisel ve ekip üretkenliğini artırmak üzere tasarlanmış, yapay zeka destekli bir SaaS tabanlı yapılacaklar listesi uygulamasının geliştirilmesini detaylandırmaktadır. Uygulama, doğal dil işleme, akıllı önceliklendirme ve kusursuz işbirliği özellikleri ile görev yönetimini basitleştirmeyi hedeflemektedir. Bu PRD, ürün geliştirme sürecinde yazılım ekibi, tasarımcılar, pazarlamacılar ve paydaşlar için yol gösterici bir kaynak olarak hizmet edecektir.

## 2. 👥 Hedef Kitle

*   **Bireyler:** Yoğun profesyoneller, öğrenciler ve zaman yönetimini iyileştirmek isteyen girişimciler. Günlük görevleri düzenlemeye ve verimliliği artırmaya ihtiyaç duyan kullanıcılar.
*   **Takımlar:** Görev dağıtımı, ilerleme takibi ve proje yönetimi için işbirliği platformuna ihtiyaç duyan küçük ve orta ölçekli işletmeler. Özellikle uzaktan çalışan ve koordinasyon ihtiyacı yüksek olan takımlar.

## 3. ✨ Temel Özellikler (Feature List)

*   **Akıllı Görev Oluşturma:**
    *   **Doğal Dil İşleme (NLP):** Kullanıcının doğal dilde girdiği metni analiz ederek görev başlığı, açıklaması ve son tarih bilgilerini otomatik olarak çıkarabilme. Örneğin, "Yarın sabah 9'da Ayşe ile toplantı yap" ifadesi, başlık "Ayşe ile Toplantı", son tarih "Yarın 09:00" olarak otomatik oluşturulmalıdır.
    *   **Kategori Önerisi:** Görev başlığına göre otomatik olarak ilgili kategori önerileri sunulması. (Örn: "Rapor Hazırla" -> "İş", "Proje", "Finans")
    *   **Öncelik Düzeyi Tahmini:** NLP ile görev içeriğinden öncelik düzeyini tahmin etme ve kullanıcıya onaylatma (Yüksek, Orta, Düşük).
    *   **Tekrarlayan Görevler:** Belirli aralıklarla tekrarlayan görevlerin (günlük, haftalık, aylık) kolayca oluşturulabilmesi.
*   **Akıllı Önceliklendirme:**
    *   **Bağımlılık Analizi:** Görevler arasındaki bağımlılıkları (engellenen görevler, sonraki adımlar) belirleme ve önceliklendirmeyi buna göre ayarlama.
    *   **Son Tarih Bazlı Önceliklendirme:** Görevlerin son tarihine göre otomatik olarak önceliklendirme. En yakın tarihliler en üstte.
    *   **Kullanıcı Tercihlerine Göre Uyarlama:** Kullanıcının geçmiş görev tamamlama alışkanlıklarına, yoğun çalışma saatlerine ve kişisel tercihlerine göre önceliklendirme algoritmasını optimize etme.
    *   **Önceliklendirme Algoritması:** Bir puanlama sistemi ile görevlere öncelik ataması (Örn: Son tarih yaklaştıkça puan artar, bağımlılık arttıkça puan artar, kullanıcı tercihlerine göre puan artar/azalır).
*   **İşbirliği Özellikleri:**
    *   **Paylaşımlı Görev Listeleri:** Kullanıcıların görev listelerini belirli kullanıcılar veya ekiplerle paylaşabilmesi.
    *   **Gerçek Zamanlı Güncellemeler:** Görevlerde yapılan değişikliklerin (durum, son tarih, açıklama) paylaşılan listedeki tüm kullanıcılara anında bildirilmesi. (WebSockets/Server-Sent Events ile)
    *   **Görev Ataması:** Kullanıcıların görevleri diğer kullanıcılarına atayabilmesi.
    *   **Açıklama ve Yorumlar:** Görevlere yorum ekleyerek iletişim kurabilme.
    *   **Bildirimler:** Görev ataması, yorumlar ve güncellemeler hakkında e-posta ve uygulama içi bildirimler.
*   **İlerleme Takibi ve Raporlama:**
    *   **Görev Durumu:** Görevlerin durumunu (Yapılacak, Devam Ediyor, Tamamlandı, İptal Edildi) belirleme ve güncelleyebilme.
    *   **İlerleme Çubuğu:** Görevlerdeki ilerlemeyi görsel olarak gösteren çubuklar.
    *   **Dashboard:** Bireysel ve ekip performansını gösteren görsel panolar. (Tamamlanan görev sayısı, geciken görevler, görev önceliklendirme dağılımı)
    *   **Raporlama:** Belirli bir zaman aralığı için görev tamamlama oranları, ortalama görev süresi gibi metriklerin raporlanması. (CSV/PDF olarak dışa aktarma)
*   **Teknik Gereksinimler:**
    *   **Veritabanı:** Verileri güvenli ve ölçeklenebilir bir şekilde saklamak için PostgreSQL veya MySQL kullanılacak.
    *   **API:** RESTful API mimarisi kullanılacak.
    *   **Güvenlik:** Kullanıcı verilerini korumak için HTTPS, şifreleme ve düzenli güvenlik testleri uygulanacak.
    *   **Platform:** Web uygulaması (React, Angular veya Vue.js ile) ve mobil uygulamalar (React Native veya Flutter ile).

## 4. 💰 Gelir Modeli

*   **Freemium:** Temel özellikler (örn. sınırlı sayıda görev, temel önceliklendirme) ücretsiz olarak sunulacak.
*   **Abonelik Tabanlı:** Premium özelliklere (örn. gelişmiş yapay zeka özellikleri, sınırsız görevler, ekip işbirliği, özel temalar) erişim için aylık veya yıllık abonelik seçenekleri sunulacak.
    *   **Bireysel Plan:** Temel premium özellikler.
    *   **Ekip Planı:** Ekip işbirliği özellikleri ve daha fazla depolama alanı.
    *   **Business Plan:** Gelişmiş raporlama ve yönetici kontrolleri.
*   **Kurumsal Çözümler:** Büyük kuruluşlar için özelleştirilmiş çözümler ve özel destek sunulacak.

## 5. 🚀 MVP Kapsamı

MVP, aşağıdaki temel fonksiyonlara odaklanacaktır:

*   Akıllı görev oluşturma (temel kategori önerileri ile).
*   Son tarihe göre görev önceliklendirme.
*   Tek kullanıcılı görev yönetimi (temel takvim entegrasyonu ile - Google Calendar/Outlook).
*   Herkese açık görev listeleri oluşturma ve paylaşma imkanı (işbirliği için).
*   Güvenli kullanıcı kimlik doğrulaması (E-posta/Şifre, Google/Facebook Girişi) ve veri şifreleme.
*   Temel Görev Durumları (Yapılacak, Devam Ediyor, Tamamlandı).

**MVP'de Olmayacaklar:**

*   Gelişmiş Yapay Zeka (Özel öncelik algoritmaları, bağımlılık analizi)
*   Ekip İşbirliği Özellikleri (Görev ataması, yorumlar, bildirimler)
*   İlerleme Takibi ve Raporlama (Dashboard, raporlar)
*   Mobil Uygulamalar. (Sadece Web uygulaması)
*   Özel temalar ve özelleştirme seçenekleri.

## 6. 📝 Kullanıcı Hikayeleri

*   **Bir Bireysel Kullanıcı olarak**, görevlerimi hızlıca oluşturmak istiyorum, böylece zamanımı daha etkili kullanabilirim.
*   **Bir Bireysel Kullanıcı olarak**, görevlerime son tarihler atayabilmek istiyorum, böylece önceliklerimi daha iyi belirleyebilirim.
*   **Bir Bireysel Kullanıcı olarak**, takvimimle senkronize edebilmek istiyorum, böylece görevlerimi günlüğümle birlikte görebilirim.
*   **Bir Takım Lideri olarak**, görevleri ekip üyelerine atayabilmek istiyorum, böylece iş yükünü dağıtabilir ve takip edebilirim.
*   **Bir Takım Üyesi olarak**, bana atanan görevleri görebilmek istiyorum, böylece sorumluluklarımın farkında olabilirim.
*   **Bir Takım Üyesi olarak**, görevlerdeki güncellemeleri anında görmek istiyorum, böylece işbirliği içinde kalabilirim.
*   **Bir Yönetici olarak**, ekibimin ilerlemesini takip etmek istiyorum, böylece projelerin zamanında tamamlanmasını sağlayabilirim.
*   **Bir Bireysel Kullanıcı olarak**, tamamladığım görevleri görmek istiyorum, böylece motivasyonumu artırabilirim.
*   **Bir Bireysel Kullanıcı olarak**, genel bir bakış elde etmek için görevlerimi kategorilere ayırabilmek istiyorum, böylece daha organize olabilirim.
*   **Bir Takım Lideri olarak**, bir göreve yorum ekleyebilmek istiyorum, böylece ekibimle iletişim kurabilir ve netlik sağlayabilirim.
