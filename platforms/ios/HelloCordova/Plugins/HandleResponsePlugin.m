//
//  HandleResponsePlugin.m
//  HelloCordova
//
//  Created by daniel.martinez on 24/11/15.
//
//

#import "HandleResponsePlugin.h"

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
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:testUrl] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSArray *JSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSLog(@"RESPONSE: -----\n%@", JSON);
        
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:JSON];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
        
    }] resume];
    
}

@end
