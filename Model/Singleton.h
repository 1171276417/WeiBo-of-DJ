//
//  Singleton.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Singleton : NSObject

@property(nonatomic,strong)NSMutableArray *HomeArray;//主页信息数组
@property(nonatomic,strong)NSDictionary *WeiboDictionary;//微博详情内容
@property(nonatomic,strong)NSMutableArray *HistoryArray;//浏览历史数组
@property(nonatomic,strong)NSMutableArray *CommentArray;//评论数组
@property(nonatomic,strong)NSMutableArray *PostArray;//发表微博数组
@property(nonatomic,strong)NSMutableArray *CollectArray;//收藏数组
@property(nonatomic,strong)NSMutableArray *SearchArray;//搜索结果数组



@property(nonatomic,strong)NSDictionary *StorageDict; //储存以下数组的字典
@property(nonatomic,strong)NSMutableArray *HotArray;//热门信息数组
@property(nonatomic,strong)NSMutableArray *RecreationArray;//娱乐信息数组
@property(nonatomic,strong)NSMutableArray *EmotionArray;//情感信息数组
@property(nonatomic,strong)NSMutableArray *TravelArray;//旅游信息数组
@property(nonatomic,strong)NSMutableArray *CartoonArray;//漫画信息数组




@property(nonatomic,strong)NSString *URLString;



@end

NS_ASSUME_NONNULL_END
