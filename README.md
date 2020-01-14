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



### İlişkisel şeması:
+ Questions ( questionId: Integer, AnswersId : Integer, CreationDate : smalldatetime, CloseDate:
smalldatetime, userId:Integer, LastEditedDate: smalldatetime, LastEditedBy:Integer , TagId:
Integer, Score: Integer, Title, AnswerCount, QuestionCount :Integer, typeId: Integer ).
+ QuestionType ( typeId: Integer, Name : Nvarchar (30) ).
+ Answers ( answerId: Integer, questionId : Integer, userId : Integer, Score : Integer, Text: String,
CreationDate: smalldatetime, VoteId: Integer, commentId : Integer).
+ Users (userId: Integer, Email : String, Reputation : Integer, ProfilPic : Image , LastSeen :
datetime, profileViews : Integer, merbershipDate : smalldatetime, DisplayName : Nvarchar (50),
About : String, RoleId : Integer).
+ Roles ( roleId: Integer, questionId : Integer, roleTypeId : Integer, userId : Integer).
+ RoleType ( roleTypeId: Integer, Name : String ).
+ Chat (chatId: Integer, UserId: Integer, Text: String, RoomId: Integer).
+ Rooms ( roomId: Integer, QuestionId: Integer, Text : String, VoteId: Integer).
+ Comments (commentId: Integer, AnsweId : Integer, Text: String, VoteId: Integer, UserId :
Integer ).
+ Search history ( searchId: Integer, Text : Sting , URL : String , questionId : Integer ).
+ Feedback ( feedId: Integer, questionId : Integer, CreationDate: smalldatetime, VoteId: Integer).
+ Votes (voteId: Integer, voteTypeId : Integer, CreationDate: smalldatetime, userId: Integer ,
questionId : Integer ).
+ VoteType ( voteTypeId: Integer, Name : String ).
+ EditHistory ( editHistoryId: Integer, userId: Integer, editTypeId : Integer, Url : String ).
+ EditType (editTypeId: Integer, IsAnswer: bit, IsQuestion: bit, IsComment: bit ).
+ Blogs ( blogId: Integer, userId : Integer, Text: String ).
+ Badges ( badgeId: Integer, Name: String, Date: smalldatetime, UserId : Integer, badgeTypeId:
Integer ).
+ BadgeType (badgeTypeId : Integer , Name : Nvarchar(30)).
+ Tags (tagId: Integer, tagTypeId: Integer).
+ tagTypes (tagTypeId: Integer, Name: nvarchar (50)).
