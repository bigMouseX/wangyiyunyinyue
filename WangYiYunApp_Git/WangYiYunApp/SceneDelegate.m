//
//  SceneDelegate.m
//  WangYiYunApp
//
//  Created by 夏楠 on 2023/6/6.
//

#import "SceneDelegate.h"
#import "FindViewController.h"
#import "VideoViewController.h"
#import "MyViewController.h"
#import "VillageViewController.h"
#import "AccountViewController.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    FindViewController *vc1 = [[FindViewController alloc] init];
    UIImage *n1 = [UIImage imageNamed:@"tabbarIcon1no.png"];
    n1 = [n1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *y1 = [UIImage imageNamed:@"tabbarIcon1yes.png"];
    y1 = [y1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *vc1Icon = [[UITabBarItem alloc] initWithTitle:@"发现" image:n1 selectedImage:y1];
    UINavigationController *vc1NavigationController = [[UINavigationController alloc] initWithRootViewController:vc1];
    vc1.tabBarItem = vc1Icon;
    
    VideoViewController *vc2 = [[VideoViewController alloc] init];
    UIImage *n2 = [UIImage imageNamed:@"tabbarIcon2no.png"];
    n2 = [n2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *y2 = [UIImage imageNamed:@"tabbarIcon2yes.png"];
    y2 = [y2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *vc2Icon = [[UITabBarItem alloc] initWithTitle:@"视频" image:n2 selectedImage:y2];
    vc2.tabBarItem = vc2Icon;
    
    MyViewController *vc3 = [[MyViewController alloc] init];
    UIImage *n3 = [UIImage imageNamed:@"tabbarIcon3no.png"];
    n3 = [n3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *y3 = [UIImage imageNamed:@"tabbarIcon3yes.png"];
    y3 = [y3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *vc3Icon = [[UITabBarItem alloc] initWithTitle:@"我的" image:n3 selectedImage:y3];
    UINavigationController *vc3NavigationController = [[UINavigationController alloc] initWithRootViewController:vc3];
    vc3.tabBarItem = vc3Icon;
    
    VillageViewController *vc4 = [[VillageViewController alloc] init];
    UIImage *n4 = [UIImage imageNamed:@"tabbarIcon4no.png"];
    n4 = [n4 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *y4 = [UIImage imageNamed:@"tabbarIcon4yes.png"];
    y4 = [y4 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *vc4Icon = [[UITabBarItem alloc] initWithTitle:@"云村" image:n4 selectedImage:y4];
    vc4.tabBarItem = vc4Icon;
    
    AccountViewController *vc5 = [[AccountViewController alloc] init];
    UIImage *n5 = [UIImage imageNamed:@"tabbarIcon5no.png"];
    n5 = [n5 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *y5 = [UIImage imageNamed:@"tabbarIcon5yes.png"];
    y5 = [y5 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *vc5Icon = [[UITabBarItem alloc] initWithTitle:@"账号" image:n5 selectedImage:y5];
    UINavigationController *vc5NavigationController = [[UINavigationController alloc] initWithRootViewController:vc5];
    vc5.tabBarItem = vc5Icon;
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[vc1NavigationController, vc2, vc3NavigationController, vc4, vc5NavigationController];
    tabBarController.selectedIndex = 0;
    
    //===============修改UITabBarItem的选中的字体的颜色===============================
    // 创建一个字典来设置标题的文本属性
//    NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor redColor]};
//
//    // 设置标准状态下的标题文本属性
//    [[UITabBarItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
//
//    // 设置选中状态下的标题文本属性
//    [[UITabBarItem appearance] setTitleTextAttributes:attributes forState:UIControlStateSelected];
    //=======================================================================
    
    tabBarController.tabBar.tintColor = [UIColor redColor]; // 设置选中的 TabBarItem 颜色
    
    tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = tabBarController;
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
