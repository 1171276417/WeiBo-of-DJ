//
//  PostCommentView.h
//  微博4.0
//
//  Created by 邓杰 on 2022/7/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostCommentView : UIView

@property(strong,nonatomic)UITextView *text;
@property(strong,nonatomic)UILabel *placeholder;

- (void)LoadPoatTextField;

@end

NS_ASSUME_NONNULL_END
