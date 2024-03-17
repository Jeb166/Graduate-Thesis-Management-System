ALTER TABLE university AUTO_INCREMENT = 1;
ALTER TABLE institute AUTO_INCREMENT = 1;
ALTER TABLE keyword AUTO_INCREMENT = 1;
ALTER TABLE language AUTO_INCREMENT = 1;
ALTER TABLE person AUTO_INCREMENT = 1;
ALTER TABLE subject AUTO_INCREMENT = 1;
ALTER TABLE thesis AUTO_INCREMENT = 1;

INSERT INTO university (universityName)
VALUES
('Istanbul Technical University'),
('Uludag University'),
('Bogazici University'),
('Istanbul University'),
('Marmara University');

INSERT INTO institute (university_id, instituteName)
VALUES
('5', 'Institute of Turkic Studies'),
('1', 'Institute of Pure and Applied Sciences'),
('2', 'Institute of Social Sciences'),
('4', 'Institute of Ataturk Principles and Revolution History'),
('3', 'Institute of Social Sciences');

INSERT INTO keyword (keywordName)
VALUES
('İnsan kaynakları'),
('değişim/dönüşüm'),
('EBYS'),
('Bursa ekonomisi'),
('Üniversite'),
('Kent ekonomisi');

INSERT INTO language (languageName)
VALUES
('Turkish'),
('English'),
('French'),
('German'),
('Spanish');

INSERT INTO person (personName, personSurname)
VALUES
('Mukaddes', 'BEKTAŞ'),
('Berat', 'BİR'),
('Aycan', 'YILMAZ'),
('Leman Figen', 'GÜL'),
('Serdar', 'GELDİMYRADOV'),
('CEM OKAN', 'TUNCEL'),
('Selçuk', 'SÜZMETAŞ'),
('Meral', 'ALPAY'),
('Mehmet Emre', 'ÇAMLIBEL'),
('Emre', 'OTAY'),
('Tülay', 'ESİN'),
('Zeynep', 'AKARSLAN'),
('Altan', ' ÖKE'),
('Nilüfer', 'ERDEM'),
('Hülya', 'AKAY');

INSERT INTO subject (subjectName)
VALUES
('Business Administration'),
('Information and Records Management'),
('Architecture'),
('Economics'),
('History of Turkish Revolution'),
('Civil Engineering'),
('History'),
('Engineering'),
('Physics'),
('Design');

