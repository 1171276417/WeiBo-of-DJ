//
//  NetworkData.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/19.
//

#import "NetworkData.h"

@implementation NetworkData

extern NSString *access_token = @"2.00b5biSHqpMClB6963486d9cjFixpC";

/**获取微博内容数据*/
- (void)LoadListDataBlock:(WeiboListItemLoadBlock)finishBlock andpage:(int)page{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{
        @"access_token":access_token,
        @"page":[NSNumber numberWithInt:page]
    };
    [manager GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemArray = @[].mutableCopy;
        NSArray *dataArray = [((NSDictionary *)responseObject)objectForKey:@"statuses"];
        for(NSDictionary *info in dataArray){
            GetListItem *list = [[GetListItem alloc] init];
            [list WeiboconfigWithDictionary:info];
            [listItemArray addObject:list];
        }
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

/**获取微博评论数据*/
- (void)LoadCommentListDataBlock:(CommentListItemLoadBlock)finishBlock andID:(NSNumber *)ID{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *paramDict = @{
        @"access_token":access_token,
        @"id":ID
    };
    [manager GET:@"https://api.weibo.com/2/comments/show.json" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemCommentArray = @[].mutableCopy;
        NSArray *CommentArray = [((NSDictionary *)responseObject)objectForKey:@"comments"];
        for(NSDictionary *info in CommentArray){
            GetListItem *list = [[GetListItem alloc] init];
            [list CommentconfigwithDictionary:info];
            [listItemCommentArray addObject:list];
        }
        NSLog(@"");
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemCommentArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}


/**获取微博网页数据*/
- (void)LoadSelectionListDataBlock:(SelectionListItemLoadBlock)finishBlock URL:(NSString *)URL andPage:(int)page{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSDictionary *header = @{@"User-Agent":@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Safari/605.1.15"};
    NSString *stringpage = [NSString stringWithFormat:@"%d",page];
    NSString *url1 = [URL stringByAppendingString:@"&refresh="];
    NSString *url = [url1 stringByAppendingString:stringpage];

    
    [manager GET:url parameters:nil headers:header progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemSelectionArray = @[].mutableCopy;
        NSArray *SelectionArray = [((NSDictionary *)responseObject)objectForKey:@"statuses"];
        for(NSDictionary *info in SelectionArray){
            GetListItem *list = [[GetListItem alloc] init];
            [list WeiboconfigWithDictionary:info];
            [listItemSelectionArray addObject:list];
        }
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemSelectionArray.copy);
            }
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.description);
    }];
}

- (void)LoadSelectionCommentBlock:(SelectionCommentBlock)finishBlock andid:(NSString *)ID uid:(NSString *)uid{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url1 = @"https://weibo.com/ajax/statuses/buildComments?is_reload=1&is_show_bulletin=2&is_mix=0&count=20&type=feed&";
    NSString *url2 = [url1 stringByAppendingString:@"id="];
    NSString *url3 = [url2 stringByAppendingString:ID];
    NSString *url4 = [url3 stringByAppendingString:@"&uid="];
    NSString *URL = [url4 stringByAppendingString:uid];
    NSDictionary *header = @{@"User-Agent":@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Safari/605.1.15"};
    [manager GET:URL parameters:nil headers:header progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *listItemCommentArray = @[].mutableCopy;
        NSArray *CommentArray = [((NSDictionary *)responseObject)objectForKey:@"data"];
        for(NSDictionary *info in CommentArray){
            GetListItem *list = [[GetListItem alloc] init];
            [list CommentconfigwithDictionary:info];
            [listItemCommentArray addObject:list];
        }
        NSLog(@"");
        dispatch_async(dispatch_get_main_queue(),^{
            if(finishBlock){
                finishBlock(listItemCommentArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];


    

}

//https://weibo.com/ajax/statuses/buildComments?is_reload=1&id=4792947180050075&is_show_bulletin=2&is_mix=0&count=20&type=feed&uid=5230132970



@end
