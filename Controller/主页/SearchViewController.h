//
//  SearchViewController.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/21.
//

#import <UIKit/UIKit.h>
#import "SearchView.h"
#import "Singleton.h"
#import "GetListItem.h"
#import "ListTableViewCell.h"
#import "WeiboViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController

@property(nonatomic,strong)SearchView *searchview;
@property(nonatomic,strong)UISearchController *searchController;
@property(nonatomic,strong)GetListItem *list;
@property(nonatomic,strong)ListTableViewCell *listcell;

@end

NS_ASSUME_NONNULL_END
