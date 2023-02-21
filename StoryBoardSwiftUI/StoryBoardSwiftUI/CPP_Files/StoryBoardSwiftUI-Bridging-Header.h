//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import "ObjCBridgeCpp.h"

void helloCPP();
void worldCPP();
const char * hexdump();

const void * initializeCpp();
const void * initializeCpp2(char * filename);
const char * hexdump2(const void *object);
