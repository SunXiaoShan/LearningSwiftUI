//
//  Foo.cpp
//  StoryBoardSwiftUI
//
//  Created by huangphineas on 2023/3/1.
//

// https://stackoverflow.com/a/53661261

#include "Foo.hpp"

#include <thread>
#include <iostream>

#ifdef __cplusplus
extern "C" {
#endif

    void callback_web_disconnected()
    {
        std::thread t = std::thread([] {
            std::this_thread::sleep_for(std::chrono::seconds(2));

            if (globalCallback)
            {
                globalCallback("Hello World");
            }
        });

        t.detach();
    }

#ifdef __cplusplus
} // extern "C"
#endif
