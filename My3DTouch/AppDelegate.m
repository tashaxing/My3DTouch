//
//  AppDelegate.m
//  My3DTouch
//
//  Created by yxhe on 16/10/26.
//  Copyright © 2016年 tashaxing. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailViewController.h"
#import "WebViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // 其实可以在这里给app动态加入快捷菜单，不过需要程序启动之后才出现，推荐静态标签
//    //系统ShortcutIcon
//    UIApplicationShortcutIcon *favrite = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeFavorite];
//    
//    UIApplicationShortcutItem *itemOne = [[UIApplicationShortcutItem alloc] initWithType:@"favrite" localizedTitle:@"时尚之都" localizedSubtitle:nil icon:favrite userInfo:nil];
//    
//    UIApplicationShortcutIcon *bookMark = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeBookmark];
//    
//    UIApplicationShortcutItem *itemTwo = [[UIApplicationShortcutItem alloc] initWithType:@"book" localizedTitle:@"知识海洋" localizedSubtitle:nil icon:bookMark userInfo:nil];
//    
//    //自定义ShortcutIcon
//    UIApplicationShortcutIcon *iconContact = [UIApplicationShortcutIcon iconWithTemplateImageName:@"contact"];
//    
//    UIApplicationShortcutItem *itemThree = [[UIApplicationShortcutItem alloc] initWithType:@"contact" localizedTitle:@"联系的人" localizedSubtitle:nil icon:iconContact userInfo:nil];
//    
//    [UIApplication sharedApplication].shortcutItems = @[itemOne,itemTwo,itemThree];
    
    return YES;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler
{
    // 获取全局导航器
    UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
    
    // 根据3dtouch快捷键的type来进入不同入口
    NSString *shortCutType = shortcutItem.type;
    if ([shortCutType isEqualToString:@"type1"])
    {
        NSLog(@"%@--%@", shortcutItem.localizedTitle, shortcutItem.localizedSubtitle);
        // 根据type进入页面
        WebViewController *webVC = [[WebViewController alloc] init];
        [nav pushViewController:webVC animated:YES];
    }
    else if ([shortCutType isEqualToString:@"type2"])
    {
        NSLog(@"%@--%@", shortcutItem.localizedTitle, shortcutItem.localizedSubtitle);
        // 根据type进入页面
        DetailViewController *detailVC = [[DetailViewController alloc] init];
        [nav pushViewController:detailVC animated:YES];
    }
    else if ([shortCutType isEqualToString:@"type3"])
    {
        NSLog(@"%@--%@", shortcutItem.localizedTitle, shortcutItem.localizedSubtitle);
        // 没有push的话就默认进入主页面
    }
    else if ([shortCutType isEqualToString:@"type4"])
    {
        NSLog(@"%@--%@", shortcutItem.localizedTitle, shortcutItem.localizedSubtitle);
        // 没有push的话就默认进入主页面
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
