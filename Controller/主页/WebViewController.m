//
//  WebViewController.m
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>
#import "Singleton.h"

@interface WebViewController ()
@property(nonatomic,strong,readwrite)WKWebView *webview;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:({
        self.webview=[[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88)];
        self.webview;
    })];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(geturl:) name:@"传网址" object:nil];
    Singleton *single=[[Singleton alloc] init];
   // single.URLString=@"http://www.baidu.com";

    NSLog(@"%@",single.URLString);

   
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:single.URLString]]];

}


- (void)geturl:(NSNotification*)notification{
    
//    Singleton *single=[[Singleton alloc] init];
    
    _urlstring=[notification.userInfo objectForKey:@"url"];
    
    NSLog(@"");
}

- (void)dealloc {
    //移除所有通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
   
}



@end
