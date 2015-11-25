//
//  HandleResponsePlugin.h
//  HelloCordova
//
//  Created by daniel.martinez on 24/11/15.
//
//

#import <Foundation/Foundation.h>

#import <Cordova/CDVPlugin.h>

@interface HandleResponsePlugin : CDVPlugin

- (void)handle:(CDVInvokedUrlCommand *)command;

@end
