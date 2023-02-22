//
//  WorldBoostSignal.h
//  navi-lite
//
//  Created by Huang, Phineas on 2022/7/26.
//  Copyright © 2022 Garmin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WorldBoostSignal : NSObject

- (void)initialSetup;

- (void)actionTriggerSignalEvent;
- (void)actionTriggerSignalEvent2;

@end

NS_ASSUME_NONNULL_END
