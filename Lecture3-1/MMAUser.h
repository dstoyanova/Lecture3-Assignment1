//
//  MMAUser.h
//  Lecture3-1
//
//  Created by Desislava Stoyanova on 4/3/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PaymentNotifications <NSObject>

- (void)currentBalanceIsNotEnough;
- (void)purchasingProductWasSuccessful;
- (void)addingMoneyWasSuccessful;

@end

@interface MMAUser : NSObject

@property (nonatomic,strong) NSString* username;
@property (nonatomic,strong) NSNumber* userIdNumber;
@property (nonatomic,strong) NSNumber* userCurrentBalance;

@property (nonatomic,weak) id<PaymentNotifications> delegate;

- (id)initWithUsername:(NSString*)pUsername userIdNumber:(NSNumber*)pUserId currentBalance:(NSNumber*)pCurrentBalance;
- (void)purchaseProductWithPrice:(NSNumber*)pProductPrice;
- (void)addSomeMoney;
- (void)print;

@end
