//
//  WeiboViewController.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import <UIKit/UIKit.h>
#import "WeiboView.h"
#import "NetworkData.h"
#import "GetListItem.h"
#import "CommentTableViewCell.h"
#import "Singleton.h"
#import "HomeTableViewCell.h"
#import "WebViewController.h"
#import "WeiboNavigationView.h"
#import "PostCommentViewController.h"

NS_ASSUME_NONNULL_BEGIN
@class GetListItem;

@interface WeiboViewController : UIViewController
@property(nonatomic,strong)WeiboView *weiboview;
@property(nonatomic,strong)NetworkData *CommentData;
@property(nonatomic,strong)CommentTableViewCell *commentcell;
@property(nonatomic,strong)HomeTableViewCell *homecell;
@property(nonatomic,strong)UIRefreshControl *refresh;
@property(nonatomic,strong)NSMutableArray *commentArray;
@property(nonatomic,strong)Singleton *single;
@property(nonatomic,strong)WeiboNavigationView *navView;

@property(nonatomic,strong)NSMutableArray *modelArray;


- (void)loginURL;


@end

NS_ASSUME_NONNULL_END
