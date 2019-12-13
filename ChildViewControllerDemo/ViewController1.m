//
//  ViewController1.m
//  ChildViewControllerDemo
//
//  Created by HN on 2019/12/13.
//  Copyright © 2019 HN. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

// 重写初始化方法 Base2ViewController
//- (instancetype)init{
//    if (self = [super initWithNibName:NSStringFromClass([self.superclass class]) bundle:nil]) {
//        // 初始化
//    }
//    return self;
//}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"ViewController1");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, 100, 30)];
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"Test1";
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
