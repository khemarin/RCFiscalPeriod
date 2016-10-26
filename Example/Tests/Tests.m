//
//  RCFiscalPeriodTests.m
//  RCFiscalPeriodTests
//
//  Created by Khemarin on 10/26/2016.
//  Copyright (c) 2016 Khemarin. All rights reserved.
//

#import "NSDate+RCPeriod.h"

@import XCTest;

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void) testPeriod {
    NSArray * periods = @[
                          @[createNSDatefromCrm(@"2016-05-25T10:29:13Z"), @6, @2],
                          @[createNSDatefromCrm(@"2016-08-14T10:29:13Z"), @9, @3],
                          @[createNSDatefromCrm(@"2016-11-26T10:29:13Z"), @12, @4],
                          @[createNSDatefromCrm(@"2016-12-30T10:29:13Z"), @13, @4],
                          @[createNSDatefromCrm(@"2016-12-31T10:29:13Z"), @1, @1]
                          ];
    for (NSArray * period in periods) {
        NSDate * periodDate   = period[0];
        NSInteger periodTest  = [period[1] integerValue];
        NSInteger quarterTest = [period[2] integerValue];
        RCFiscal * f = periodDate.fiscalPeriod;
        XCTAssertEqual(f.period, periodTest);
        XCTAssertEqual(f.quarter, quarterTest);
    }

}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Convert string to date

NSDate* createNSDatefromCrm(NSString* crmDate)
{
    NSDateFormatter* rfc3339DateFormatter = [[NSDateFormatter alloc] init];
    NSLocale* enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    
    [rfc3339DateFormatter setLocale:enUSPOSIXLocale];
    [rfc3339DateFormatter setDateFormat:(crmDate.length == 10) ? @"yyyy'-'MM'-'dd" : @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    [rfc3339DateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    // Convert the RFC 3339 date time string to an NSDate.
    NSDate* myNSDate = [rfc3339DateFormatter dateFromString:crmDate];
    
    return myNSDate;
}


@end

