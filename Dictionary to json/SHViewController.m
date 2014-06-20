//
//  SHViewController.m
//  Dictionary to json
//
//  Created by Salim Hanhan on 6/17/14.
//  Copyright (c) 2014 DarthVader. All rights reserved.
//

#import "SHViewController.h"

@interface SHViewController ()

@end

@implementation SHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSError * err;
    
    ///////////////// request /////////////////
    
    NSMutableDictionary *paramd = [[NSMutableDictionary alloc] init];
    [paramd setObject:@"iosdevelopment" forKey:@"identity"];
    [paramd setObject:@"salimsalim" forKey:@"password"];
    [paramd setObject:@"create_ios_account" forKey:@"type"];//device
    [paramd setObject:@"allowme" forKey:@"test"];
    
    NSMutableDictionary* deviceObject = [[NSMutableDictionary alloc]init];
    [deviceObject setObject:[[UIDevice currentDevice] model] forKey:@"device_hardware"];
    [deviceObject setObject:[[UIDevice currentDevice]  systemVersion] forKey:@"device_os_version"];
    [deviceObject setObject:[[UIDevice currentDevice]  systemVersion] forKey:@"device_os"];
    [deviceObject setObject:[[NSLocale currentLocale]  localeIdentifier] forKey:@"location"];
    [deviceObject setObject:@"RLrZAYA0AQFUHTwAEBgpCkAAAABmi/AB5yULsYnmzyehCX5eYU/UuLPSfDXYXcECOhIyXEIccUjMIeXYF2bgOeGRxyTRH/Qh0rxlNR9wA0F1/IO6Qq+bIQ12V6yWn3jtA0hw75y39xVl5S2jpEXy5ePPswp7ICySRwVj00Ay3iL8oElMeyeXfxhrz+HWaFbKm1vRfDToO145/ojA53IspppjT6/5YHBlF+hi8Z6mVrw7/w0qyYc+7CRdracrEY72Uv4V7ETWgxeBeDSfYAsqc1Iq6tkzVJcQkBpjX7vpfprVl1C8hPjAwRyBS5KTn1WJAsAXp5BgCTun2DThd/" forKey:@"public_key"];
    [deviceObject setObject:[[UIDevice currentDevice] model] forKey:@"device_uniq_id"];
    [deviceObject setObject:[[UIDevice currentDevice] model] forKey:@"raw_info"];
    [deviceObject setObject:[[UIDevice currentDevice] model] forKey:@"pilmeo_device_uniq_id"];
    
    
    [paramd setObject:deviceObject forKey:@"device"];//authenticate
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setObject:paramd forKey:@"authenticate"];

    ///////////////////////////////// End request ///////////////////
    
    NSMutableDictionary * identity = [[NSMutableDictionary alloc] init];
    [identity setObject:@"poopookaakaa668" forKey:@"identity"];
    [identity setObject:@"create_ios_account" forKey:@"type"];
    [identity setObject:@"[poopoopoo123]" forKey:@"password"];
    
    NSMutableDictionary * engolfingId = [[NSMutableDictionary alloc] init];
    [engolfingId setObject:identity forKey:@"authenticate"];
    
    NSData *someJson = [NSJSONSerialization dataWithJSONObject:param options:kNilOptions error:&err];
    
  //  NSLog(@"%@", [[NSString alloc] initWithData:someJson encoding:NSUTF8StringEncoding]);
    
    

    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];

    NSString *url_string = [NSString stringWithFormat:@"%@", @"https://testdev.pilmeo.com/debug"];
    
    NSURL* requestURL = [NSURL URLWithString: url_string];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
//    [request setHTTPShouldHandleCookies:NO];
//    [request setTimeoutInterval:120.0];
//    [request setHTTPMethod:@"POST"];
//    [request setURL:requestURL];
//    [request setHTTPBody:someJson];
//    [request setValue:@"allowme" forHTTPHeaderField: @"test"];
//    [request addValue:@"allowme" forHTTPHeaderField: @"test"];
//    [request setValue:@"test" forHTTPHeaderField:@"allowme"];
//    [request addValue:@"test" forHTTPHeaderField:@"allowme"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];//test: allowme
    
//        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue]
//                               completionHandler: ^(NSURLResponse * response, NSData * data, NSError * error) {
//                                   NSHTTPURLResponse * httpResponse = (NSHTTPURLResponse*)response;
//    
//                                   NSLog(@"responce %@", response);
//                               }
//         ];

    
    
    //////////////////////////// New     ///////////////////////////////////////////
  


    NSURL *server = [NSURL URLWithString:@"https://testdev.pilmeo.com/debug"];//http://www.cocoanetics.com/feed/
    NSMutableURLRequest *request1 = [NSMutableURLRequest requestWithURL:server];
    [request1 setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request1 setHTTPShouldHandleCookies:NO];
    [request1 setTimeoutInterval:120.0];
    [request1 setHTTPMethod:@"POST"];
    //[request1 setURL:requestURL];
    [request setHTTPBody:someJson];
    [request1 setValue:@"allowme" forHTTPHeaderField: @"test"];
     //   [request addValue:@"allowme" forHTTPHeaderField: @"test"];
     //  [request1 setValue:@"test" forHTTPHeaderField:@"allowme"];
    //    [request addValue:@"test" forHTTPHeaderField:@"allowme"];
    [request1 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request1 setValue:contentType forHTTPHeaderField: @"Content-Type"];//test: allowme
    
    
    NSURLConnection* connection = [NSURLConnection connectionWithRequest:request1 delegate:self];
    
    [connection start];
    
    // use synchronous convenience method
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *returnedData = [NSURLConnection sendSynchronousRequest:request1
                                                 returningResponse:&response
                                                             error:&error];
    
    if (!returnedData)
    {
        NSLog(@"Error retrieving data, %@", [error localizedDescription]);
        return ;//NO
    }
    
    // get the correct text encoding
    // http://stackoverflow.com/questions/1409537/nsdata-to-nsstring-converstion-problem
//    CFStringEncoding cfEncoding = CFStringConvertIANACharSetNameToEncoding((__bridge CFStringRef)
//                                                                           [response textEncodingName]);
//    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(cfEncoding);
    
   
    // output
    NSLog(@"%@", response);
    NSString *xml = [[NSString alloc] initWithData:returnedData encoding:NSASCIIStringEncoding];//encoding
    NSLog(@"return  %@", xml);
 
    ///////////////////////////////    End      ////////////////

    
    

//    [NSURLConnection sendAsynchronousRequest:request
//                                       queue:[NSOperationQueue mainQueue]
//                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//                               
//                               [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//                               NSString* myString;
//                               myString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
//                               NSLog(@"Post Before json %@",data);//[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]
//                           }
//     ];





}

- (BOOL)connection:(NSURLConnection *)connection
canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
	return [protectionSpace.authenticationMethod
			isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection
didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	if ([challenge.protectionSpace.authenticationMethod
		 isEqualToString:NSURLAuthenticationMethodServerTrust])
	{
		// we only trust our own domain
		if ([challenge.protectionSpace.host isEqualToString:@"testdev.pilmeo.com"])
		{
			NSURLCredential *credential =
            [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
			[challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
		}
	}
    
	[challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
