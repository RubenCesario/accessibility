/// Returns the value of [values] whose `name` equals [name].
///
/// Returns [fallback] when [name] is not a `String` or matches no value.
T enumByName<T extends Enum>(
  Iterable<T> values,
  Object? name, {
  required T fallback,
}) {
  if (name is! String) {
    return fallback;
  }
  for (final value in values) {
    if (value.name == name) {
      return value;
    }
  }
  return fallback;
}
