//
//  HistoryViewController.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import <UIKit/UIKit.h>
#import "HistoryView.h"
#import "Singleton.h"
#import "ListTableViewCell.h"
#import "WeiboViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HistoryViewController : UIViewController

@property(nonatomic,strong)HistoryView *historyview;
@property(nonatomic,strong)ListTableViewCell *listcell;

@end

NS_ASSUME_NONNULL_END
