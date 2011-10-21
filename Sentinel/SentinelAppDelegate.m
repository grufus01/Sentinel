//
//  SentinelAppDelegate.m
//  Sentinel
//
//  Created by Fekri Kassem on 10/16/11.
//  Copyright 2011 Self. All rights reserved.
//

#import "SentinelAppDelegate.h"

@implementation SentinelAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

	theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://128.238.151.253/"] 	  
								cachePolicy:NSURLRequestUseProtocolCachePolicy						  
							timeoutInterval:60.0];
	
	theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	
	view = [[UIWebView alloc] initWithFrame:CGRectMake(0,0,320,240)];
	[self.window addSubview:view];
	[self.window makeKeyAndVisible];
	return YES;
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
	if ([challenge previousFailureCount] == 0)
	{
		NSURLCredential *newCredential;
		newCredential=[NSURLCredential credentialWithUser:@"kongcao7bl"
												 password:@"Kongcao7BL"
											  persistence:NSURLCredentialPersistenceForSession];
		[[challenge sender] useCredential:newCredential forAuthenticationChallenge:challenge];
		NSURL *url = [NSURL URLWithString:@"http://128.238.151.253/nphMotionJpeg?Resolution=320x240&Quality=Standard"];
		NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
		[view loadRequest:requestObj];
	}
	else
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Authentication Failure" 
														message:@"Invalid username/password."
													   delegate:nil
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [connection release];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [view release];
    [_window release];
    [super dealloc];
}

@end
