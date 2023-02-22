//
//  HelloBoostSignal.cpp
//  garminos
//
//  Created by Huang, Phineas on 2022/7/26.
//  Copyright © 2022 Garmin. All rights reserved.
//

#include "HelloBoostSignal.hpp"

HelloBoostSignal::HelloBoostSignal()
{
}

HelloBoostSignal::~HelloBoostSignal()
{
    signalEventConnection.disconnect();
    signalEvent2Connection.disconnect();
}