INSERT INTO thesis (author_id, supervisor_id, institute_id, subject_id, language_id, `type`, title, abstract, `year`, numberOfPages, submissionDate)
VALUES
('1', '2', '1', '1', '1', 'Master', 'Elektronik belge yönetim sistemi insan kaynaklarının dönüşümüne etkisi',
 'Küreselleşen dünyada e-devlet olma yolunda, günümüzün hızla değişen koşullarına uyum sağlama zorunluluğundan hareketle, kamu kurumlarının faaliyetlerini yürütmek ve rekabet avantajı sağlayabilmek için atmaları gereken en büyük adım Elektronik Belge Yönetim Sistemi (EBYS) uygulamasına geçmektir. EBYS, kurumsal yapıyla entegre edilip kullanılmaya başlanmasıyla birlikte insan kaynaklarında dönüşüm meydana getirmiştir. Bu çalışmanın temel amacı; EBYSnin kurumsallaştırılması sürecinde Marmara Üniversitesi personelinin ne tür sorunlarla karşılaştıklarını, çalışanların yeniliklere ve değişime ayak uydurmadaki çabasını ve bu kapsamda alınması gereken önlemlerin neler olabileceğini belirleyerek EBYSnin Üniversitenin insan kaynağında nasıl bir değişime yol açtığını ortaya koymaktır. Çalışmanın hipotezi; EBYSnin hayata geçirilmesiyle birlikte Marmara Üniversitesi Yazı İşleri ve Arşiv Şube Müdürlüğünün iş süreçlerinde meydana gelen değişiklikle birlikte Müdürlüğün rolünün değiştiği ve kurum faaliyetleri içindeki öneminin de arttığının fark edilmesiyle birlikte Yazı İşleri ve Arşiv Şube Müdürlüğü personelinin eğitim durumu, becerileri, bakış açıları ve yetkinliklerinin değişmesi gerektiği düşüncesine varılmasıdır. Bununla birlikte gerek Yazı İşleri ve Arşiv Şube Müdürlüğü çalışanlarının gerekse Üniversitenin tüm personelinin yeni bir uygulamaya verdikleri olumlu ve olumsuz tepkiler bu çalışmanın ortaya çıkmasında önemli bir etken olmuştur. Bu çalışmaya Marmara Üniversitesinde EBYS kullanan idari personel dahil edilmiş olup çalışma kapsamında gözlemleme ve idari personele anket uygulaması yapılmıştır. Çalışmaya katılan personel, eğitim durumu, hizmet yılı, yaş ve cinsiyet özelliklerine göre değerlendirilmiştir. Marmara Üniversitesinde 2013 yılı başında kullanılmaya başlanılan EBYSnin kurumsallaştırma sürecine de yer verilen çalışma sonucunda, EBYS ile gelen değişimin Marmara Üniversitesi Yazı İşleri ve Arşiv Şube Müdürlüğünün işlevini ile kurumsal süreçlerdeki rolünü ve Müdürlük personelinin sahip olması gereken nitelikleri değiştirdiği, Üniversite çalışanlarını geliştirici ve güdüleyici olduğu gibi çalışanların iş tatmini yükselttiği düşünülmektedir. Marmara Üniversitesi personelinin eğitimleri, deneyimleri, bilgileri, tutumları, bakış açıları, becerileri çok farklılaşmıştır ve personel kendini yenilemek ve değiştirmek durumunda kalmıştır. Bununla birlikte Marmara Üniversitesinde değişime ve gelişime açık, gelişmeleri çok yakından izleyen, yeni bilgiler üretebilen ve işbirliği içinde çalışabilen personel ihtiyacı doğmuştur. Kısacası; EBYSnin mesleki bilgi ve beceriler ve kişisel yetkinlikler yönünden farkındalık sağlayacağı öngörülmektedir. Bu çalışmanın birinci bölümünde genel olarak değişim ve örgütsel değişim kavramları irdelenmiş, kurumların dönüşüm yaşadığı süreçte üst yönetimin rolü vurgulanarak değişime direnç ve kurumlardaki insan kaynağı değişiminin önemini ortaya koymak amaçlanmıştır. İkinci bölümde, belge, doküman, elektronik belge tanımları üzerinde durularak, elektronik belge yönetim sistemi ve yararları açıklanmış ve alan hakkındaki mevzuat ve standartlar üzerinde durulmuştur. Üçüncü bölümde, Marmara Üniversitesinde EBYSnin Projelendirme ve Uygulama süreci üzerinde ayrıntılı bir şekilde durularak bu süreçte ne tür sorunlarla karşılaşıldığı ve alınması gerek tedbirlerin neler olabileceği üzerinde durulmuştur. Dördüncü bölümde, EBYSnin Marmara Üniversitesi Yazı İşleri ve Arşiv Şube Müdürlüğünde nasıl uygunlandığını anlatılmış, Yazı İşleri ve Arşiv Şube Müdürlüğü personelinin bu uygulamadaki rolü ve EBYSye uyumu, uygulamada karşılaşılan sorunlar ve ihtiyaç duyulan personel niteliklerinin neler olabileceğini ortaya koymak amaçlanmıştır. Beşinci bölüm olan araştırma çalışmasında nitel ve nicel araştırma yöntemlerinden yararlanılmıştır. Nitel yöntem olarak vaka çalışması, nicel yöntem olarak ise anket uygulaması kullanılmıştır. Araştırmanın nitel yöntem kullanılan bölümünde, kurumsal belge yönetiminin EBYS ile fiziksel ortamdan elektronik ortama dönüştürülmesi süreci analiz edilerek detaylı bir şekilde ele alınmaya çalışılmıştır. Araştırmanın nicel yöntem kullanılan bölümünde ise anket uygulaması sonucunda elde edilen verilerin istatistiksel olarak analiz edilmesiyle ortaya çıkan sonuçlar belirtilmiştir.',
 '2015', '153', '2015-12-25'),
 
