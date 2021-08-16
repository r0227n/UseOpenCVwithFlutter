#include "hello.hpp"
#include <iostream>

int main() {
    hello_world();
    return 0;
}

void hello_world() {
    std::cout << "Hello!" << std::endl;
}