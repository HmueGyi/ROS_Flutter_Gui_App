#include "common/logger/logger.h"

#include "common/logger/easylogging++.h"

INITIALIZE_EASYLOGGINGPP

Logger::Logger() {
  int argc = 0;
  char** argv = nullptr;
  START_EASYLOGGINGPP(argc, argv);
  el::Configurations defaultConf;
  defaultConf.setToDefault();
  // Set maximum file size
  defaultConf.setGlobally(el::ConfigurationType::MaxLogFileSize, "100000000");
  // Whether to write to file
  defaultConf.setGlobally(el::ConfigurationType::ToFile, "true");
  // Whether to output to console
  defaultConf.setGlobally(el::ConfigurationType::ToStandardOutput, "true");
  // filename
  defaultConf.setGlobally(el::ConfigurationType::Filename,
                          "ros_gui_app_backend.log");
  defaultConf.setGlobally(el::ConfigurationType::Format, "[%datetime][%level] %msg");
  // Set configuration file
  el::Loggers::reconfigureLogger("default", defaultConf);

  /// Prevent Fatal level logs from interrupting the program
  el::Loggers::addFlag(el::LoggingFlag::DisableApplicationAbortOnFatalLog);
}
Logger::~Logger() {}
void Logger::Log(LogLevel level, std::string message, const char* file, int line) {
  switch (level) {
    case LogLevel::INFO:
      LOG(INFO) << "[" << file << ":" << line << "] " << message;
      break;
    case LogLevel::ERROR:
      LOG(ERROR) << "[" << file << ":" << line << "] " << message;
      break;
    case LogLevel::WARN:
      LOG(WARNING) << "[" << file << ":" << line << "] " << message;
      break;
  }
}