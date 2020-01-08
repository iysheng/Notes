
1. Fedora 添加库和禁止、使能库
	1. dnf config-manager --add-repo /etc/yum.repos.d/fedora_extras.repo
	2. 禁止、使能库 repository ，这个库名字是在 \*.repo 文件定义的
	3. dnf config-manager --set-disabled repository
	4. dnf config-manager --set-enabled repository
	5. sudo dnf remove $(dnf repoquery  --installonly --latest-limit=-1 -q)
	6. figlet 工具可以将字符串图像化

2. scp 和 ssh sshpass 命令
	1. 复制 filename 到 serverip 设备的 dir 目录，键入该命令会提示输入 username 的密码
	2. scp filename username@serverip:/dir
	3. 通过 ssh 连接 serverip，用户名是 username
	4. ssh username@serverip
	5. 提前将密码放到 -p 选项地方，其他和一般的 scp 命令一样
	6. sshpass -p "passwdxxx" scp filename username@serverip:/dir

3. git 使用笔记
	1. git log --oneline /* 每一个 commit 只显示一行 */
	2. git log -nx  /* 显示最近的 x 次提交 */
	3. git help --web [command] /* 在浏览器查看 git [command] 的 help 信息 */
	4. git cat-file -t hash 查看一个hash值表示的类型（比如说是提交、tag、、、）
	5. git cat-file -p hash 查看一个hash值的详细信息
	6. git config 的配置信息可以参看 .git 目录的 cofig 文件
	7. commit 是当前工作区的一个快照，只能包含一个 tree，一个 tree 可以包含多个 tree 和 blob，tree 可以认为是目录类型，blob 是文件类型
	8. detached HEAD(分离头指针) git checkout commitid 的时候就会创建出分离头指针，分离头指针就是说 HEAD 直接指向一个 commit，没有关联到一个分支的情况，这时候需要git branch commitid 创建出一个分支，关联这次 checkout；
	9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异9. git diff commit_id0 commit_id1 ；对比两次提交的差异
	10. HEAD^1 或者 HEAD^ 表示 HEAD 的父亲， HEAD^^ 或者 HEAD^1^1 父亲的父亲，HEAD~ HEAD 的父亲，HEAD~2 父亲的父亲
	11. git branch -d 分支名；删除分支，如果分支没有被 merge，那么会提示无法删除；git branch -D 分支名，强制删除分支
	12. git commit --amend ；修改最近一次提交的注释 message
	13. git rebase -i commit_id ；然后就可以修改待修改的 commit 的 message；git rebase 还可以做很多事情；记得保存 parent
	14. git diff --cached ；暂存区和 HEAD 的差异
	15. git diff ；工作区和 HEAD 的差异
	16. git diff -- 文件名；对比工作区某个文件和 HEAD 的差异
	17. git diff commit_id0 commit_id1：对比两次 commit_id 的差异
	18. git diff commit_id0 commit_id1 -- 文件名；对比指定文件，在 commit_id0 和 commit_id1 这两次提交的差异
	19. git reset HEAD；将暂存区的变更撤回工作区，暂存区的内容就和 HEAD 的一样了
	20. git reset HEAD -- 文件名； 将暂存区的某个文件的变更撤回工作区
	21. git reset --hard commit_id：清除最近的几次提交，将工作区和暂存区强制回退到指定的那次提交
	22. git checkout -- 文件名；将工作区某个文件的变更撤销
	23. git rm 文件名；删除某一个文件
	24. git stash；暂存状态快照到“栈”
	25. git stash list；查看当前“栈”的快照
	26. git stash apply；从“栈”顶恢复快照，但不删除“栈”的这个快照
	27. git stash pop；从“栈”顶恢复快照，但是会删除“栈”的这个快照
	28. .gitignore 文件包含了 git 不希望管理跟踪的文件或者文件类型
	29. git clone --bare；克隆一个不带工作区的裸仓库
	30. git remote add 远端源名称 远端源地址；添加一个远端仓库
	31. git push --set-upstream 远端仓库名 本地分支；推送本地分支到远端仓库
	32. 哑协议表示不带进度条，智能协议带进度条 file://路径名表示智能协议，单独路径名表示哑协议，ssh https http 这些都是智能协议
	33. 修改 ~/.gitconfig 文件，添加 alias 字段，可以添加命令别名
	34. 如果是 fork 其他人打仓库，建议添加一个 upstream 的 remote 源，可以同步更新原版的源，通过 git pull upstream/master 或者分为两个步骤：
	git fetch upstream; git merger upstream/master
	35. 提交 pull request ，需要首先将代码提交到自己 fork 后打仓库，然后在 github 上点击创建 pr，在 github 上点击 New pull request，根据步骤就好
	36. git val -l ：查看定义打 git 相关的变量; ~/.gitconfig 文件，用户定义打 git 打配置文件， [core]\n editor = vim 使用 vim 取代 默认打 nano 作为 git 打默认编辑器（提交、rebase 等时候调用的编辑器）
	37. git push 的时候卡住，添加了git config --global core.askpass "git-gui--askpass" 就可以解决；通过 http 或者 svn 时候，push 的时候可能会需要账     号密码，可能当时是被键入账号和密码的程序卡住了？？？
	38. git status 修改 core.quotepath 为 flase；修改为 false 可以保证大于 0x80 的字节不会以 hex 模式显示，可以解决中文乱码的问题；具体细节可以参考 man git-config 搜索 quotepath
	39. git reset commitid filenames ：回退某个文件到某次提交
	40. git reset --hard commitid ：可以撤销在本地还没有 push 的 commit
	41. git branch -a 查看所有分支
	42. git branch -r 查看远程分支
	43. git checkout branchname 切换到某个分支
	44. git commit --amend  文件名；//修改某次提交的日志信息，还可以追加提交的文件
	45. git log --stat ；// review the files modify each commit
	46. git diff commitid ；// review the files modify detiles this commit
	47. git show commitid ；// 查看某一次提交修改的代码
