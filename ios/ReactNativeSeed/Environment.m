#import "Environment.h"

@implementation Environment

RCT_EXPORT_MODULE();

- (NSDictionary *)constantsToExport
{
  return @{
           @"env": ENVIRONMENT
          };
}

@end
