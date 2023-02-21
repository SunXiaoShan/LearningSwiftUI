//
//  HelloWorldCppFile.cpp
//  StoryBoardSwiftUI
//
//  Created by huangphineas on 2023/2/21.
//

#include "HelloWorldCppFile.hpp"

using namespace std;

HelloWorldCppFile::HelloWorldCppFile (std::string filename)
:filename("HelloWorld") {
    
}

void HelloWorldCppFile::hello() {
    printf("say hello\n");
}

void HelloWorldCppFile::world() {
    printf("say world\n");
}

const char * HelloWorldCppFile::hexdump() {
    char retval[2048] = "abcdefghijklmnopqrstuvwxyz1111112";
    char *p = &retval[0];
    return p;
}

extern "C" void helloCPP() {
    return HelloWorldCppFile("filename").hello();
}

extern "C" void worldCPP() {
    return HelloWorldCppFile::world();
}

extern "C" const char * hexdump() {
    return HelloWorldCppFile("filename").hexdump();
}




