//
//  ObjCBridgeCpp.m
//  StoryBoardSwiftUI
//
//  Created by huangphineas on 2023/2/21.
//

#import "ObjCBridgeCpp.h"

#include "HelloWorldCppFile.hpp"

@interface ObjCBridgeCpp () {
    std::unique_ptr<HelloWorldCppFile> helloWorldCppFile;
}

@end

@implementation ObjCBridgeCpp

- (instancetype)init {
    self = [super init];
    if (self) {
        helloWorldCppFile = std::make_unique<HelloWorldCppFile>("hello");
    }
    return self;
}

- (void)sayHello {
    helloWorldCppFile->hello();
}

- (void)sayWorld {
    HelloWorldCppFile::world();
}

- (NSString *)fileName {
    return [NSString stringWithCString:helloWorldCppFile->hexdump() encoding:NSASCIIStringEncoding];
}

@end
