//
//  HandleResponsePlugin.m
//  HelloCordova
//
//  Created by daniel.martinez on 24/11/15.
//
//

#import "HandleResponsePlugin.h"
#import "AFHTTPRequestOperationManager.h"

@implementation HandleResponsePlugin

- (void)handle:(CDVInvokedUrlCommand *)command {
    NSArray *args = command.arguments;
    for (NSString *argument in args) {
        if ([argument isEqualToString:@"testService"]) {
            [self testService:command.callbackId];
        }
    }
}

- (void)testService:(NSString *)callbackId {
    
    NSString *testUrl = @"http://private-54ee3-igzdanielmartinez.apiary-mock.com/notes";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:testUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"ResponseObject: -----\n%@", responseObject);
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:responseObject];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

@end
