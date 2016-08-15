# [SDWebImage](https://github.com/rs/SDWebImage) vs [PINRemoteImage](https://github.com/pinterest/PINRemoteImage)

benchmark SDWebImage and  PINRemoteImage.

## Benchmarks

- Loaded four times the 500 images (Loaded the 2000 images in total)
- The cache has been hit from the 501 th image

> e.g https://youtu.be/8Xu9O-7AmLU

## Summary

It is faster than SDWebImage more of PINRemoteImage.

### SDWebImage

 - time, memory
 - 15.459992945194244 ms, 305.4 MB
 - 15.180207014083862 ms, 305.9 MB
 - 14.194296956062317 ms, 306.4 MB
 - 15.525336980819702 ms, 305.5 MB
 - 15.591868042945862 ms, 305.4 MB
 - avg: 15.19034039 ms, 305.72 MB

> movie: https://youtu.be/8Xu9O-7AmLU

It is flickering... 😵

### PINRemoteImage

 - time, memory
 - 13.661346018314362 ms, 34.7 MB
 - 13.862448990345001 ms, 35.7 MB
 - 14.107374012470245 ms, 35.8 MB
 - 13.682069957256317 ms, 34.4 MB
 - 15.576615989208221 ms, 35.1 MB
 - 14.17797099 ms, 35.14 MB

> movie: https://youtu.be/T0jDrUqnlxU


Smooth 😀 and low memory !
