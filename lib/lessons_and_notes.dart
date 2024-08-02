class Lesson {
  final String name;
  final String code;
  final List<Note> notes;

  Lesson({required this.name, required this.code, required this.notes});
}

class Note {
  final String name;
  final String code;
  final Paper paper;

  Note({required this.name, required this.code, required this.paper});
}

class Paper {
  final String tutor; //içerik ,öğretim elemanı, yükleme tarihi, pdfUri
  final String content;
  final String date;
  final String pdfUri;

  Paper(
      {required this.tutor,
      required this.content,
      required this.date,
      required this.pdfUri});
}

//List<Lesson> lessons = [
//  Lesson(
//    name: 'Calculus 1',
//    code: 'MATH1102',
//    notes: [
//      Note(
//        name: 'Limits and Continuity',
//        code: 'MATH1102_01',
//      ),
//      Note(
//        name: 'Derivatives',
//        code: 'MATH1102_02',
//      ),
//    ],
//  ),
//  Lesson(
//    name: 'Data Structures',
//    code: 'CSE1211',
//    notes: [
//      Note(
//        name: 'Arrays and Lists',
//        code: 'CSE1211_01',
//      ),
//      Note(
//        name: 'Trees and Graphs',
//        code: 'CSE1211_02',
//      ),
//    ],
//  ),
//  Lesson(
//    name: 'Linear Algebra',
//    code: 'MATH1001',
//    notes: [
//      Note(
//        name: 'Matrices',
//        code: 'MATH1001_01',
//      ),
//      Note(
//        name: 'Vector Spaces',
//        code: 'MATH1001_02',
//      ),
//    ],
//  ),
//  Lesson(
//    name: 'History of Turkish Republic',
//    code: 'ATA101',
//    notes: [
//      Note(
//        name: 'Atatürk’s Principles',
//        code: 'ATA101_01',
//      ),
//      Note(
//        name: 'Reform Movements',
//        code: 'ATA101_02',
//      ),
//    ],
//  ),
//  Lesson(
//    name: 'Literature',
//    code: 'TRKCE101',
//    notes: [
//      Note(
//        name: 'Poetry Analysis',
//        code: 'TRKCE101_01',
//      ),
//      Note(
//        name: 'Modern Turkish Literature',
//        code: 'TRKCE101_02',
//      ),
//    ],
//  ),
//  Lesson(
//    name: 'Physics 1',
//    code: 'PHYS1101',
//    notes: [
//      Note(
//        name: 'Kinematics',
//        code: 'PHYS1101_01',
//      ),
//      Note(
//        name: 'Dynamics',
//        code: 'PHYS1101_02',
//      ),
//    ],
//  ),
//  Lesson(
//    name: 'Chemistry',
//    code: 'CHEM101',
//    notes: [
//      Note(
//        name: 'Atomic Structure',
//        code: 'CHEM101_01',
//      ),
//      Note(
//        name: 'Chemical Bonds',
//        code: 'CHEM101_02',
//      ),
//    ],
//  ),
//  Lesson(
//    name: 'Introduction to Programming',
//    code: 'CSE1101',
//    notes: [
//      Note(
//        name: 'Basic Syntax',
//        code: 'CSE1101_01',
//      ),
//      Note(
//        name: 'Control Structures',
//        code: 'CSE1101_02',
//      ),
//    ],
//  ),
//];
