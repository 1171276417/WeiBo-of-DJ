//
//  CollectionViewController.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import <UIKit/UIKit.h>
#import "CollectionView.h"
#import "Singleton.h"
#import "ListTableViewCell.h"
#import "WeiboViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewController : UIViewController

@property(nonatomic,strong)CollectionView *collectionview;
@property(nonatomic,strong)ListTableViewCell *listcell;

@end

NS_ASSUME_NONNULL_END
