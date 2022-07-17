//
//  SelectionViewController.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import <UIKit/UIKit.h>
#import "SelectionView.h"
#import "NetworkData.h"
#import "GetListItem.h"
#import "HomeTableViewCell.h"
#import "Singleton.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectionViewController : UIViewController

@property(nonatomic,strong)SelectionView *selectionview;
@property(nonatomic,strong)NetworkData *networkdata;
@property(nonatomic,strong)HomeTableViewCell *homecell;

@end

NS_ASSUME_NONNULL_END
