//
//  PostCommentViewController.h
//  微博4.0
//
//  Created by 邓杰 on 2022/7/17.
//

#import <UIKit/UIKit.h>
#import "PostCommentView.h"
#import "PostCommentNavigationView.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "GetListItem.h"
#import "Singleton.h"


NS_ASSUME_NONNULL_BEGIN

@interface PostCommentViewController : UIViewController

@property(nonatomic,strong)PostCommentView *postview;
@property(nonatomic,strong)PostCommentNavigationView *navpost;
@property(nonatomic,strong)NSString *text;

@end

NS_ASSUME_NONNULL_END
