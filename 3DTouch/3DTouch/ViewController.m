//
//  ViewController.m
//  3DTouch
//
//  Created by xueshan on 17/6/15.
//  Copyright © 2017年 xueshan. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()<UIViewControllerPreviewingDelegate>
{
    UIButton *btn;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"3D Touch";
    self.view.backgroundColor = [UIColor whiteColor];


    btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 200, 300, 80)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"3D touch--应用内按压" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    if ([self respondsToSelector:@selector(traitCollection)]) {
        if ([self.traitCollection respondsToSelector:@selector(forceTouchCapability)]) {
            if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable ) {
                [self registerForPreviewingWithDelegate:self sourceView: btn ];
            }
            
        }
    }
    
    
    

}
#pragma mark - UIViewControllerPreviewingDelegate
//用力按,会展示预览页面
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    TestViewController *showVC = [[TestViewController alloc]init];
    
    CGRect rect = CGRectMake(0, 0,  previewingContext.sourceView.frame.size.width, previewingContext.sourceView.frame.size.height);
    previewingContext.sourceRect = rect;
    
    return showVC;
}
//到这里就能有弹出预览界面效果了
//如果还是实现下面的几个选项功能，需要在你预览界面里面实现一个方法：
//- (NSArray<id<UIPreviewActionItem>> *)previewActionItems

#pragma mark - UIViewControllerPreviewingDelegate
//继续用力按,会跳进预览页面
-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    
    [self showViewController:viewControllerToCommit sender:self];
}

@end