4. 本地搭建 git 服务器
	1. 创建一个 git 用户（为了方便用户提交的时候统一走 git 用户），git 用户的目录权限很重要（权限要正确，否则无法通过阿里云连接）
	2. chmod 755 ~ [备注：关于目录 .ssh/ 和文件.ssh/authorized_keys 的权限需要严格按照这个权限，否则无法正常通过密钥文件验证，但是，测试的时候，还是可以通过 systemctl status sshd.service 查看]
	3. chmod 700 ~/.ssh
	4. chmod 600 ~/.ssh/authorized_keys
	5. 将用户的公钥追加到文件 ~/.ssh/authorized_keys
	6. 修改 sshd 的配置文件 /etc/ssh/sshd_config 修改权限 PubkeyAuthentication yes
	7. 重启 sshd 服务器【提示，无法连接时，可以通过命令查看 systemctl status sshd.service 无法连接的原因，一般都是 ssh 服务的原因 】
5. 使用 bc 命令实现进制之间的转换
```bash
echo 'ibase=10; obase=16; 25' | bc   结果 19
```
6. tig 的使用说明，tig 是基于 ncurses-based ，命令行下图形化查看 git 仓库相关信息的工具
	1. 查看某次 commit 和这次 commit 提交的代码修改
	2. 查看当前暂存和未存的修改（main 视图就可以查看）
	3. 增加和剔除暂存的修改（在 main 视图[tig 命令直接的视图]通过 s 按键到 status 视图，再通过 u 快捷键可以增加或者删除文件到暂存区，返回 main 视图可以通过 q 退回上一个视图，或者直接按键 m）
	4. 编辑 commit 并提交（在 status 视图，按键 C ，然后按键 i 编辑提交信息，然后按键 :x 可以提交了）
	5. 查看仓库的所有 tag 和分支（按键 r [branch 视图]）
	6. 查看某次提交的树形视图（在某次提交或者 tag 处，按键 t 查看）
	7. 明确了 tig 的几个视图； main 视图，tree 视图，status 视图，stash 视图[查看所有暂存的提交，按键 c 切换到该视图，该视图一般和 status 视图配合使用]，branch 视图，log 视图[按键 l 切换到该视图]
	8. Q 直接退出 tig，q 退出到上一个视图
	9. 在查看文件时，要使用 j、k 这些按键
7. ls -lt 默认是按照文件的修改时间排序的，相应的 ls -ltu 是按照文件的访问时间排序， ls -ltc 是按照文件的 i 节点的修改时间排序 
8. open 函数打开的文件名，要对包含的目录具有可执行权限位，这个位也被成为搜索位
9. unlink 函数，减少文件的链接记数；rename 函数，重新命名文件或者目录
10. ls -F 选项[在不同文件类型的文件名后添加指示器]；会在符号链接文件后加一个 @ 符号，在目录文件后加 / 符号
11. 文件具有 3 个时间【ls -u 文件数据的组后访问时间；ls 文件内容的最后修改时间；ls -c 文件 i 节点的最后更改时间】；要知道文件 i 节点和文件数据内容是分开存放的
12. tig 下 o 选项可以配置一些 tig 选项，左右方向建可以切换对应的配置选项，目前只有 16 个选项，根据选项的提示符号，按对应的符号修改不同的选项值，建议参看 tig 的官方 manual，在 home 目录下还可以创建一个 .tigrc 配置文件初始化 tig
13. netstat 命令，查看进程监听的网络端口号，一般用法
```bash
netstat -lntup # 列出所有监听服务的 socket(-l) 和对应的端口号(-n)，包括 tcp(-t) udp(-u) 以及PID/进程名称(-p)
14. systemd 是 Linux 的系统和服务管理器;init 进程的替代品，systemctl 命令是管理 systemd 的主要工具
```bash
systemctl # 列出正在运行的服务
systemctl list-units --type=service # 列出所有已加载的服务
systemctl list-units --type=service --state=active # 列出所有已加载并且处于活动的服务
systemctl list-units --type=service --state=running # 列出所有已加载并且正在运行的服务
```
15. ss 用来 dump socket 的统计信息，显示的内容类似于 netstat，但是 ss 可以显示更多 TCP 和状态信息。
```bash
ss -ltup # 显示正在监听(-l)的 TCP(-t) UDP(-u) 的进程信息(-p)
```
