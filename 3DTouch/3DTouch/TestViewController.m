//
//  TestViewController.m
//  3DTouch
//
//  Created by xueshan on 17/6/15.
//  Copyright © 2017年 xueshan. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//如果还是实现下面的几个选项功能，需要在你预览界面里面实现一个方法：
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *action0 = [UIPreviewAction actionWithTitle:@"action0" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"%s, line = %d, action0 = %@, previewViewController = %@", __FUNCTION__, __LINE__, action, previewViewController);
        
    }];
    
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"action1" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"%s, line = %d, action1 = %@, previewViewController = %@", __FUNCTION__, __LINE__, action, previewViewController);
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"action2" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"%s, line = %d, action2 = %@, previewViewController = %@", __FUNCTION__, __LINE__, action, previewViewController);
    }];
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"action3" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"%s, line = %d, action2 = %@, previewViewController = %@", __FUNCTION__, __LINE__, action, previewViewController);
    }];
    
    //该按钮可以是一个组,点击该组时,跳到组里面的按钮.
    UIPreviewActionGroup *actionGroup = [UIPreviewActionGroup actionGroupWithTitle:@"actionGroup" style:UIPreviewActionStyleSelected actions:@[action2, action3]];
    //直接返回数组.
    return  @[action0,action1,actionGroup];
}

@end
