//
//  MemoryUtils.m
//  Lifecake-test
//
//  Created by Artjom Popov on 02/05/15.
//  Copyright (c) 2015 Artjom Popov. All rights reserved.
//

#import "MemoryUtils.h"

#import <mach/mach.h>
#import <mach/mach_host.h>

@implementation MemoryUtils

+ (void)printFreeMemory {
  mach_port_t host_port;
  mach_msg_type_number_t host_size;
  vm_size_t pagesize;
  host_port = mach_host_self();
  host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
  host_page_size(host_port, &pagesize);
  vm_statistics_data_t vm_stat;
  if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
    NSLog(@"Failed to fetch vm statistics");
    return;
  }
  
  /* Stats in bytes */
  CGFloat mem_free = vm_stat.free_count * pagesize;
  NSLog(@"%.2fMB", mem_free / (8.0f * 1024 * 1024));
}

@end
