import 'class.dart';

class Bank {
  int _index = 0;
  List<Question> _questionBank = [
    Question(
        question:
            'Ian McKellen is the only actor to receive an Oscar nomination for acting in a "Lord of the Rings" movie.',
        answer: true),
    Question(question: 'Actor Jason Momoa has three children.', answer: false),
    Question(
        question:
            'Steven Spielberg won his first Oscar for Best Director for "Schindler’s List.',
        answer: true),
    Question(question: 'There are 219 episodes of Friends.', answer: false),
    Question(
        question: 'In Harry Potter, Draco Malfoy has no siblings.',
        answer: false),
    Question(
        question:
            'Nicolas Cage and Michael Jackson both married the same woman.',
        answer: true),
    Question(question: '"Moonlight" won Best Picture in 2018.', answer: false),
    Question(
        question:
            'It took 7 hours to do Zoe Saldanas Gamora make up for "Guardians of the Galaxy".',
        answer: false),
    Question(
        question: 'Bruce Lee was originally a champion ballroom dancer.',
        answer: true),
    Question(
        question:
            'The nickname of Morgan Freemans character in "Million Dollar Baby" is Red.',
        answer: false)
  ];

  String getQuestion() {
    return _questionBank[_index].question;
  }

  bool getAnswer() {
    return _questionBank[_index].answer;
  }

  void increasIndex() {
    if (_index + 1 < _questionBank.length) {
      _index++;
    }
  }

  bool lastQuestion() {
    if (_index + 1 >= _questionBank.length) {
      return true;
    } else {
      return false;
    }
  }

  void reloadPage() {
    _index = 0;
  }
}
