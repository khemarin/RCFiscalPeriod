//
//  NSDate+RCPeriod.m
//  RCFiscalPeriodTests
//
//  Created by Khemarin on 10/26/2016.
//  Copyright (c) 2016 Khemarin. All rights reserved.
//

#import "NSDate+RCPeriod.h"

static const unsigned int allCalendarUnitFlags = NSCalendarUnitYear | NSCalendarUnitQuarter | NSCalendarUnitMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitWeekOfMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitEra | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitWeekOfYear;

@implementation NSDate(RCPeriod)

-(RCFiscal *)fiscalPeriod {
    NSDate * firstDate          = [self firstDayOfTheYear];
    
    NSInteger saturdayWeekday   = 7;
    NSInteger firstSaturdayDate = firstDate.day + (saturdayWeekday - firstDate.weekday);
    
    NSInteger period            = ((self.dayOfYear - firstSaturdayDate) / 28) + 1; //4 week period
    NSInteger year              = (period < 0) ? (self.year - 1) : ((period > 13) ? (self.year + 1) : self.year);
    
    //Revise
    period                      = (period < 0) ? 13 : (period <= 13 ? period : (period % 13));
    NSInteger quarter           = (period / 4) + 1;
    quarter                     = quarter > 4 ? 4 : quarter;
    
    RCFiscal *f                  = [[RCFiscal alloc] init];
    f.period                    = period;
    f.year                      = year;
    f.quarter                   = quarter;
    
    return f;
}

- (NSDate *) firstDayOfTheYear {
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:allCalendarUnitFlags fromDate:self];
    
    components.month = 1;
    components.day   = 1;
    
    return [calendar dateFromComponents:components];
}

#pragma mark - Component

-(NSDateComponents*) currentDateComponent {
    return [[NSCalendar currentCalendar] components:allCalendarUnitFlags fromDate:self];
}

-(NSInteger)day {
    return [self currentDateComponent].day;
}

-(NSInteger)weekday {
    return [self currentDateComponent].weekday;
}

-(NSInteger)month {
    return [self currentDateComponent].month;
}

-(NSInteger)year {
    return [self currentDateComponent].year;
}

-(NSInteger)dayOfYear {
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitYear forDate:self];
}

@end
