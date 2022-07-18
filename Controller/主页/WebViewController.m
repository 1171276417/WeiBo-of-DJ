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
    //single.URLString=@"http://t.cn/A6aYOG4D";
    NSLog(@"%@",single.URLString);
    NSLog(@"");
//    NSString *URL1 = [single.URLString stringByReplacingOccurrencesOfString:@" " withString:@""];
//    NSString *URL2 = [URL1 stringByReplacingOccurrencesOfString:@"(" withString:@""];
//    NSString *URL3 = [URL2 stringByReplacingOccurrencesOfString:@")" withString:@""];
//    NSString *URL = [URL3 stringByReplacingOccurrencesOfString:@" withString:@""];
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"[]{}（#%-*+=_）\\|~(＜＞$%^&*)_+ "];
    NSString *URL = [[single.URLString componentsSeparatedByCharactersInSet: doNotWant]componentsJoinedByString: @""];

    NSLog(@"%@",single.URLString);
    NSLog(@"");
    

    NSLog(@"%@",single.URLString);

   
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URL]]];

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
