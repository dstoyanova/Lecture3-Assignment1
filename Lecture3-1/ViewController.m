//
//  ViewController.m
//  Lecture3-1
//
//  Created by Desislava Stoyanova on 4/3/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <PaymentNotifications> {
    MMAUser* currentUser;
    MMAPaymentManager* sharedUser;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MMAUser* user1 = [[MMAUser alloc] initWithUsername:@"dstoyanova"
                                          userIdNumber:[NSNumber numberWithInt:0]
                                        currentBalance:[NSNumber numberWithDouble:1500]];
    MMAUser* user2 = [[MMAUser alloc] initWithUsername:@"atrifonova"
                                          userIdNumber:[NSNumber numberWithInt:1]
                                        currentBalance:[NSNumber numberWithDouble:4340.50]];
    MMAUser* user3 = [[MMAUser alloc] initWithUsername:@"knikolov"
                                          userIdNumber:[NSNumber numberWithInt:2]
                                        currentBalance:[NSNumber numberWithDouble:280.20]];
    
    sharedUser = [MMAPaymentManager sharedUser];
    
    [[sharedUser users] addObject:user1];
    [[sharedUser users] addObject:user2];
    [[sharedUser users] addObject:user3];
    
    currentUser = [sharedUser getRandomUser];
    
    currentUser.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)currentBalanceIsNotEnough {
    NSLog(@"User's balance is not enough.");
}

- (void)purchasingProductWasSuccessful {
    NSLog(@"Purchasing product was successful.");
}

- (void)addingMoneyWasSuccessful {
    NSLog(@"The sum of money has been added successfully to user's acount.");
}

- (IBAction)buyProduct1:(id)sender {
    double product1Price = [self.product1Price.text doubleValue];
    [currentUser purchaseProductWithPrice:[NSNumber numberWithDouble:product1Price]];
}

- (IBAction)buyProduct2:(id)sender {
    double product2Price = [self.product2Price.text doubleValue];
    [currentUser purchaseProductWithPrice:[NSNumber numberWithDouble:product2Price]];
}

- (IBAction)buyProduct3:(id)sender {
    double product3Price = [self.product3Price.text doubleValue];
    [currentUser purchaseProductWithPrice:[NSNumber numberWithDouble:product3Price]];
}

- (IBAction)addMoneyToAccount:(id)sender {
    [currentUser addSomeMoney];
}

@end
