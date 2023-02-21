//
//  ObjCBridgeCpp.m
//  StoryBoardSwiftUI
//
//  Created by huangphineas on 2023/2/21.
//

#import "ObjCBridgeCpp.h"

#include "HelloWorldCppFile.hpp"

@interface ObjCBridgeCpp () {
    HelloWorldCppFile *helloWorldCppFile;
}

@end

@implementation ObjCBridgeCpp

- (instancetype)init {
    self = [super init];
    if (self) {
        helloWorldCppFile = new HelloWorldCppFile("test");
    }
    return self;
}

- (void)sayHello {
    helloWorldCppFile->hello();
}

- (void)sayWorld {
    HelloWorldCppFile::world();
}

- (void)dealloc {
    delete helloWorldCppFile;
}

@end