('3', '4', '2', '3', '2', 'Master', 'Phenomenology of architecture', 
 'This study is a discussion on the experience of the architecture in order to have a critique look on todays understanding of architecture that is depending on the visuality. The architecture is fast forwarding in the way of becoming an industry of visuality. The building renders and photographs frequently used as a representational tool are having less and less connection with the simple daily experience of architecture that human involves all the time. The representations depending on these images draw further away from the experience of architecture, while the perception of architecture is also affected in the process. The visually oriented culture of today imposes an understanding that the visuals tell the main story. A similar understanding is also reflecting on architecture while creating a perception of an architecture depending on the visual qualities. These visuals are defining the architecture as an image to be looked at. Through these images the architecture is shown starting from the first sketches of the concept design and ending with the day it is built when the first photographs are captured. On the contrary, after this process, architecture continues to exist and more importantly becomes an important part of human life. The perception of architecture should depend on human experience and life around. More than a picture, architecture is a living element throughout human life. The home one grows up, the school one attends every day, the museums one finds their history, the exhibitions, the libraries, the theatres, the offices, the stations… The cities emerging from these all are containing one and everyones life, while this is all shaped around the architecture. While the architecture is shaping the cities and the life of humans, architects are no exception. The experience of architecture merging into everyday life is becoming a part of the architects, and possibly their designs on the later process. Within this context, this study looks at the experience of architecture as a critique of todays visually oriented understanding. The aim of the study is to observe the experience of architecture, and its possible relation to the design of architecture through this critical approach. Within this aim, the qualities involved in the experience of architecture, and their possible effects on the design process will be questioned. Around these questions, phenomenology becomes a significant concern. Phenomenology as the study of the phenomenon through experience has been looking for similar kind of questions for many years starting from Husserl. Phenomenology of architecture has been discussed later starting from the 1950s. Schulz, Rasmussen, Pallasmaa, Zumthor and many others worked on this field. As the first stage, the phenomenology and architectural phenomenology studies will be brought by a literature review. Then as the second stage, a workshop study has been planned to observe the qualities involved in the experience of architecture and these qualities effect on the design process. Within the participation of Istanbul Technical University architecture design students, a two-stage workshop has been carried out. The students experience Taşkışla architecture faculty building of Istanbul Technical University and prepared experience maps on the first stage. Through the second stage, they are asked to design an architectural experience depending on their experience from the first stage. They create some representational works of their design. Finally, they wrote experience journals reflecting on both of these stages. While working on the results of this study, the Grounded Theory method is used. The data learnt from the workshop is analyzed with the theories from the literature review. The works of the students and the quotations from their experience journals will be presented along with an analysis. Then, the key findings from this process will be clustered for the comparative analysis. As the last step, the final data will be discussed as an answer to the research questions. This study depends on a limited participant group as the architectural design students and one case for the experience as the architecture faculty building. As a result, instead of some definitive answer from this limited experimental study, the aim will be the comparative analysis of the real-life experience and its effects on the design process as an answer for the research question. Future studies depending on more than one architectural space or having different participant groups experiencing the same architecture can provide a broader view and more comparative analysis data. In a similar way, the involvement of experience of architecture into design processes through architectural education can be another main topic to be discussed further.', 
 '2019', '145', '2019-05-03'),

('5', '6', '3', '4', '1', 'Master', 'Üniversitelerin yerel ekonomiye katkıları', 
 'Üniversiteler bulundukları ülkeyi ve kenti kültürel ve ekonomik açıdan olumlu etkilemektedir. Üniversiteler özellikle bulundukları kentlerde öğrenci harcamaları sebebiyle ekonomik canlılık yaratmaktadır. Bu yapılan çalışma sonucunda Bursa Uludağ Üniversitesinin doğrudan, dolaylı ve uyarılmış katkılar sayesinde Bursa ekonomisinde 9.978,2 kişi istihdam etkisi yarattığı hesaplanmaktadır. Ayrıca Bursa Uludağ Üniversitesinin Bursa kent merkezinde bulunan Görükle, Ali Osman Sönmez ve Fethiye İlahiyat fakültesi Kampüslerindeki öğrencilerin harcamaları ile kent ekonomisine katkıları araştırılmaktadır. Bu kapsamda 2016-2017 eğitim-öğretim yılında Bursa Uludağ Üniversitesinin merkez yerleşkelerinde ön lisans ve lisans derecesinde öğrenim gören 381 öğrenciye anket çalışması uygulanmış ve veriler SPSS istatistik yazılım programın da analiz edilmiştir. Elde edilen sonuçlar, her bir öğrenci tarafından aylık ortalama 779,7 TL harcama yapıldığını ve Bursa ekonomisine toplam 54.592.2549 TLlik katkı sağlandığını ortaya koymaktadır.', 
 '2019', '116', '2019-08-23'),

