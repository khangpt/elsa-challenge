class ScoreSystem {
  static ScoreSystem? _shared;
  factory ScoreSystem() => _shared ??= ScoreSystem._();

  const ScoreSystem._({
    this.quizParticipationID = const [],
  });

  final List<String> quizParticipationID;
}
