### UNIX 网络编程

#### IPv4 套接字地址结构通常被称为"网际套接字地址结构",以 sockaddr_in 命名,定义在 <netinet/in.h> 头文件中.POSIX 定义为:
```
struct in_addr{
    in_addr_t s_addr; /* 32bit IPv4 address */
}

struct sockaddr_in{
    uint8_t sin_len;  /* length of structure (16) */
    sa_family_t  sin_family; /*  */
    in_port_t sin_port; /* 16 bit 的 TCP/UDP port */
    struct in_addr sin_addr; /* 32 bit IPv4 网络字节序 */
    char sin_zero[8]; /* unused */
}
```
POSIX 规范只需要这个结构体的 3 个字段:sin_family, sin_addr, sin_port.针对符合 POSIX 的实现来说,定义额外的结构字段是可以接受的,几乎所有的实现都增加了 sin_zero 字段,所以所有的套接字地址结构大小至少 16 字节.
* in_addr_t 数据类型必须是一个至少 32 bit 的无符号整形
* in_port_t 必须是一个至少 16 bit 的无符号整形
* sa_family_t 可以是任何无符号整形, 但是在支持长度字段的实现中,通常是 8 bit 的无符号整形,在不支持长度字段的实现中,通常是 16 bit 的无符号整形
* 通用套接字地址结构,因为套接字函数是在 ANSI C 之前定义的(当时还没有 void * 类型),所以当时添加了一个通用套接字类型 ``struct sockaddr``, 这个结构体定义为:
```
struct sockaddr {
    uint8_t sa_len;
    sa_family_t sa_family;
    char sa_data[14];
}
```
* recvfrom 函数传递的参数 src_addr 和 addrlen ,会指向真正接收到的数据的源地址
```
ssize_t recvfrom(int sockfd, void *restrict buf, size_t len, int flags,
                        struct sockaddr *restrict src_addr,
                        socklen_t *restrict addrlen);
```
