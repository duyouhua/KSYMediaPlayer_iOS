//
//  SettingViewController.m
//  KSYPlayerDemo
//
//  Created by devcdl on 2017/8/24.
//  Copyright © 2017年 kingsoft. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UITextField *bufferTimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *bufferSizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *prepareTimeoutTextField;
@property (weak, nonatomic) IBOutlet UITextField *readTimeoutTextField;
@property (weak, nonatomic) IBOutlet UISwitch *loopPlaySwitch;
@property (weak, nonatomic) IBOutlet UIButton *confirmConfigeButton;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *aView = [[UIView alloc] init];
    self.tableView.tableFooterView = aView;
}
- (IBAction)popBackAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)confirmAction:(id)sender {
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self hideKeyboard];
}

- (void)hideKeyboard {
    [self.bufferTimeTextField endEditing:YES];
    [self.bufferSizeTextField endEditing:YES];
    [self.prepareTimeoutTextField endEditing:YES];
    [self.readTimeoutTextField endEditing:YES];
}

@end
