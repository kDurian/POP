//
//  TTOAuthViewController.m
//  Demo_WebView
//
//  Created by Durian on 2016/12/30.
//  Copyright © 2016年 durian. All rights reserved.
//

#import "OAuthViewController.h"
#import "OAuth2Account.h"
#import "OAuth2AccountTool.h"

#import "NSObject+YYModel.h"
#import "WBTabBarController.h"

#import "XMNetworking.h"


#define kGrantType @"authorization_code"
#define kOAuth2AuthorizeURL @"https://api.weibo.com/oauth2/authorize"
#define kOAuth2AccessTokenURL @"https://api.weibo.com/oauth2/access_token"



@interface OAuthViewController ()<UIWebViewDelegate>

@end

@implementation OAuthViewController {
    UIWebView *_webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    _webView.delegate = self;
    [self.view addSubview:_webView];

    NSString *URLStr = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@", kOAuth2AuthorizeURL, APPKEY, REDIRECTURI];
    NSURL *authorizeURL = [NSURL URLWithString:URLStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:authorizeURL];
    
    [_webView loadRequest:request];
}


#pragma mark - UIWebView Delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *URLStr = request.URL.absoluteString;
    NSRange range = [URLStr rangeOfString:@"code="];
    if (range.length) {
        NSString *authorize_code= [URLStr substringFromIndex:range.location + range.length];
        [self getAccessTokenWithAuthorizeCode:authorize_code];
        
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
//    NSLog(@"did start...");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {

}

#pragma mark - 
- (void)getAccessTokenWithAuthorizeCode:(NSString *)code {
    if (code.length <= 0) return;
    
    NSString *format = @"%@?client_id=%@&client_secret=%@&grant_type=%@&redriect_uri=%@&code=%@";
    NSString *url = [NSString stringWithFormat:format, kOAuth2AccessTokenURL, APPKEY, APPSECRET, kGrantType, REDIRECTURI, code];
    
    NSDictionary *param = @{
                            @"client_id" : APPKEY,
                            @"client_secret" : APPSECRET,
                            @"grant_type" : kGrantType,
                            @"redirect_uri" : REDIRECTURI,
                            @"code" : code
                            };
    

//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
//    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
//    
//    [manager POST:url parameters:param success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        
//        if ([responseObject isKindOfClass:[NSData class]]) {
//            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//            NSLog(@"json: %@", json);
//        } else {
//            NSLog(@"responseObject: %@", responseObject);
//            
//            
//        }
//        
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        NSLog(@"error: %@", error);
//        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:REDIRECTURI]]];
//    }];
    
    

    

    
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.url = kOAuth2AccessTokenURL;
        request.parameters = param;
        request.httpMethod = kXMHTTPMethodPOST;
    } onSuccess:^(id  _Nullable responseObject) {
        if (!responseObject) return;
        OAuth2Account *account = [OAuth2Account modelWithJSON:responseObject];
        [OAuth2AccountTool saveAccount:account];
        
        [self setRootViewControllerForKeyWindow];
    } onFailure:^(NSError * _Nullable error) {
        NSLog(@"error: %@", error);
    }];
}

- (void)setRootViewControllerForKeyWindow {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    WBTabBarController *tab = [[WBTabBarController alloc] init];
    window.rootViewController = tab;
}
@end