('7', '8', '4', '5', '1', 'Master', 'Atatürk Dönemi`nde İstanbul Üniversitesi Merkez Kütüphanesi', 
 'Türkiye de 1923-1938 yılları arasında gerçekleştirilen toplumsal dönüşümün amacı çağdaşlaşmaktır. Bu doğrultuda başta Mustafa Kemal Atatürk ve silah arkadaşları olmak üzere siyasi, ekonomik, eğitim ve kültürel alanlarda bir takım devrimler yapılmıştır. Bu devrimlerin (Atatürk Devrimleri), Osmanlı Dönemi nde ve özellikle 1839 Tanzimat Fermam ile başlayan hareketlerden ayrılan en önemli yanı Batılı Devletlerin zorlaması ile değil Türkiye Cumhuriyeti nin koşulları göz önünde bulundurularak yapılmış olmasıdır. Kuşkusuz bu devrimler yapılırken, geçmişin tecrübeleri de göz önünde bulundurulmuştur. Ancak, ne geçmişteki tecrübelerden ne de 1923-1938 arasında Dünya daki oluşumlardan etkilenerek yapılmıştır. Atatürk Devrimleri Türkiye nin mevcut şartları göz önünde bulundurularak gerçekleştirilmiştir. Atatürk Devrimleri`ne bakıldığına özellikle Eğitim Alanı na büyük önem verildiği dikkati çekmektedir. Daha da önemlisi, özel olarak, Mustafa Kemal Atatürk`ün Üniversite Sorunu ile ilgilenmiş olmasıdır. İstanbul Üniversitesi nde yapılan reform bunun en önemli göstergesidir. Gerek reform öncesi ve gerekse reform sonrası yapılan çalışmaları Mustafa Kemal Atatürk direkt olarak ilgilenmiştir. Bu noktada 1924 yılında dönemin Darülfünun Emini (Rektör) İsmail Hakkı Baltacıoğlu nun Mustafa Kemal Atatürk ün büyük destekleri ve görüşleri doğrultusunda İstanbul Üniversitesi Merkez Kütüphanesi ni kurmuştur. 1924de İstanbul Üniversitesi Merkez Kütüphanesi nin kurulmasından sonra özellikle eğitim ve kütüphaneler alanında büyük gelişmeler yaşanmış ve bu alanlarda yurt dışından getirilen konu ile ilgili hocaların görüşleri ve raporları alınmıştır. Yine Hasan Fehmi Ethem Karatay m yurt dışına Kütüphanecilik Eğitimi için gönderilmesi ve İstanbul Üniversitesi Merkez Kütüphanesi nin Basma Yazı ve Resimleri Derleme Kanunu (Derleme Kanunu) kapsamı içine alınması,Mııstafa Kemal Atatürk` ün İstanbul Üniversitesi ve Merkez Kütüphanesi ne, ne kadar önem verdiğinin en önemli göstergesidir. Bunun içindir ki, 1933 Reformu sonrasında İstanbul Üniversitesi ve Merkez Kütüphanesinin çehresi değişmiş büyük gelişmeler yaşanmıştır. Mustafa Kemal Atatürk, ülke kalkınmasında üniversitelerin önemli işlevleri olduğunu bildiği için Üniversite Reformu nu gerçekleştirmiştir. Bu nedenle gerek bu reform ve gerekse reform sonrasında yaşanan gelişme ve ilerlemeler bir rastlantı değildir. Çünkü, Atatürk Devrimleri nde rastlantıya yer yoktur. Akla ve bilime dayanır.', 
 '1998', '129', '1998-11-17'),

('9', '10', '5', '6', '2', 'Doctorate', 'An integrated optimization model towards energy efficiency for existing buildings', 
 'Existing buildings are responsible for a third of the global energy consumptions, as well as CO2 emissions. A decision-making algorithm is developed to mitigate the uncertainty of financial and environmental returns of energy improvements in existing buildings and to most properly spend the available funds. As a case study, forty two energy efficiency measures (EEM) are identified in existing buildings of a university campus. Energy consumption, energy cost and carbon emissions are measured. Costs and savings of EEMs are calculated and their possible combinations are studied. Out of over four trillion possible combinations of energy improvement packages, the ones providing the most bang for the buck are computed for given limited investment budgets. The optimization problem is solved alternatively with the more accurate Mixed Integer Programming (MIP) and a custom developed heuristics. Along the optimized investment curve, a sweet spot is identified at around 100000 USD providing highest returns in terms of savings in energy, energy cost and carbon emission. Retrofitting of existing buildings with an optimized investment budget appear to be a viable investment tool providing yearly savings of 33% in energy use, 22% in energy cost and 23% in carbon emission. Optimization results show that the decision maker can comfortably use the less sophisticated heuristics approach, which deviates minimal from the exact MIP solution. Finally, optimized solutions for retrofitting existing buildings are compared against alternative investments of building new energy production plants and demolishing and re-constructing new buildings. In both cases retrofitting proved to be significantly more efficient in terms of investment cost, energy savings and CO2 reduction.', 
 '2011', '171', '2011-10-10');

INSERT INTO thesis_cosupervisor (thesis_id, cosupervisor_id)
VALUES
('5', '11'),
('1', '12'),
('2', '13'),
('4', '14'),
('3', '15');

INSERT INTO thesis_keyword (thesis_id, keyword_id)
VALUES
('1', '1'),
('1', '2'),
('1', '3'),
('3', '4'),
('3', '5'),
('3', '6');

INSERT INTO thesis_subject (thesis_id, subject_id)
VALUES
('1', '2'),
('4', '7'),
('5', '8'),
('5', '3'),
('2', '10'),
('3', '4');

