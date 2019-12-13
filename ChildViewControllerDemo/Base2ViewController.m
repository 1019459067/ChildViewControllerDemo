//
//  Base2ViewController.m
//  ChildViewControllerDemo
//
//  Created by HN on 2019/12/13.
//  Copyright © 2019 Shangzx. All rights reserved.
//

#import "Base2ViewController.h"

@interface Base2ViewController ()

@end

@implementation Base2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"Base2ViewController";
    [self.view addSubview:label];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
