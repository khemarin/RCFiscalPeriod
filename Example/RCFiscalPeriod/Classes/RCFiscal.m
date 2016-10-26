//
//  RCFiscal.m
//  RCFiscalPeriodTests
//
//  Created by Khemarin on 10/26/2016.
//  Copyright (c) 2016 Khemarin. All rights reserved.
//

#import "RCFiscal.h"

@implementation RCFiscal

-(instancetype)init {
    self = [super init];
    if (self) {
        self.period = 0;
        self.year = 0;
        self.quarter = 0;
    }
    return self;
}

@end
