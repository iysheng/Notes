
### libevent 代码阅读笔记
1. 数据结构 tailqueue
2. 数据结构 list
3. gnu gcc 的 attribute 属性，标记函数属性的时候，添加到函数的最开始，结构体的最末尾！！！
``` C
/*
 * __attribute__ ((unused)) 属性标记这个函数极有可能不会调用，告诉 gcc 不要打警告
 */
__attribute__ ((unused)) int funca(void)
{
    return 0;
}

/*
 * __attribute__((packed)) 属性标记这个结构体具有打包属性，纵使这个结构体没有实际的 pack 效果，也不要打警告
 */
struct foo {
int x;
char a, b, c, d;
} __attribute__((packed));
```

### tmux 代码阅读笔记
1.int flock(int fd, int operation);
