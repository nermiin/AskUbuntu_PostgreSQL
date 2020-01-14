## Ask Ubuntu Website Modelling
+ SQL business rules
+ Relational Database Schema
+ ER model : Crow's Foot Notation
+ Database : PostgreSQL

### ER Model
![Use Case Diagram](https://github.com/nermiin/AskUbuntu_PostgreSQL/blob/master/VB.png)

### Business Rules
+ Her kullanıcının e-posta adresinin bilgisi mevcuttur.
+ Her kullanıcıya ait sorular ,cevaplar ,rozetler ,itibar ,etiketler bilgileri
mevcuttur.
+ Her kullanıcının sınırsız soru sorabilir. Her soru sadece bir kullanıcı
tarafından sorulur.
+ Sorularda birden fazla etiketleme yapılabilir. Her etiketleme birden fazla
soruya gidebilir.
+ Her kullanıcının başka bir kullanıcının tarafından etiketlenebilir.
+ Kullanıcılar yorumlarda birden fazla etiketleme yapabilir.
+ Yapılan etiketlemeler birden fazla kişiyi etiketleyebilir .
+ Kullanıcılar birden fazla soru sorabilir.
+ Sorulan soruların son değiştirme tarihi, görüntülenme sayısı, oy sayısı,
yorum sayısı ve favorilere eklenme sayısı bulunur.
+ Soruları ve cevapları değerlendirebilmesi için üye olması gerekir ve en az
15 tane itibar olması gerekir.
+ Üyelik olmadan soru sorulmaz ve oy kullanılmaz.
+ Bir kullanıcı birden çok yorum yapabilir. Bir yorum bir kullanıcı tarafından
yapılır.
+ Bir soruya birden fazla oy yapılabilir. Bir oy yalnızca bir soruya gider .
+ Bir kullanıcı birden çok mesaj atabilir. Bir mesaj bir kullanıcı tarafından
atılır.
+ Bir oy yalnızca bir soruya gelir. Bir kullanıcı birden fazla oylama yapabilir.
+ Bir kullanıcı birden çok oy kullanabilir. Bir oy sadece bir soruya ait olabilir.
+ Bir oy bir kullanıcı tarafından atılır. Bir kullanıcı birden fazla oylama
yapabilir.
+ Cevaplanmamış sorular grup şeklinde bulunur.
