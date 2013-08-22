//
//  NSDictionary+Extensions.m
//

#import "NSDictionary+Extensions.h"
#import "NSString+Extensions.h"

@implementation NSDictionary (Extensions)

- (NSString *)queryStringValue
{
    NSMutableArray *pairs;
    NSString *s;
    
    pairs = [NSMutableArray array];
    
    for (NSString *key in [self keyEnumerator])
    {
        id value = [self objectForKey:key];
        
        if ([value isKindOfClass:[NSString class]])
            s = [value urlEncode];
        else
            s = [NSString stringWithFormat:@"%@", value];
        
        [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, s]];
    }
    
    return [pairs componentsJoinedByString:@"&"];
}

@end