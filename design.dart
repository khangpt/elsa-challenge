enum AnswerOrder { A, B, C, D, E, F }

class AnswerOption {
  const AnswerOption({required this.order, required this.content, this.isRightOption = false});

  final AnswerOrder order;
  final String content;
  final bool isRightOption;
}

class Question {
  const Question(
      {required this.id, required this.content, this.score = 0, this.answerOptions = const []});

  final String id;
  final String content;
  final int score;
  final List<AnswerOption> answerOptions;

  // bool get isMultiSelection => answerOptions.where((opts) => opts.isRightOption).length > 1;
}

class UserAnswer {
  const UserAnswer({required this.question, required this.responses});

  final Question question;
  final List<AnswerOption> responses; // in case the question has more than one right option

  bool get isRightAnswer {
    final hasAnswer = responses.isNotEmpty;

    /// all possible answer in question must be existed in user's responses
    final rightResponse = question.answerOptions.every((qa) {
      return qa.isRightOption && responses.any((res) => qa.order == res.order);
    });

    return hasAnswer && rightResponse;
  }
}

class UserScore {}

class User {
  const User({required this.id, required this.name, this.answers = const []});

  final String id;
  final String name;
  final List<UserAnswer> answers;
}

class QuizParticipationSystem {
  const QuizParticipationSystem({required this.id, this.participants = const []});

  final String id;
  final List<User> participants;
}
