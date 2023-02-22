//
//  HelloBoostSignal.hpp
//  garminos
//
//  Created by Huang, Phineas on 2022/7/26.
//  Copyright © 2022 Garmin. All rights reserved.
//

#ifndef HelloBoostSignal_hpp
#define HelloBoostSignal_hpp

#ifdef __cplusplus


#include <boost/signals2/connection.hpp>
#include <boost/signals2.hpp>
#include <boost/signals2/signal.hpp>

class HelloBoostSignal
{
public:
    HelloBoostSignal();
    ~HelloBoostSignal();

public:
    boost::signals2::scoped_connection signalEventConnection;
    boost::signals2::signal<void()> s;
    boost::signals2::signal<void(void *, int)> signalEvent2;
    boost::signals2::scoped_connection signalEvent2Connection;
};

#endif

#endif /* HelloBoostSignal_hpp */
