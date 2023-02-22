//
//  WorldBoostSignal.m
//  navi-lite
//
//  Created by Huang, Phineas on 2022/7/26.
//  Copyright © 2022 Garmin. All rights reserved.
//

#import "WorldBoostSignal.h"

#include "HelloBoostSignal.hpp"

void onUpdateEvent(int v);
void onUpdateEvent2(void *instance, int v);

@interface WorldBoostSignal () {
    HelloBoostSignal signal;
}

@end

@implementation WorldBoostSignal

- (void)initialSetup {
    signal.signalEventConnection.disconnect();
    signal.signalEventConnection = signal.signalEvent1.connect( &onUpdateEvent);

    signal.signalEvent2Connection.disconnect();
    signal.signalEvent2Connection = signal.signalEvent2.connect( &onUpdateEvent2);
}

- (void)actionTriggerSignalEvent {
    static int index = 0;
    NSLog(@"WorldBoostSignal Trigger Event :%@", @(index));
    signal.signalEvent1(index++);
}

- (void)actionTriggerSignalEvent2 {
    static int index = 0;
    NSLog(@"WorldBoostSignal Trigger Event2 :%@", @(index));

    signal.signalEvent2((__bridge void *)self, index++);
}

- (void)responstEvent2:(NSString *)content {
    NSLog(@"WorldBoostSignal Response Event2:%@", content);
}

void onUpdateEvent(int a) {
    @autoreleasepool {
        NSLog(@"WorldBoostSignal Response Event:%@", @(a));
    }
}

void onUpdateEvent2(void *instance, int v) {
    @autoreleasepool {
        WorldBoostSignal *obj = (__bridge WorldBoostSignal *) instance;
        [obj responstEvent2:@"WorldBoostSignal Hello World"];
    }
}

@end
