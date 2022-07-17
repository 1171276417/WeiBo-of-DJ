//
//  NetworkData.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "NetworkData.h"

@implementation NetworkData

/**获取微博内容数据*/
- (void)LoadListDataBlock:(WeiboListItemLoadBlock)finishBlock andpage:(int)page{
    NSString *pageStr=[[NSNumber numberWithInt:page] stringValue];
    //传入page页数调用不同内容
    NSString *urlstring=[@"https://api.weibo.com/2/statuses/home_timeline.json?access_token=2.00b5biSHqpMClB6963486d9cjFixpC&page=" stringByAppendingString:pageStr];
    NSURL *listURL=[NSURL URLWithString:urlstring];
    NSURLSession *session=[NSURLSession sharedSession];
    
    NSURLSessionDataTask *datatask=[session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSMutableArray *listItemArray=@[].mutableCopy;
        NSArray *dataArray=[((NSDictionary *)jsonObj) objectForKey:@"statuses"];
        /**遍历数组结构化数据存入可变数组中*/
        for(NSDictionary *info in dataArray){
            GetListItem *list=[[GetListItem alloc] init];
            [list WeiboconfigWithDictionary:info];
            [listItemArray addObject:list];
        }
        /**将数据回调回到主线程中*/
        dispatch_async(dispatch_get_main_queue(),^{
            /**调用block*/
            if(finishBlock){
                finishBlock(listItemArray.copy); //返回得到的数据模型可变数组listItemArray
            }
        });
    }];
    //执行任务
    [datatask resume];
}


/**获取微博评论数据*/
- (void)LoadCommentListDataBlock:(CommentListItemLoadBlock)finishBlock andID:(NSNumber *)ID{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    NSString *IDStr=[numberFormatter stringFromNumber:ID];//将ID转换成字符串
    NSString *urlstring=[@"https://api.weibo.com/2/comments/show.json?access_token=2.00b5biSHqpMClB6963486d9cjFixpC&id=" stringByAppendingString:IDStr];
    NSURL *listURL=[NSURL URLWithString:urlstring];
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *datatask=[session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *jsonError;
        id jsonObj=[NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSMutableArray *listItemCommentArray=@[].mutableCopy;
        NSArray *CommentArray=[((NSDictionary *)jsonObj)objectForKey:@"comments"];
        /**遍历数组结构化数据*/
        for(NSDictionary *info in CommentArray){
            GetListItem *list=[[GetListItem alloc] init];
            [list CommentconfigwithDictionary:info];
            [listItemCommentArray addObject:list];
        }
        /**回调主线程*/
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemCommentArray.copy);//返回数组模型
            }
        });
    }];
    [datatask resume];
}




@end
