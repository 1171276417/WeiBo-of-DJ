//
//  PostViewController.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import "PostViewController.h"

@interface PostViewController ()<UITextViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    _postview=[[PostView alloc] initWithFrame:CGRectMake(0, 96, self.view.frame.size.width, self.view.frame.size.height-96)];
    [_postview LoadPoatTextField];
    _postview.text.delegate=self;
    [self.view addSubview:_postview];
    
    /**加载NavigationBar*/
    _navpost=[[PostNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 96)];
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
    NSString *myreposts_count=[NSString stringWithFormat:@"%d",arc4random()%100];
    NSString *mycomments_count=[NSString stringWithFormat:@"%d",arc4random()%100];
    NSString *myattitudes_count=[NSString stringWithFormat:@"%d",arc4random()%100];

    NSDictionary *dic=@{
                        @"profile_image_url":@"https://tvax4.sinaimg.cn/crop.0.0.1080.1080.50/007iIBoBly8gca6i2g9lqj30u00u0tat.jpg?",
                        @"screen_name":@"云水泱泱丿",
                        @"created_at":@"",
                        @"source":@"dj微博",
                        @"text":_postview.text.text,
                        @"thumbnail_pic":@"",
                        @"myreposts_count":myreposts_count,
                        @"mycomments_count":mycomments_count,
                        @"myattitudes_count":myattitudes_count,

    };
    _postview.text.text=nil;
    PostListItem *postlist=[[PostListItem alloc] init];
    [postlist PostWeiboDataDictionary:dic];
    Singleton *single=[[Singleton alloc] init];
    [single.PostArray insertObject:postlist atIndex:0];
    [self.navigationController popViewControllerAnimated:YES];
    
    HomeView *home=[[HomeView alloc] init];
    home.placeholder.hidden=YES;
    [home.mytableview reloadData];

}


/**TextView代理*/
- (void)textViewDidChange:(UITextView *)textView{
    if(textView.text.length)
        _postview.placeholder.hidden=YES;
    else
        _postview.placeholder.hidden=NO;
    
    _text=self.postview.text.text;
    
    
}


@end
