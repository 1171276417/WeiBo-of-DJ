//
//  HistorySearchViewController.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/21.
//

#import <UIKit/UIKit.h>
#import "Singleton.h"
#import "GetListItem.h"
#import "ListTableViewCell.h"
#import "HistorySearchView.h"


NS_ASSUME_NONNULL_BEGIN

@interface HistorySearchViewController : UIViewController


@property(nonatomic,strong)HistorySearchView *searchview;
@property(nonatomic,strong)UISearchController *searchController;
@property(nonatomic,strong)GetListItem *list;
@property(nonatomic,strong)ListTableViewCell *listcell;

@end

NS_ASSUME_NONNULL_END
