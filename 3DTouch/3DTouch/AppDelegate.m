//
//  AppDelegate.m
//  3DTouch
//
//  Created by xueshan on 17/6/15.
//  Copyright © 2017年 xueshan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]];
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    
    //图标按压(代码实现;也可以在 plist 中设置)
    [self setup3DTouch:application];
    
    
    return YES;
}
- (void)setup3DTouch:(UIApplication *)application
{
    /**
     type 该item 唯一标识符
     localizedTitle ：标题
     localizedSubtitle：副标题
     icon：icon图标 可以使用系统类型 也可以使用自定义的图片
     userInfo：用户信息字典 自定义参数，完成具体功能需求
     */
    //    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"标签.png"];
    UIApplicationShortcutIcon *cameraIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose];
    UIApplicationShortcutItem *cameraItem = [[UIApplicationShortcutItem alloc] initWithType:@"ONE" localizedTitle:@"拍照" localizedSubtitle:@"" icon:cameraIcon userInfo:nil];
    
    UIApplicationShortcutIcon *shareIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    UIApplicationShortcutItem *shareItem = [[UIApplicationShortcutItem alloc] initWithType:@"TWO" localizedTitle:@"分享" localizedSubtitle:@"" icon:shareIcon userInfo:nil];
    
    
    
    
    
    
    /** 将items 添加到app图标 */
    application.shortcutItems = @[cameraItem,shareItem];
}

-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
    if([shortcutItem.type isEqualToString:@"ONE"]){
        UIViewController *vc = [[UIViewController alloc] init];
        vc.title = @"第一个";
        vc.view.backgroundColor = [UIColor redColor];
        [nav pushViewController:vc animated:YES];
    }else if ([shortcutItem.type isEqualToString:@"TWO"]){
        UIViewController *vc = [[UIViewController alloc] init];
        vc.title = @"第二个";
        vc.view.backgroundColor = [UIColor greenColor];
        [nav pushViewController:vc animated:YES];
    }
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
