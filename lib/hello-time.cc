#include "lib/hello-time.h"
#include <ctime>
#include <iostream>

void print_localtime() {
  std::time_t result = std::time(nullptr);
  std::cout << std::asctime(std::localtime(&result));
}

void print_localtime2() {
    std::time_t result = std::time(nullptr);
    std::cout << std::asctime(std::localtime(&result));
}
