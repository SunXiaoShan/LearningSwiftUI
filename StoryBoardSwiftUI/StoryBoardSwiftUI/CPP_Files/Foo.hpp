//
//  Foo.hpp
//  StoryBoardSwiftUI
//
//  Created by huangphineas on 2023/3/1.
//

#ifndef Foo_hpp
#define Foo_hpp

#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

    typedef void(*callback_t)(const char *);
    callback_t globalCallback; //Declare a global variable..

    void callback_web_disconnected();

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* Foo_hpp */
