abstract class ILoggerService {
  void debugLog(String message);

  void infoLog(String message);

  void errorLog(String message);

  void warningLog(String message);

  void traceLog(String message);
}
