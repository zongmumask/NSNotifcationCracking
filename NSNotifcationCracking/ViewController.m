//
//  ViewController.m
//  NSNotifcationCracking
//
//  Created by Daniel_Hu on 4/23/16.
//  Copyright © 2016 mask. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "HHNotificationCenter.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testWithNSNotification];
//    [self testWithCrackNotification1];
//    [self testWithCrackNotification2];
}

- (IBAction)buttonPressed:(id)sender {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)testWithNSNotification
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(foo:) name:@"TextFieldValueChanged" object:nil];
}

- (void)testWithCrackNotification1
{
    HHNotificationCenter *notificationCenter = [HHNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(foo1:) name:@"TextFieldValueChanged" object:nil];
}

- (void)testWithCrackNotification2
{
    HHNotificationCenter *notificationCenter = [HHNotificationCenter defaultCenter];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [notificationCenter addObserverForName:@"TextFieldValueChanged" object:nil queue:queue usingBlock:^(HHNotification * _Nonnull note) {
        UILabel *label = note.object;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.label.text = label.text;
        });
    }];
}

- (void)foo:(NSNotification *)notification
{
    if ([notification.name isEqualToString:@"TextFieldValueChanged"]) {
        UITextField *textField = notification.object;
        self.label.text = textField.text;
    }
}

- (void)foo1:(HHNotification *)notification
{
    if ([notification.name isEqualToString:@"TextFieldValueChanged"]) {
        UITextField *textField = notification.object;
        self.label.text = textField.text;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
