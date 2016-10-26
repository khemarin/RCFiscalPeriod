//
//  NSDate+RCPeriod.h
//  RCFiscalPeriodTests
//
//  Created by Khemarin on 10/26/2016.
//  Copyright (c) 2016 Khemarin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCFiscal.h"


@interface NSDate(RCPeriod)

/**
 Get Fiscal period of date with Royal Canin's business rule

 @return fiscalPeriod
 */
- (RCFiscal*) fiscalPeriod;

/// Date Component
- (NSInteger)day;
- (NSInteger)weekday;
- (NSInteger)month;
- (NSInteger)year;
- (NSInteger)dayOfYear;

@end
