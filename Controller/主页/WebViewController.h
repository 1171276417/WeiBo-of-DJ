//
//  WebViewController.h
//  微博4.0
//
//  Created by 邓杰 on 2022/5/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebViewController : UIViewController

@property(nonatomic,strong)NSString *urlstring;

- (void)geturl:(NSNotification*)notification;


@end

NS_ASSUME_NONNULL_END
