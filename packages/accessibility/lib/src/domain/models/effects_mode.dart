/// Whether animations and visual effects are allowed.
enum EffectsMode {
  /// Follow the OS reduce-motion setting.
  system,

  /// Always allow effects.
  enabled,

  /// Never allow effects.
  disabled;

  /// Resolves this mode to a concrete value.
  ///
  /// [systemReducesMotion] is the OS reduce-motion signal, which Flutter
  /// exposes as `MediaQuery.disableAnimationsOf`.
  bool resolve({required bool systemReducesMotion}) => switch (this) {
    EffectsMode.system => !systemReducesMotion,
    EffectsMode.enabled => true,
    EffectsMode.disabled => false,
  };
}
