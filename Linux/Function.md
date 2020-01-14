## Linux System function
```c
/* 忽略掉在 fd 的缓存区但是还没有写到 fd 的数据，或者已经接收到但是还没有读取的数据
 * 根据不同的 queue_selector 决定是忽略哪些数据
 * TCIFLUSH：忽略接收到但是未读取的数据
 * TCOFLUSH：忽略到需要写但是没有写的数据
 * TCIOFLUSH：忽略未读和未写数据
 */
1. int tcflush(int fd, int queue_selector);

```
