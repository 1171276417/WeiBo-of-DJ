//
//  PostViewController.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import <UIKit/UIKit.h>
#import "PostView.h"
#import "PostNavigationView.h"
#import "PostListItem.h"
#import "Singleton.h"
#import "HomeView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostViewController : UIViewController

@property(nonatomic,strong)PostView *postview;
@property(nonatomic,strong)PostNavigationView *navpost;
@property(nonatomic,strong)NSString *text;


@end

NS_ASSUME_NONNULL_END
