//
//  ViewController.m
//  FacebookShareTest
//
//  Created by Liuguiliang on 2017/2/4.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
@interface ViewController ()<FBSDKSharingDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 ;
}
- (IBAction)purchaseEvent:(id)sender {
    
    [FBSDKAppEvents logEvent:@"purchaseEvent"];
    [FBSDKAppEvents logPurchase:4.32 currency:@"USD"];
}

- (IBAction)shareEvent:(FBSDKShareButton *)sender {
    
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentTitle = @"Test test test";
    content.contentURL = [NSURL URLWithString:@"http://in.juanpi.com/share/index?goodsId=1251427&country=US"];

   FBSDKShareDialog *dialog = [FBSDKShareDialog showFromViewController:self
                                 withContent:content
                                delegate:self];
   dialog.mode = FBSDKShareDialogModeBrowser;
    
    
//   修改弹窗模式
//    FBSDKShareDialog *dialog = [[FBSDKShareDialog alloc] init];
//    dialog.fromViewController = self;
//    dialog.shareContent = content;
//    dialog.mode = FBSDKShareDialogModeFeedWeb;
//    [dialog show];



}
/**
 Sent to the delegate when the share completes without error or cancellation.
 - Parameter sharer: The FBSDKSharing that completed.
 - Parameter results: The results from the sharer.  This may be nil or empty.
 */
- (void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results {
    
    NSLog(@"didCompleteWithResults： %@",results);

}

/**
 Sent to the delegate when the sharer encounters an error.
 - Parameter sharer: The FBSDKSharing that completed.
 - Parameter error: The error.
 */
- (void)sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError： %@",error);

}

/**
 Sent to the delegate when the sharer is cancelled.
 - Parameter sharer: The FBSDKSharing that completed.
 */
- (void)sharerDidCancel:(id<FBSDKSharing>)sharer {

    NSLog(@"sharerDidCancel：%@",sharer);
}




@end
