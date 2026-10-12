
class MyDuration {
  final int _milliseconds;

  // Private constructor
  const MyDuration._(this._milliseconds);

  // Named constructor from hours
  factory MyDuration.fromHours(int hours) {
    if (hours < 0) {
      throw ArgumentError('Duration cannot be negative!');
    }
    return MyDuration._(hours * 60 * 60 * 1000);
  }

  // Named constructor from minutes
  factory MyDuration.fromMinutes(int minutes) {
    if (minutes < 0) {
      throw ArgumentError('Duration cannot be negative!');
    }
    return MyDuration._(minutes * 60 * 1000);
  }

  // Named constructor from seconds
  factory MyDuration.fromSeconds(int seconds) {
    if (seconds < 0) {
      throw ArgumentError('Duration cannot be negative!');
    }
    return MyDuration._(seconds * 1000);
  }

  // Compare two durations
  bool operator >(MyDuration other) {
    return _milliseconds > other._milliseconds;
  }

  // Add two durations
  MyDuration operator +(MyDuration other) {
    return MyDuration._(_milliseconds + other._milliseconds);
  }

  // Subtract two durations
  MyDuration operator -(MyDuration other) {
    if (_milliseconds < other._milliseconds) {
      throw Exception('Duration cannot be negative!');
    }
    return MyDuration._(_milliseconds - other._milliseconds);
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;

    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); // true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e);
  }
}
