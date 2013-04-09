nv-ios-digest
=============


Overview
--------

This project provides simple wrapper interfaces to compute
message digests using Common Crypto. Supported methods are
listed below:

  * MD5
  * SHA1
  * SHA224
  * SHA256
  * SHA384
  * SHA512


License
-------

Apache License, Version 2.0


Download
--------

    git clone https://github.com/TakahikoKawasaki/nv-ios-digest.git


Example
-------

    // Create an MD5 instance using the convenience constructor.
    MD5 *md5 = [MD5 md5WithString:@"Hello, world."];

    // Print the MD5 digest value as string.
    // This will show "md5 = 080aef839b95facf73ec599375e92d47".
    NSLog(@"md5 = %@", md5);

    // Another way to compute.
    md5 = [[MD5 alloc] init];
    [md5 updateWithString:@"Hello", world."];
    [md5 final];
    NSLog(@"md5 = %@", md5);


Author
------

Takahiko Kawasaki, Neo Visionaries Inc.
