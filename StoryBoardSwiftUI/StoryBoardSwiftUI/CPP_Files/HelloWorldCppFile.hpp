//
//  HelloWorldCppFile.hpp
//  StoryBoardSwiftUI
//
//  Created by huangphineas on 2023/2/21.
//

#ifndef HelloWorldCppFile_hpp
#define HelloWorldCppFile_hpp

#ifdef __cplusplus

#include <stdio.h>
#include <iostream>

class HelloWorldCppFile {
    std::string filename;

public:
    HelloWorldCppFile (std::string filename);
    void hello();
    static void world();
    const char *hexdump();
};



#endif

#endif /* HelloWorldCppFile_hpp */
