import 'package:bootcampdeneme/lessons_and_notes.dart';

class University {
  final String name;
  final String logo;
  final List<Lesson> lessons;

  University({required this.name, required this.logo, required this.lessons});
}

List<Note> savedNotes = [];

List<University> universities = [
  University(
    name: 'Marmara Üniversitesi',
    logo:
        'https://logowik.com/content/uploads/images/marmara-universitesi9827.jpg',
    lessons: [
      Lesson(
        name: 'Calculus 1',
        code: 'MATH1102',
        notes: [
          Note(
            name: 'Calculus 1 Vize',
            code: 'MATH1102_Vize',
            paper: Paper(
              tutor: 'Ali Yılmaz',
              content: 'Midterm exam for Calculus 1',
              date: '2024-03-15',
              pdfUri:
                  'http://www.buders.com/UNIVERSITE/Universite_Dersleri/Math101/Arsiv/integral_sorulari_ve_cozumleri.pdf',
            ),
          ),
          Note(
            name: 'Calculus 1 Final',
            code: 'MATH1102_Final',
            paper: Paper(
              tutor: 'Ali Yılmaz',
              content: 'Final exam for Calculus 1',
              date: '2024-06-20',
              pdfUri:
                  'http://www.buders.com/UNIVERSITE/Universite_Dersleri/Math101/Arsiv/integral_sorulari_ve_cozumleri.pdf',
            ),
          ),
          Note(
            name: 'Limits and Continuity',
            code: 'MATH1102_01',
            paper: Paper(
              tutor: 'Ali Yılmaz',
              content: 'Lecture notes on limits and continuity',
              date: '2024-01-10',
              pdfUri:
                  'http://www.buders.com/UNIVERSITE/Universite_Dersleri/Math101/Arsiv/Math101mt1.pdf',
            ),
          ),
        ],
      ),
      Lesson(
        name: 'Data Structures',
        code: 'CSE1211',
        notes: [
          Note(
            name: 'Data Structures Vize',
            code: 'CSE1211_Vize',
            paper: Paper(
              tutor: 'Ayşe Demir',
              content: 'Midterm exam for Data Structures',
              date: '2024-03-15',
              pdfUri: 'https://www.mta.ca/~rrosebru/oldcourse/263114/Dsa.pdf',
            ),
          ),
          Note(
            name: 'Data Structures Final',
            code: 'CSE1211_Final',
            paper: Paper(
              tutor: 'Ayşe Demir',
              content: 'Final exam for Data Structures',
              date: '2024-06-20',
              pdfUri: 'https://www.mta.ca/~rrosebru/oldcourse/263114/Dsa.pdf',
            ),
          ),
          Note(
            name: 'Arrays and Lists',
            code: 'CSE1211_01',
            paper: Paper(
              tutor: 'Ayşe Demir',
              content: 'Lecture notes on arrays and lists',
              date: '2024-01-10',
              pdfUri: 'https://www.mta.ca/~rrosebru/oldcourse/263114/Dsa.pdf',
            ),
          ),
        ],
      ),
    ],
  ),
  University(
    name: 'Yıldız Teknik Üniversitesi',
    logo:
        'https://logowik.com/content/uploads/images/yildiz-teknik-universitesi2700.jpg',
    lessons: [
      Lesson(
        name: 'Linear Algebra',
        code: 'MATH1001',
        notes: [
          Note(
            name: 'Linear Algebra Vize',
            code: 'MATH1001_Vize',
            paper: Paper(
              tutor: 'Mehmet Çelik',
              content: 'Midterm exam for Linear Algebra',
              date: '2024-03-15',
              pdfUri:
                  'https://www.ie.bilkent.edu.tr/~mustafap/courses/Linalg.pdf',
            ),
          ),
          Note(
            name: 'Linear Algebra Final',
            code: 'MATH1001_Final',
            paper: Paper(
              tutor: 'Mehmet Çelik',
              content: 'Final exam for Linear Algebra',
              date: '2024-06-20',
              pdfUri:
                  'https://www.ie.bilkent.edu.tr/~mustafap/courses/Linalg.pdf',
            ),
          ),
          Note(
            name: 'Matrices',
            code: 'MATH1001_01',
            paper: Paper(
              tutor: 'Mehmet Çelik',
              content: 'Lecture notes on matrices',
              date: '2024-01-10',
              pdfUri:
                  'https://www.ie.bilkent.edu.tr/~mustafap/courses/Linalg.pdf',
            ),
          ),
        ],
      ),
      Lesson(
        name: 'History of Turkish Republic',
        code: 'ATA101',
        notes: [
          Note(
            name: 'History of Turkish Republic Vize',
            code: 'ATA101_Vize',
            paper: Paper(
              tutor: 'Fatma Özkan',
              content: 'Midterm exam for History of Turkish Republic',
              date: '2024-03-15',
              pdfUri:
                  'https://yalova.edu.tr/Files/UserFiles/50/2._dnm_tarih_notlar.pdf',
            ),
          ),
          Note(
            name: 'History of Turkish Republic Final',
            code: 'ATA101_Final',
            paper: Paper(
              tutor: 'Fatma Özkan',
              content: 'Final exam for History of Turkish Republic',
              date: '2024-06-20',
              pdfUri:
                  'https://yalova.edu.tr/Files/UserFiles/50/2._dnm_tarih_notlar.pdf',
            ),
          ),
          Note(
            name: 'Atatürk’s Principles',
            code: 'ATA101_01',
            paper: Paper(
              tutor: 'Fatma Özkan',
              content: 'Lecture notes on Atatürk’s Principles',
              date: '2024-01-10',
              pdfUri:
                  'https://yalova.edu.tr/Files/UserFiles/50/2._dnm_tarih_notlar.pdf',
            ),
          ),
        ],
      ),
    ],
  ),
  University(
    name: 'Boğaziçi Üniversitesi',
    logo:
        'https://logowik.com/content/uploads/images/bogazici-universitesi.jpg',
    lessons: [
      Lesson(
        name: 'Literature',
        code: 'TRKCE101',
        notes: [
          Note(
            name: 'Literature Vize',
            code: 'TRKCE101_Vize',
            paper: Paper(
              tutor: 'Elif Kaya',
              content: 'Midterm exam for Literature',
              date: '2024-03-15',
              pdfUri:
                  'https://krtknadmn.karatekin.edu.tr/files/tde/TDE%20B%C3%B6l%C3%BCm%C3%BC%20Ders%20Kitaplar%C4%B1%20Listesi.pdf',
            ),
          ),
          Note(
            name: 'Literature Final',
            code: 'TRKCE101_Final',
            paper: Paper(
              tutor: 'Elif Kaya',
              content: 'Final exam for Literature',
              date: '2024-06-20',
              pdfUri:
                  'https://krtknadmn.karatekin.edu.tr/files/tde/TDE%20B%C3%B6l%C3%BCm%C3%BC%20Ders%20Kitaplar%C4%B1%20Listesi.pdf',
            ),
          ),
          Note(
            name: 'Poetry Analysis',
            code: 'TRKCE101_01',
            paper: Paper(
              tutor: 'Elif Kaya',
              content: 'Lecture notes on poetry analysis',
              date: '2024-01-10',
              pdfUri:
                  'https://krtknadmn.karatekin.edu.tr/files/tde/TDE%20B%C3%B6l%C3%BCm%C3%BC%20Ders%20Kitaplar%C4%B1%20Listesi.pdf',
            ),
          ),
        ],
      ),
      Lesson(
        name: 'Physics 1',
        code: 'PHYS1101',
        notes: [
          Note(
            name: 'Physics 1 Vize',
            code: 'PHYS1101_Vize',
            paper: Paper(
              tutor: 'Burak Şahin',
              content: 'Midterm exam for Physics 1',
              date: '2024-03-15',
              pdfUri: 'https://ncert.nic.in/textbook/pdf/keph101.pdf',
            ),
          ),
          Note(
            name: 'Physics 1 Final',
            code: 'PHYS1101_Final',
            paper: Paper(
              tutor: 'Burak Şahin',
              content: 'Final exam for Physics 1',
              date: '2024-06-20',
              pdfUri: 'https://ncert.nic.in/textbook/pdf/keph101.pdf',
            ),
          ),
          Note(
            name: 'Kinematics',
            code: 'PHYS1101_01',
            paper: Paper(
              tutor: 'Burak Şahin',
              content: 'Lecture notes on kinematics',
              date: '2024-01-10',
              pdfUri: 'https://ncert.nic.in/textbook/pdf/keph101.pdf',
            ),
          ),
        ],
      ),
    ],
  ),
  University(
    name: 'Istanbul Üniversitesi',
    logo:
        'https://logowik.com/content/uploads/images/tc-istanbul-universitesi9793.jpg',
    lessons: [
      Lesson(
        name: 'Chemistry',
        code: 'CHEM101',
        notes: [
          Note(
            name: 'Chemistry Vize',
            code: 'CHEM101_Vize',
            paper: Paper(
              tutor: 'Cem Aydın',
              content: 'Midterm exam for Chemistry',
              date: '2024-03-15',
              pdfUri: 'https://ncert.nic.in/textbook/pdf/kech101.pdf',
            ),
          ),
          Note(
            name: 'Chemistry Final',
            code: 'CHEM101_Final',
            paper: Paper(
              tutor: 'Cem Aydın',
              content: 'Final exam for Chemistry',
              date: '2024-06-20',
              pdfUri: 'https://ncert.nic.in/textbook/pdf/kech101.pdf',
            ),
          ),
          Note(
            name: 'Atomic Structure',
            code: 'CHEM101_01',
            paper: Paper(
              tutor: 'Cem Aydın',
              content: 'Lecture notes on atomic structure',
              date: '2024-01-10',
              pdfUri: 'https://ncert.nic.in/textbook/pdf/kech101.pdf',
            ),
          ),
        ],
      ),
      Lesson(
        name: 'Biology',
        code: 'BIO101',
        notes: [
          Note(
            name: 'Biology Vize',
            code: 'BIO101_Vize',
            paper: Paper(
              tutor: 'Derya Kaya',
              content: 'Midterm exam for Biology',
              date: '2024-03-15',
              pdfUri:
                  'https://www.pearson.com/content/dam/one-dot-com/one-dot-com/international-schools/pdfs/secondary-curriculum/international-gcse/science/International-GCSE-Biology-Student-Book-sample.pdf',
            ),
          ),
          Note(
            name: 'Biology Final',
            code: 'BIO101_Final',
            paper: Paper(
              tutor: 'Derya Kaya',
              content: 'Final exam for Biology',
              date: '2024-06-20',
              pdfUri:
                  'https://www.pearson.com/content/dam/one-dot-com/one-dot-com/international-schools/pdfs/secondary-curriculum/international-gcse/science/International-GCSE-Biology-Student-Book-sample.pdf',
            ),
          ),
          Note(
            name: 'Cell Structure',
            code: 'BIO101_01',
            paper: Paper(
              tutor: 'Derya Kaya',
              content: 'Lecture notes on cell structure',
              date: '2024-01-10',
              pdfUri:
                  'https://www.pearson.com/content/dam/one-dot-com/one-dot-com/international-schools/pdfs/secondary-curriculum/international-gcse/science/International-GCSE-Biology-Student-Book-sample.pdf',
            ),
          ),
        ],
      ),
    ],
  ),
  University(
    name: 'Hacettepe Üniversitesi',
    logo:
        'https://logowik.com/content/uploads/images/464_hacettepeuniversitesi.jpg',
    lessons: [
      Lesson(
        name: 'Introduction to Programming',
        code: 'CSE1101',
        notes: [
          Note(
            name: 'Introduction to Programming Vize',
            code: 'CSE1101_Vize',
            paper: Paper(
              tutor: 'Emre Yavuz',
              content: 'Midterm exam for Introduction to Programming',
              date: '2024-03-15',
              pdfUri:
                  'https://www.inf.unibz.it/~calvanese/teaching/06-07-ip/lecture-notes/uni01.pdf',
            ),
          ),
          Note(
            name: 'Introduction to Programming Final',
            code: 'CSE1101_Final',
            paper: Paper(
              tutor: 'Emre Yavuz',
              content: 'Final exam for Introduction to Programming',
              date: '2024-06-20',
              pdfUri:
                  'https://www.inf.unibz.it/~calvanese/teaching/06-07-ip/lecture-notes/uni01.pdf',
            ),
          ),
          Note(
            name: 'Basic Syntax',
            code: 'CSE1101_01',
            paper: Paper(
              tutor: 'Emre Yavuz',
              content: 'Lecture notes on basic syntax',
              date: '2024-01-10',
              pdfUri:
                  'https://www.inf.unibz.it/~calvanese/teaching/06-07-ip/lecture-notes/uni01.pdf',
            ),
          ),
        ],
      ),
      Lesson(
        name: 'Algorithms',
        code: 'CSE2102',
        notes: [
          Note(
            name: 'Algorithms Vize',
            code: 'CSE2102_Vize',
            paper: Paper(
              tutor: 'Selin Aksoy',
              content: 'Midterm exam for Algorithms',
              date: '2024-03-15',
              pdfUri:
                  'https://www.cet.edu.in/noticefiles/280_DS%20Complete.pdf',
            ),
          ),
          Note(
            name: 'Algorithms Final',
            code: 'CSE2102_Final',
            paper: Paper(
              tutor: 'Selin Aksoy',
              content: 'Final exam for Algorithms',
              date: '2024-06-20',
              pdfUri:
                  'https://www.cet.edu.in/noticefiles/280_DS%20Complete.pdf',
            ),
          ),
          Note(
            name: 'Sorting Algorithms',
            code: 'CSE2102_01',
            paper: Paper(
              tutor: 'Selin Aksoy',
              content: 'Lecture notes on sorting algorithms',
              date: '2024-01-10',
              pdfUri:
                  'https://www.cet.edu.in/noticefiles/280_DS%20Complete.pdf',
            ),
          ),
        ],
      ),
    ],
  ),
];
