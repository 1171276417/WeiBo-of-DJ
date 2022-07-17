//
//  SceneDelegate.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    UIWindowScene *windowscene=(UIWindowScene*)scene;
    self.window=[[UIWindow alloc] initWithWindowScene:windowscene];
    self.window.frame=windowscene.coordinateSpace.bounds;
    UITabBarController *tabbarcontroller=[[UITabBarController alloc] init];
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:tabbarcontroller];
    //创建三个子控制器
    HomeViewController *homeVC=[[HomeViewController alloc] init];
    SelectionViewController *selectionVC=[[SelectionViewController alloc] init];
    MyViewController *myVC=[[MyViewController alloc] init];
    
    //底部标题设置标题
    homeVC.tabBarItem.title=@"首页";
    selectionVC.tabBarItem.title=@"精选";
    myVC.tabBarItem.title=@"我的";
    
    //设置头部标题
    homeVC.navigationItem.title=@"首页";
    selectionVC.navigationItem.title=@"精选";
    myVC.navigationItem.title=@"我的";

    //设置背景颜色
    homeVC.view.backgroundColor=[UIColor whiteColor];
    selectionVC.view.backgroundColor=[UIColor whiteColor];
    myVC.view.backgroundColor=[UIColor whiteColor];
    
    //设置图标
    homeVC.tabBarItem.image=[UIImage imageNamed:@"1"];
    selectionVC.tabBarItem.image=[UIImage imageNamed:@"2"];
    myVC.tabBarItem.image=[UIImage imageNamed:@"3"];
    
    //加载页面之前先初始化单例中的数组
    Singleton *single=[[Singleton alloc] init];
    single.HomeArray=[[NSMutableArray alloc] init];
    single.CommentArray=[[NSMutableArray alloc] init];
    single.PostArray=[[NSMutableArray alloc] init];
    single.HistoryArray=[[NSMutableArray alloc] init];
    single.CollectArray=[[NSMutableArray alloc] init];
//    single.SearchArray=[[NSMutableArray alloc] init];

    //添加到tabbarcontroller中
    [tabbarcontroller setViewControllers:@[homeVC,selectionVC,myVC]];
    _window.rootViewController=nav;
    
    [self.window makeKeyAndVisible];
    
    
    
    
    
   
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
