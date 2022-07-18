//
//  PostCommentViewController.m
//  微博4.0
//
//  Created by 邓杰 on 2022/7/17.
//

#import "PostCommentViewController.h"

@interface PostCommentViewController ()<UITextViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>


@end

@implementation PostCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    _postview=[[PostCommentView alloc] initWithFrame:CGRectMake(0, 96, self.view.frame.size.width, self.view.frame.size.height-96)];
    [_postview LoadPoatTextField];
    _postview.text.delegate=self;
    [self.view addSubview:_postview];
    
    /**加载NavigationBar*/
    _navpost=[[PostCommentNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 96)];
    [_navpost SetPostNavigationBar];
    [self.view addSubview:_navpost];
    
    [self.navpost.back addTarget:self action:@selector(back)  forControlEvents:UIControlEventTouchUpInside];//返回主页
    [self.navpost.post addTarget:self action:@selector(Post)  forControlEvents:UIControlEventTouchUpInside];//发微博
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)Post{
    NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";//#%<>[\]^`{|} //@"!*'();:@&=+$,/?%#[]"
    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    NSString *encodedString = [self.postview.text.text stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    
    Singleton *single = [[Singleton alloc] init];
    GetListItem *list = [[GetListItem alloc] init];
    list = (GetListItem *)single.WeiboDictionary;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/html",@"text/plain",nil];


    NSDictionary *paramDict = @{
        @"access_token":@"2.00b5biSHqpMClB6963486d9cjFixpC",
        @"id":list.ID,
        @"comment":encodedString
    };
    NSLog(@"");
    [manager POST:@"https://api.weibo.com/2/comments/create.json" parameters:paramDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.description);
        NSLog(@"");
    }];
    
//    NSString *URLString = [[NSString alloc] initWithFormat:@"%@,%@,%@,%@",@"https://api.weibo.com/2/comments/create.json?access_token=2.00b5biSHqpMClB6963486d9cjFixpC&id=",list.ID,@"&comment=",encodedString];
//    NSURL *url = [NSURL URLWithString:URLString];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    request.HTTPMethod = @"POST";
//    NSString *boby = [[NSString alloc] initWithFormat:@"%@,%@,%@,%@",@"access_token=2.00b5biSHqpMClB6963486d9cjFixpC&id=",list.ID,@"&comment=",encodedString];
//    request.HTTPBody = [boby dataUsingEncoding:NSUTF8StringEncoding];
//    NSURLSession *session =[NSURLSession sharedSession];
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"%@,%@,%@",response,error,data);
//    }];
//    [task resume];
    
    
    
    
    
}











@end
