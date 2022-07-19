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
        self.webview=[[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        self.webview;
    })];

    Singleton *single=[[Singleton alloc] init];
    GetListItem *list = [[GetListItem alloc] init];
    list = (GetListItem *)single.WeiboDictionary;
    
    NSString *text = list.text;
    
    NSString *URL1 = [[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:[self getURLFromStr:text] options:0 error:nil] encoding:NSUTF8StringEncoding];
   
    NSString *URL2 = [URL1 stringByReplacingOccurrencesOfString:@"("withString:@""].mutableCopy;
    NSString *URL3 = [URL2 stringByReplacingOccurrencesOfString:@")"withString:@""].mutableCopy;
    NSString *URL4 = [URL3 stringByReplacingOccurrencesOfString:@"\\"withString:@" "].mutableCopy;
    NSString *URL5 = [URL4 stringByReplacingOccurrencesOfString:@"\""withString:@""].mutableCopy;
    NSString *URL6 = [URL5 stringByReplacingOccurrencesOfString:@"["withString:@""].mutableCopy;
    NSString *URL7 = [URL6 stringByReplacingOccurrencesOfString:@"]"withString:@""].mutableCopy;
    NSString *URL8 = [URL7 stringByReplacingOccurrencesOfString:@" "withString:@""].mutableCopy;

    
    

   
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URL8]]];

}


- (NSArray*)getURLFromStr:(NSString *)string {
    NSError *error;
    //可以识别url的正则表达式
    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";

    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
    options:NSRegularExpressionCaseInsensitive
    error:&error];

    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];

    //NSString *subStr;
    NSMutableArray *arr=[[NSMutableArray alloc] init];

    for (NSTextCheckingResult *match in arrayOfAllMatches){
        NSString* substringForMatch;
        substringForMatch = [string substringWithRange:match.range];
        [arr addObject:substringForMatch];
    }
    return arr;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;

}



@end
