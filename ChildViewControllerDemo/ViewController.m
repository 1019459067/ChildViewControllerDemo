//
//  ViewController.m
//  ChildViewControllerDemo
//
//  Created by HN on 2019/12/13.
//  Copyright © 2019 HN. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import <objc/runtime.h>

@interface ViewController ()
{
    UIViewController *currentVC;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self vc1];
}

- (UIViewController *)getViewController:(Class)desClassVC
{
    BaseViewController *baseVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier: NSStringFromClass([BaseViewController class])];
    object_setClass(baseVC, desClassVC);

    [baseVC.view setFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height-80)];
    return baseVC;
}

- (void)vc1
{
    ViewController1 *vc1 = (ViewController1 *)[self getViewController:ViewController1.class];
    [self addChildViewController:vc1];
    [vc1 didMoveToParentViewController:self];
    currentVC = vc1;
    [self.view addSubview:vc1.view];
}

- (IBAction)click1:(UIButton *)sender {
    ViewController1 *vc1 = (ViewController1 *)[self getViewController:ViewController1.class];
    [self changeControllerFromOldController:currentVC toNewController:vc1];
    
}

- (IBAction)click2:(UIButton *)sender {
    ViewController2 *vc2 = (ViewController2 *)[self getViewController:ViewController2.class];
    [self changeControllerFromOldController:currentVC toNewController:vc2];
}

- (IBAction)click3:(UIButton *)sender {
    ViewController3 *vc3 = (ViewController3 *)[self getViewController:ViewController3.class];
    [self changeControllerFromOldController:currentVC toNewController:vc3];
}

#pragma mark - 切换viewController
- (void)changeControllerFromOldController:(UIViewController *)oldController toNewController:(UIViewController *)newController
{
    [self addChildViewController:newController];
    /**
     *  切换ViewController
     */
    newController.view.alpha = 0;
    [self transitionFromViewController:oldController toViewController:newController duration:0.3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        //做一些动画
        newController.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        if (finished) { //移除oldController，但在removeFromParentViewController：方法前不会调用willMoveToParentViewController:nil 方法，所以需要显示调用
            [newController didMoveToParentViewController:self];
            [oldController willMoveToParentViewController:nil];
            [oldController removeFromParentViewController];
            currentVC = newController;
        }else {
            currentVC = oldController;
        }
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
