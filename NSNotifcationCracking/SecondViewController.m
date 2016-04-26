//
//  SecondViewController.m
//  NSNotifcationCracking
//
//  Created by Daniel_Hu on 4/23/16.
//  Copyright © 2016 mask. All rights reserved.
//

#import "SecondViewController.h"
#import "HHNotificationCenter.h"

@interface SecondViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *backButton;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupSubViews];
}

- (void)setupSubViews
{
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 300, 50)];
    self.textField.placeholder = @"输入框";
    [self.view addSubview:self.textField];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.backButton.frame = CGRectMake(100, 200, 80, 50);
    [self.backButton setTitle:@"返回" forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
}

- (void)backButtonPressed
{
    //test1
    NSNotification *notification = [NSNotification notificationWithName:@"TextFieldValueChanged" object:self.textField];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotification:notification];
    
    //test2
//    HHNotification *notification = [HHNotification notificationWithName:@"TextFieldValueChanged" object:self.textField];
//    HHNotificationCenter *notificationCenter = [HHNotificationCenter defaultCenter];
//    [notificationCenter postNotification:notification];
    
    //test3
//    HHNotificationCenter *notificationCenter = [HHNotificationCenter defaultCenter];
//    [notificationCenter postNotificationName:@"TextFieldValueChanged" object:self.textField userInfo:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
