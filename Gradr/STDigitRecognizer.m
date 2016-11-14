//
//  digitrecognizer.m
//  Gradr
//
//  Created by Sarat Tallamraju on 11/13/16.
//  Copyright © 2016 Sarat Tallamraju. All rights reserved.
//

#import "STDigitRecognizer.h"
#include "digitrecognizerwrapper.h"

@interface STDigitRecognizer () {
    DigitRecognizer *digitRecognizer;
}

@end

@implementation STDigitRecognizer

-(instancetype) initWithString: (NSString*) inputString {
    self = [super init];
    if (self) {
        digitRecognizer = newDigitRecognizer([inputString cStringUsingEncoding:NSASCIIStringEncoding]);
    }
    return self;
}

-(NSString*) getInputString {
    const char* inputString = DigitRecognizer_getInputString(digitRecognizer);
    return [NSString stringWithUTF8String: inputString];
}

@end
