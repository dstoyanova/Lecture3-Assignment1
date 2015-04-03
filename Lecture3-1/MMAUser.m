//
//  MMAUser.m
//  Lecture3-1
//
//  Created by Desislava Stoyanova on 4/3/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import "MMAUser.h"

@interface MMAUser ()

@end

@implementation MMAUser

- (id)init {
    return [self initWithUsername:@"default"
                     userIdNumber:[NSNumber numberWithInt:0]
                   currentBalance:[NSNumber numberWithDouble:0]];
}

- (id)initWithUsername:(NSString *)pUsername userIdNumber:(NSNumber *)pUserId currentBalance:(NSNumber *)pCurrentBalance {
    if (self = [super init]) {
        _username = pUsername;
        _userIdNumber = pUserId;
        _userCurrentBalance = pCurrentBalance;
    }
    return self;
}

- (void)purchaseProductWithPrice:(NSNumber *)pProductPrice {
    if ([[self userCurrentBalance] doubleValue] < [pProductPrice doubleValue]) {
        [self print];
        [self.delegate currentBalanceIsNotEnough];
    }
    else {
        [self print];
        double newUserBalance = [[self userCurrentBalance] doubleValue] - [pProductPrice doubleValue];
        self.userCurrentBalance = [NSNumber numberWithDouble:newUserBalance];
        [self.delegate purchasingProductWasSuccessful];
        [self print];
    }
}

- (void)addSomeMoney {
    [self print];
    double userNewBalance = [[self userCurrentBalance] doubleValue] + 500;
    self.userCurrentBalance = [NSNumber numberWithDouble:userNewBalance];
    [self.delegate addingMoneyWasSuccessful];
    [self print];
}

- (void)print {
    NSLog(@"Username: %@",[self username]);
    NSLog(@"Money: %.2f",[[self userCurrentBalance] doubleValue]);
}

@end
