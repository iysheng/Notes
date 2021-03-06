
1. Fedora 添加库和禁止、使能库
    1. dnf config-manager --add-repo /etc/yum.repos.d/fedora_extras.repo
    2. dnf repolist 列出当前所有的 repos
    3. dnf config-manager --set-disabled repository 禁止库 repository
    4. dnf config-manager --set-enabled repository
    5. sudo dnf remove $(dnf repoquery  --installonly --latest-limit=-1 -q)
    6. figlet 工具可以将字符串图像化
    7. sudo dnf whatprovides "*A*" ，查找哪个软件包提供名称包含 A 的资源
    7. 设置 hostname 为 red.WS
    ``` bash
        hostnamectl set-hostname red.WS
    ```
    8. sudo dnf update 軟件包名稱 # 更新指定的軟件包
    9. sudo dnf upgrade # 升级, 和 dnf update 有相同的功能，都会更新已经安装的软件包，但是更建议使用 ```dnf upgrade``` ，因为他工作更加准确，类似 ```dnf --obsoletes update```,更新过时的软件包
    10. sudo dnf grouplist 列出当前的软件组
    11. dnf list glibc-\*langpack\* 列出已经安装的语言包 

2. scp 和 ssh sshpass 命令
    1. 复制 filename 到 serverip 设备的 dir 目录，键入该命令会提示输入 username 的密码
    2. scp filename username@serverip:/dir
    3. 通过 ssh 连接 serverip，用户名是 username
    4. ssh username@serverip
    5. 提前将密码放到 -p 选项地方，其他和一般的 scp 命令一样
    6. sshpass -p "passwdxxx" scp filename username@serverip:/dir
    7. ssh -p xx user@ip /* ssh -p 参数连接指定的端口 xx */

3. git 使用笔记
    1. git log --oneline /* 每一个 commit 只显示一行 */
    2. git log -nx  /* 显示最近的 x 次提交 */
    3. git help --web [command] /* 在浏览器查看 git [command] 的 help 信息 */
    4. git cat-file -t hash 查看一个hash值表示的类型（比如说是提交、tag、、、）
    5. git cat-file -p hash 查看一个hash值的详细信息
    6. git config 的配置信息可以参看 .git 目录的 cofig 文件
        * git config --global user.name 'iysheng' # 修改 global 配置的用户名为 iysheng
        * git config user.name 'Yang sheng' # 修改当前仓库的用户名为 Yang sheng,当前仓库的配置会覆盖 global 的配置
        * git config --list # 列出来当前的配置
        * git push origin --delete branchname # 删除远端指定的分支
        * git branch -D branchname # 删除本地指定的分支名
    7. commit 是当前工作区的一个快照，只能包含一个 tree，一个 tree 可以包含多个 tree 和 blob，tree 可以认为是目录类型，blob 是文件类型
    8. detached HEAD(分离头指针) git checkout commitid 的时候就会创建出分离头指针，分离头指针就是说 HEAD 直接指向一个 commit，没有关联到一个分支的情况，这时候需要git branch commitid 创建出一个分支，关联这次 checkout；
    9. git diff commit_id0 commit_id1 ；对比两次提交的差异, commitid[0.1] 没有必要说必须是当前分支的 commitid
    10. HEAD^1 或者 HEAD^ 表示 HEAD 的父亲， HEAD^^ 或者 HEAD^1^1 父亲的父亲，HEAD~ HEAD 的父亲，HEAD~2 父亲的父亲
    11. git branch -d 分支名；删除分支，如果分支没有被 merge，那么会提示无法删除；git branch -D 分支名，强制删除分支
    12. git commit --amend ；修改最近一次提交的注释 message
    13. git rebase -i commit_id ；然后就可以修改待修改的 commit 的 message；git rebase 还可以做很多事情；记得保存 parent，其中 commit_id 可以以 HEAD 为索引进行偏移，举例 head~3 以当前 HEAD 向前推 3 个提交位 rebase 的基
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
        1. git stash show : 显示做了哪些改动，默认显示第一个存储，如果需要显示其他的存储，后面需要添加 stash@{$num}，eg:
        ``` bash
        ▸ git stash list
        stash@{0}: WIP on master: b2072bf02 [bsp][gd32103c-eval] Modify adc driver with LOG_x function and deselect adc driver default
        stash@{1}: WIP on master: 80cb6aa35 [bsp][gd32103c-eval] Modify README with hwtimer supoort
        ▸ git stash show
        bsp/gd32103c-eval/rtconfig.py | 2 +-
        1 file changed, 1 insertion(+), 1 deletion(-)
        ▸ git stash show stash@{0}
        bsp/gd32103c-eval/rtconfig.py | 2 +-
        1 file changed, 1 insertion(+), 1 deletion(-)
        ▸ git stash show stash@{1}
        bsp/gd32103c-eval/.config            | 10 +++++++++-
        bsp/gd32103c-eval/rtconfig.h         |  2 ++
        bsp/gd32103c-eval/rtconfig.py        |  2 +-
        components/drivers/hwtimer/hwtimer.c |  8 ++++++++
        4 files changed, 20 insertions(+), 2 deletions(-)
        ```
        2. git stash show -p : 显示存储的改动，默认显示第一个存储，如果需要显示其他的存储，后面需要添加 stash@{$num}，eg:
        ``` bash
        ▸ git stash show -p stash@{0}
        
        bsp/gd32103c-eval/rtconfig.py
        ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
        
        ────────────────────────┐
        if os.getenv('RTT_CC'): │
        ────────────────────────┘
        12
        # EXEC_PATH is the compiler execute path, for example, CodeSourcery, Keil MDK, IAR
        if  CROSS_TOOL == 'gcc':
            PLATFORM    = 'gcc'
            EXEC_PATH   = r'D:/toolchain/gnu_tools_arm_embedded/5.4_2016q3/bin'
            EXEC_PATH   = r'/opt/arm_tools/gcc-arm-none-eabi-6_2-2016q4/bin/'
        elif CROSS_TOOL == 'keil':
            PLATFORM     = 'armcc'
            EXEC_PATH     = r'C:/Keil_v5'
        ┏─╼[yangyongsheng]╾─╼[15:49:18]╾─╼[0]
        ┗─╼[~/just4github/rt-thread (master)]
        ▸ git stash show -p
        
        bsp/gd32103c-eval/rtconfig.py
        ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
        
        ────────────────────────┐
        if os.getenv('RTT_CC'): │
        ────────────────────────┘
        12
        # EXEC_PATH is the compiler execute path, for example, CodeSourcery, Keil MDK, IAR
        if  CROSS_TOOL == 'gcc':
            PLATFORM    = 'gcc'
            EXEC_PATH   = r'D:/toolchain/gnu_tools_arm_embedded/5.4_2016q3/bin'
            EXEC_PATH   = r'/opt/arm_tools/gcc-arm-none-eabi-6_2-2016q4/bin/'
        elif CROSS_TOOL == 'keil':
            PLATFORM     = 'armcc'
            EXEC_PATH     = r'C:/Keil_v5'
        ```
        3. git stash drop stash@{num} : 删除指定的栈
        4. git stash clear : 删除所有缓存的栈
    25. git stash list；查看当前“栈”的快照
    26. git stash apply；从“栈”顶恢复快照，但不删除“栈”的这个快照
    27. git stash pop；从“栈”顶恢复快照，但是会删除“栈”的这个快照
    28. .gitignore 文件包含了 git 不希望管理跟踪的文件或者文件类型
    29. git clone --bare；克隆一个不带工作区的裸仓库
    30. git remote add 远端源名称 远端源地址；添加一个远端仓库
    31. git push --set-upstream 远端仓库名 本地分支；推送本地分支到远端仓库
    32. 哑协议表示不带进度条，智能协议带进度条 file://路径名表示智能协议，单独路径名表示哑协议，ssh https http 这些都是智能协议
    33. 修改 ~/.gitconfig 文件，添加 alias 字段，可以添加命令别名
    34. 如果是 fork 其他人的仓库，建议添加一个 upstream 的 remote 源，可以同步更新原版的源，通过 git pull upstream/master 或者分为两个步骤：git fetch upstream; git merger upstream/master
    35. 提交 pull request ，需要首先将代码提交到自己 fork 后打仓库，然后在 github 上点击创建 pr，在 github 上点击 New pull request，根据步骤就好
    36. git val -l ：查看定义打 git 相关的变量; ~/.gitconfig 文件，用户定义打 git 打配置文件， [core]\n editor = vim 使用 vim 取代 默认的 nano 作为 git 的默认编辑器（提交、rebase 等时候调用的编辑器）
    37. git push 的时候卡住，添加了git config --global core.askpass "git-gui--askpass" 就可以解决；通过 http 或者 svn 时候，push 的时候可能会需要账号密码，可能当时是被键入账号和密码的程序卡住了？？？
    38. git status 修改 core.quotepath 为 flase；修改为 false 可以保证大于 0x80 的字节不会以 hex 模式显示，可以解决中文乱码的问题；具体细节可以参考 man git-config 搜索 quotepath
    39. git reset commitid filenames ：回退某个文件到某次提交
    40. git reset --hard commitid ：可以撤销在本地还没有 push 的 commit
    41. git branch -a 查看所有分支
    42. git branch -r 查看远程分支
    43. git checkout branchname 切换到某个分支
    44. git commit --amend  文件名；//修改某次提交的日志信息，还可以追加提交的文件
    45. git log --stat ： 查看提交记录，包含每次提交的文件列表
    46. git diff commitid ；// review the files modify detiles this commit
    47. git show commitid ；// 查看某一次提交修改的代码
    48. git commit --amend ；// 修改最近依次提交的 commit 信息
    49. git pull 和 git fetch 的区别
        1. 简单来说， git pull 完成了两部分的动作： git fetch 和 git merge
        2. 一般的操作说明 git pull remote_repo remote_branch
        3. 分为两个步骤的命令 git fetch remote_repo remote_branch ；git merge remote_name/branch_name / 或者 git merge FETCH_HEAD（备注： FETCH_HEAD 指向的是最新一次的 fetch）
    50. git send-email # 需要安装 git-email
    51. 针对某次提交 checkout 出来一个分支，否则的话如果直接 git checkout commitid，会造成分离头指针的情况
        ``` bash
        git branch branch_name commitid # 在某次 commitid 的时刻，创建出一个分支
        git checkout commitid # 针对某次 commitid 直接检出，这时候就会出现分离头指针，在分离头指针的情况下，也可以再次 git branch branch_name commitid 切出来分支
        git checkout commitid filename # 检出指定文件的某次提交的版本
        ```
    52. git diff HEAD^ HEAD ; 将最近的一次提交打成一个补丁文件
    53. git branch -m 旧分支名 新分支名 # 修改分支名称
    54. git submodule update --init --recursive # Download sub module command
        1. git submodule 列出来当前仓库引用到的所有 submodules
        ``` bash
        ▸ git submodule
         cbee4e028d66e5d9cc0ef2c45656a1f9438bd319 packages/FlashDB (1.0.0-3-gcbee4e0)
        ```
        2. git submodule set-url <path> <newurl> 修改 path 这个 submodule 新的路径
        3. git submodule update <path> # 单独只更新指定 path 的 submodule,在很多 submodule 并且仓库都很大的时候建议单独 update,
    55. git clone --recursive reposite # recursion download sub module
        1. git clone --filter=blob:none --no-checkout <url> # [下载较大的仓库的时候](https://about.gitlab.com/blog/2020/03/13/partial-clone-for-massive-repositories/)，可以使用该命令实现类似 git clone continue 的功能，会拉取 ```default branch``` 的数据，这个命令实现的是类似取消拉取大型数据？？？
        2. git checkout <branch> # 如果要检出其他分支时，会再次自动拉取所需的内容，类似实现多次拉取的效果
        3. git 会记录 filter 的设置，如果希望回复默认拉取完整仓库的数据，需要执行
        ``` bash
        git config remote.origin.promisor # true 恢复默认
        git config remote.origin.partialclonefilter # blob:none,取消拉取大型数据？？？支持分段拉取
        ```
    56. git rm --cached 文件路径 # 取消对指定文件的跟踪
    57. [git submoduleed 命令的一般方法](https://www.vogella.com/tutorials/GitSubmodules/article.html)
        ```
        git submodule add -b branch_name [URL to Git Repo] # 添加子模块的跟踪路径和对应的分支
        git submodule add [URL to Git Repo] [path in current pro]# 添加子模块的跟踪路径到指定的路径
        git submodule init # 初始化 submodule 的配置
        1. git submodule mv [旧的子模块目录名] [新的子模块目录名] # 修改旧的子模块目录名为新的子模块目录名
        2. git submodule sync # 同步对子模块的修改
        ```
    58. 在设置了 git mergetool 为 vimdiff 后，[在合并冲突时的一般使用方法可以参看](https://www.cnblogs.com/snake-hand/archive/2013/06/12/3133055.html) [还可以参看](https://www.dazhuanlan.com/2019/12/04/5de7cbeb6d522/?__cf_chl_jschl_tk__=eafb6a75757065654d1411064f7ece546be9e2df-1600563251-0-AaFC7OSqFZO7wzxjhGFCEy53WsqMSSymUJRzyv23xj5QLZgPE_uvd-mZ9Si6tTGfN9D0jdyrX9SD-maksubKac0rBJXemvwc146YShw8JOYmSbM0W6x0x07mtkNPx_QfAmLIL-NHMvJnoZG9pjJvLxmO8wY16wCNrWoDKOb-R_-l_91bY8AJmVFHuP4X7OgH2OxEY1qfcZGSPf9lvMJj7RaXXm3tfoZwsqW-7C7T7-beP4vcz5-ZzjsOFwOFVM7P__REvExMF6qR6nw76W9Q2TnULIk2o09kZUWY7PUlpuRW7fb-90m6_X6KmlB-_4GlLg)
        1. 弹出的 4 个 buffer,分别为 LOCAL,BASE,REMOTE,MERGEE
        2. LOCAL 是我们本地的分支， REMOTE 是要合并到当前分支的外部分支上的内容，BASE 是 LOCAL 和 REMOTE 两个分支的共同祖先,MERGED 合并结果，将会保存到本地 repo.
        3. 首先需要切换到 MERGED buffer,然后根据吧需要，执行 diffget LO 或者 diffget BA 或者 diffget RE, 记得然后执行下 diffupdate 命令，或者 w! 直接保存
        4. 在多个 diff 处跳转快捷键 **]+c** 跳转到下一个 diff 处， **[+c** 跳转到上一个 diff 处
    59. git  cherry-pick commit_id,合并某次提交到当前分支
		1. git cherry-pick commit_id0..commit_id1 # 批量合並 commit_id0 ~ commit_id1 之間的所有提交，不包括 commit_id0
		2. git cherry-pick commit_id0^..commit_id1 # 批量合並 commit_id0 ~ commit_id1 之間的提交，包括 commit_id0
		3. git cherry-pick --abort # 終止合並，當合並出問題時候，可以執行這個選項
	60. git clean 參數 （刪除那些未 git add 的文件，一般地： git clean -dfx 就可以情理所有需要清理的文件，謹慎考慮不要用 -f 強制刪除，使用 -i 確認下）
		1. -n 顯示將要刪除的文件和目錄
		2. -x 刪除忽略的文件
		3. -X 僅僅刪除忽略的文件
		4. -d 刪除目錄
		5. -f 強制執行
		6. -i 交互式地刪除文件，即會給你選擇是否刪除
		7. -e 過濾掉一些不需要刪除的文件
	60. git apply {patch 文件}
		1. git apply {patch 文件}：打 patch 有冲突无法合并时，不会打上布丁
		2. git apply --stat {patch 文件} : 查看 patch 文件包含的改变
		``` bash
		▸ git apply --stat /tmp/rtc.diff
		 bsp/gd32103c-eval/Kconfig            |    5 +
		 bsp/gd32103c-eval/README.md          |    1
		 bsp/gd32103c-eval/drivers/SConscript |    3 +
		 bsp/gd32103c-eval/drivers/drv_rtc.c  |  134 ++++++++++++++++++++++++++++++++++
		 4 files changed, 143 insertions(+)
		```
		3. git apply --check {patch 文件} : 检查 patch 文件格式
		``` bash
		▸ git apply --check /tmp/rtc.diff
		error: patch failed: bsp/gd32103c-eval/Kconfig:97
		error: bsp/gd32103c-eval/Kconfig: patch does not apply
		error: patch failed: bsp/gd32103c-eval/README.md:48
		error: bsp/gd32103c-eval/README.md: patch does not apply
		error: patch failed: bsp/gd32103c-eval/drivers/SConscript:24
		error: bsp/gd32103c-eval/drivers/SConscript: patch does not apply
		```
		4. git apply --reverse {patch 文件} ： 取消 patch 的使用，将之前已经打过的 patch 撤销
		5. git apply --reject {patch 文件} ： 强制打 patch，有冲突的内容保存到 rej 文件
	61. git log # 显示提交信息
		1. git log --author="red" # 查找某一个作者的提交
		2. git log --after="2021-01-02" # 显示 2021-01-02 日期之后的提交
	62. git clone -b branch_name url # 拉取指定分支的代码
4. 本地搭建 git 服务器
    1. 创建一个 git 用户（为了方便用户提交的时候统一走 git 用户），git 用户的目录权限很重要（权限要正确，否则无法通过阿里云连接）
    2. chmod 755 ~ [备注：关于目录 .ssh/ 和文件.ssh/authorized_keys 的权限需要严格按照这个权限，否则无法正常通过密钥文件验证，但是，测试的时候，还是可以通过 systemctl status sshd.service 查看]
    3. chmod 700 ~/.ssh
    4. chmod 600 ~/.ssh/authorized_keys
    5. 将用户的公钥追加到文件 ~/.ssh/authorized_keys
    6. 修改 sshd 的配置文件 /etc/ssh/sshd_config 修改权限 PubkeyAuthentication yes
    7. 重启 sshd 服务器【提示，无法连接时，可以通过命令查看 systemctl status sshd.service 无法连接的原因，一般都是 ssh 服务的原因 】
5. 使用 bc 命令实现进制之间的转换
``` bash
# ibase 和 obase 的使用，obase 会根据 ibase 的值，解析传入的参数，并且字母必须用大写
echo 'ibase=16; obase=10; 10' | bc   # 结果仍然是 10
echo 'ibase=16; obase=A; 10'  | bc   # 结果变成是 16
echo 'ibase=10; obase=16; 25' | bc   # 结果 19
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
    10. d 到跳转到对应选择的 diff 视图，比如某次 commit、 stage 的和 unstage 的
    11. O 可以最大化当前窗口
7. ls -lt 默认是按照文件的修改时间排序的，相应的 ls -ltu 是按照文件的访问时间排序， ls -ltc 是按照文件的 i 节点的修改时间排序
8. open 函数打开的文件名，要对包含的目录具有可执行权限位，这个位也被成为搜索位
9. unlink 函数，减少文件的链接记数；rename 函数，重新命名文件或者目录
10. ls -F 选项[在不同文件类型的文件名后添加指示器]；会在符号链接文件后加一个 @ 符号，在目录文件后加 / 符号
11. 文件具有 3 个时间【ls -u 文件数据的组后访问时间；ls 文件内容的最后修改时间；ls -c 文件 i 节点的最后更改时间】；要知道文件 i 节点和文件数据内容是分开存放的
12. tig
    1. o 选项可以配置一些 tig 选项，左右方向建可以切换对应的配置选项，目前只有 16 个选项，根据选项的提示符号，按对应的符号修改不同的选项值，建议参看 tig 的官方 manual，在 home 目录下还可以创建一个 .tigrc 配置文件初始化 tig
    2. e 按键可以打开编辑器，可以编辑对应的文件在 status view
13. netstat 命令，查看进程监听的网络端口号，一般用法
``` bash
netstat -lntup # 列出所有监听服务的 socket(-l) 和对应的端口号(-n)，包括 tcp(-t) udp(-u) 以及PID/进程名称(-p)
```
14. systemd 是 Linux 的系统和服务管理器;init 进程的替代品，systemctl 命令是管理 systemd 的主要工具
``` bash
systemctl # 列出正在运行的服务
systemctl list-units --type=service # 列出所有已加载的服务
systemctl list-units --type=service --state=active # 列出所有已加载并且处于活动的服务
systemctl list-units --type=service --state=running # 列出所有已加载并且正在运行的服务
```
15. ss 用来 dump socket 的统计信息，显示的内容类似于 netstat，但是 ss 可以显示更多 TCP 和状态信息。
``` bash
ss -ltup # 显示正在监听(-l)的 TCP(-t) UDP(-u) 的进程信息(-p)
```
16. 修改 /etc/resolv.conf 文件修改 dns
17. 远程桌面连接主要使用两种协议，第一种就是微软在 Windows上 的 RDP（Remote Desktop Protocol）协议，第二种就是 VNC（Virtual Network Console）协议，
不过 Linux 远程桌面连接 Windows （使用 rdp 协议），需要安装工具 rdesktop，基本的用法
``` bash
rdesktop -u 用户名 远程 windows 的 IP 地址
```
18. 重新 mount 挂载为只读属性的磁盘为可读写， -o 参数表示 mount 的选项， remount 表示需要重新 mount
``` bash
mount -o remount,rw [磁盘路径]
```
19. 使用 df 查看磁盘剩余空间情况
``` bash
df -h 以可以识别的单位直接打印出来剩余磁盘空间容量
df -l 只显示本地磁盘的信息
```
20. 阅读 pdf 和电子书的软件
```
sudo dnf copr enable atim/yacreader # pdf 软件
sudo dnf install yacreader # 电子书
sudo dnf copr enable bugzy/lector
sudo dnf install lector
```
21. emoji 图标的格式，以冒号开头和结尾例如（:tada:）
22. xlicp 复制内容，在 X 系统里面，从一个窗口复制一段文字到另一个窗口，有两套机制，分别是 Selections 和 cut buffers。
    1. 用的 copy & paste 是利用的 cut buffers 机制;
    2. 另外用鼠标选中一段文字，然后在另一个窗口按鼠标中键实现复制，利用的是 selections 机制。selection 又可以分为 master 和 slave selection。当用鼠标选中一段文件，这段文字就自动被复制到 master selection。然后在另一个地方按鼠标中键，就自动把 master selection 的内容粘贴出来。当你想复制少量文字的时候，两种方法都是很方便的。但是当复制大段文字的时候就挺麻烦。另外就是你可能会频繁的执行一些复制粘贴工作，不停的用鼠标选中文字，然后再粘贴。这是对手指的折磨。
``` bash
xlicp -i file # 复制 file 文件的内容到 X master session，使用鼠标中键可以将赋值的内容粘贴出来
```
23. ranger 终端的文件管理器，安装成功后，需要首先执行 ranger --copy-config=all，复制所有的配置文件到 ~ 目录
    1. 浏览模式下，通过 o 选项打开排序选项，比如 oc 按照最后访问时间降序排序
    2. 在 st 终端模拟器下，预览图片
    ``` bash
    sudo pip3 install ueberzug # 测试发现 w3m method 使用未成功 (https://github.com/ranger/ranger/issues/1820)
    # 安装 ueberzug 并修改 rc.config 文件，method 为 ueberzug 可以正常预览，还需要额外注释掉 set use_preview_script true 这一行！！！
    ```
    3. jk 分别对应上下移动, h 为跳转到 parent 目录, l 为跳转到下一级目录
    4. 各种文件的作用，可以使用 ranger copy-config=all 复制默认的配置文件到 ~/.config/ranger
        * commands.py 包含了各种函数的实例
        * rc.conf 设置各种选项，以及绑定函数的快捷键
        * fifle.conf 决定了选不同后缀名文件的打开软件
        * scope.sh 实现了各种类型文件预览的脚本
    5. 打开文件并且让 ranger种类型文 选择哪一个程序打开该文件（通过 rfile），快捷键是 r
    6. y[d,n,p] 可以不复制整个文件，需要借助 xclip
        * yd 仅仅复制选择的目录
        * yn 复制选中的文件名
        * yp 复制路径
    7. 如果移动多个文件，并且这多个文件不在同一个目录，切换目录后，需要使用 ya 或者 da，添加选中的目录
    8. 如果同一时间工作在不仅一个目录，可以给每一个目录创建一个 tab N，然后通过 alt + N，切换到指定的 tab
    9. 所有文件的预览在 scope.sh 脚本文件实现
    10. ? 获取 help 信息
        * m 打开 man page
        * k 打开快捷键绑定列表
        * c 打开有效的命令列表和描述
        * s 打开配置和当前的值
    11. I 重命名当前文件， A 重命名当前文件的后缀
    12. :flat 命令，可以修改目录的折叠层级
        * :flat -1 表示无限展开
        * :flat 0 表示仅仅当前目录
        * :flat 1 表示一级、依次类推
    13. rager 插件集合
        * https://github.com/cdump/ranger-devicons2 显示类型图表插件
        * https://github.com/fdw/ranger-autojump 自动跳转的插件，打开的目录会自动添加到 autojump 数据库，然后就可以通过 autojump 根据模糊搜索跳转到对应的目录了
    14. 添加 **set vcs_aware true** 到 ~/.config/rc.conf 文件，放开版本控制
24. cmake 笔记
    1. cmake 需要更改安装目标的时候，可以使用 DESTDIR 环境变量修改默认的安装路径，而使用 CMAKE_INSTALL_PREFIX 影响范围更广
    ``` bash
    make DESTDIR=/home/yys/pctools install # 会将编译出来的文件安装到目录 /home/yys/pctools/usr/local/ 目录
    ```
    2. cmake 在配置的时候，会存在 cache file,所以如果修改了 cmake 的配置文件再次执行 cmake 构建的时候，如果发现修改的没有效果，可以首先删除 CMakeLists.txt 文件，然后再 cmake 构建
25. Linux LVM 文件系统一般概念
    1. 基本概念缩写
        1. Physical Volume = pv 物理卷
        2. Volume Group = vg 卷组
        3. Logical Volume = lv 逻辑卷
    2. The physical volume commands are for adding or removing hard drives in volume groups. Volume group commands are for changing what abstracted set of physical partitions are presented to your operating in logical volumes. Logical volume commands will present the volume groups as partitions so that your operating system can use the designated space.(物理卷相关的命令是用来添加或者删除卷组的磁盘。卷组相关的命令是用来修改在逻辑卷向操作系统显示的物理分区集合。逻辑卷命令将卷组作为分区显示，以便操作系统可以使用指定空间)
    ![command](https://www.howtogeek.com/wp-content/uploads/2011/01/lvm-cheatsheet.png)
    3. pvdisplay 查看当前 lvm 的信息
    4. pvcreate /dev/sda[x] 创建一个物理卷
    5. vgcreate name /dev/sda[x] 创建一个卷组
    6. lvcreate -L 50G -n 逻辑卷名字 卷组名字 # 创建逻辑卷
    7. mkfs.ext4 /dev/卷组名字/逻辑卷名字 # 格式化新创建的卷组为 ext4 文件系统
    8. vgextend 卷组名字 物理磁盘 # 将物理磁盘添加到指定名字的卷组
    9. lvextend -L大小 /dev/卷组名字/逻辑卷名字 # 扩展指定逻辑卷的大小指定大小
    10. lvextend -L+大小 /dev/卷组名字/逻辑卷名字 # 扩展指定逻辑卷的大小 + 指定大小
    11. ![一般的理解时可以参看图](https://img2020.cnblogs.com/blog/949069/202004/949069-20200416104045527-1858978940.png) 简单来说是，每一个磁盘设备对应一个物理卷 pv，然后多个 pv 可以组成一个虚拟的卷组 pv，然后会从 pv 中划分不同的逻辑卷 lv。一般挂载的时候针对的也是 lv. [详细描述可以参看](https://www.cnblogs.com/diantong/p/10554831.html)
26. [shutdown](https://www.computerhope.com/unix/ushutdow.htm) 命令指定关机时间
``` bash
sudo shutdown 21:00 # 指定当天 21:00 关机
sudo shutdown +15 # 指定当天 15 分钟后关机
sudo shutdown -r now # 现在重启系统
sudo shutdown -P # 现在关闭系统，关闭电源
```
27. du -s 文件或者目录 # 显示总的占用空间大小单位 KB
``` bash
du -s /home/red # 显示 red 目录占用总的磁盘空间
du -sh * # 查看当前目录所有文件的大小，对目录文件，只显示总的文件大小
```
28. echo -e 选项可以解析 \ 特殊格式字符 eg: \n 换行；-n 选项不用自动添加换行输出
29. pandoc 可以将 md 文件转换为 word 格式（包括、但不仅限于）
    1. pandoc name.md -t ms -o something.pdf 将 name.md 文档转换为 pdf 文档，ms 引擎需要安装 groff 程序，测试这个 pdf 转换引擎对中文支持很不友好
    2. pandoc name.md -t latex -o something.pdf 将 name.md 文档转换为 pdf 文档，ms 引擎需要安装 texlive 程序
        1. 需要安装中文字体，不然转换结果也不友好，有[三种方法](https://github.com/jgm/pandoc/wiki/Pandoc-with-Chinese)可以修复这类问题:
            * 在 md 开头添加 front matter，指定 mainfont
            * 在 md 开头添加 front matter，指定 documentclass
            * 命令行 pandoc -V 定义 mainfont="中文字体名称"
        2. 通过 --pdf-engine=xelatex 指定使用 texlive 的 latex pdf 转换引擎
    3. 转换包含中文的 html 到 pdf
    ``` bash
    pandoc a.html --pdf-engine=xelatex -V mainfont="WenQuanYi Micro Hei Mono" -o a.pdf
    ```
30. feh 可以用来修改屏幕壁纸，配合 dwm 使用，效果很好
31. 命令行连接 wifi 的一般步骤，使用 iw 和 nmcli 工具
    1. iw dev # 查看当前设备的网卡信息
    2. iw 设备名字 link # 查看指定设备网卡的连接状态
    3. iw wifi网卡的名字 scan # 扫描 wifi 信号
    4. ip link set wifi网卡名字 up # 如果这个网卡没有 up ，那么首先 up 这个网卡
    5. nmcli device wifi connect SSID名字 password 密码 # 链接 wifi，指定 SSID 和 密码
    6. sudo nmcli connection up enp0s20f0u2u3 # 主动执行 /etc/sysconfig/network-scripts/ifcfg-enp0s20f0u2u3 配置的网卡设置，也可以通过 sudo service NetworkManager restart 自动配置这个 USB 转网卡设备[脚本修改](#networkmanager)
32. [安装 xdm ，作为 xorg 的显示管理器，引导 dwm 启动](https://wiki.archlinux.org/index.php/XDM#Installation)
    1. dnf install xdm
    2. systemctl enable xdm # 如果之前有其他的 display manager，需要先禁用掉之前的 display manager，比如 xfce 使用的是 lightdm
    3. 编辑 ~/.xsession 文件，填写 exec dwm 引导 dwm 启动，重点要设置这个文件的权限为 700 ，否则会出错！！！
    4. 编辑 vim /etc/X11/xdm/Xsetup_0 文件，可以修改登陆背景，可以使用 feh 工具！！！
    5. 编辑 /etc/X11/xdm/Xresources 可以修改登陆界面窗口的效果
    6. 遇到问题**PAM unable to dlopen(pam_gnome_keyring.so)**，可以通过 systemctl status xdm 来确认是否出现该问题，此时需要安装
    ```
    sudo dnf install gnome-keyring
    ```
    7. 重要的一点，针对  fedora-server 还需要修改默认的启动级别为图形化界面.
    ```
    sudo systemctl set-default graphical.target
    ```
    8. 如果仍然有问题，可以查看保存有错误文件日志的文件： ~/.xsession.errors
33. 解决 npm 在国内卡的问题
    1. 直接使用 cnpm
    ``` bash
    npm install -g cnpm --registry=https://registry.npm.taobao.org
    ```
    2. 配置 npm 的源，使用淘宝源替换官方的 npm 源
    ``` bash
    npm config set registry https://registry.npm.taobao.org --global
    npm config set disturl https://npm.taobao.org/dist --global
    ```
34. firefox 快捷键
    1. ctrl + w 或者 ctrl + \<F4> ：关闭当前 tab
    2. ctrl + shift + p ：新建一个 private tab
35. [使用 jekyll 在 github 搭建个人博客](https://medium.com/20percentwork/creating-your-blog-for-free-using-jekyll-github-pages-dba37272730a)
    1. 安装 gem ruby jekyll 工具
    ``` bash
    sudo dnf install gem ruby-devel
    gem install jekyll bundler
    ```
    3. 创建一个工程 redblog ，并查看
    ``` bash
    jekyll new redblog # 可以通过网址访问查看，这里可能会有权限问题
    bundle config set path ~/redws # 指定一个用户有对应写权限的路径，再重新执行 jekyll new redblog
    cd redblog # 切换到创建的工程的目录
    bundle exec jekyll serve # 运行服务，然后可以通过 localhost 的 40 端口查看
    ```
    4. [修改 ruby 的源](https://mirrors.tuna.tsinghua.edu.cn/help/rubygems/)
    ``` bash
    # 添加 TUNA 源并移除默认源
    gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/
    # 列出已有源
    gem sources -l

    # 替换 bundler 默认源
    bundle config mirror.https://rubygems.org https://mirrors.tuna.tsinghua.edu.cn/rubygems
    ```
    5. RubyGems 是对 Ruby 打包的打包系统，bundler Bundler 能够跟踪并安装所需的特定版本的 gem，以此来为 Ruby 项目提供一致的运行环境。Bundler 是 Ruby 依赖管理的一根救命稻草，它可以保证你所要依赖的 gem 如你所愿地出现 在开发、测试和生产环境中。
36. 添加 30-touchpad.conf 文件到 **/etc/X11/xorg.conf.d/** 目录，可以[修复触摸板单击不识别的问题](https://docs.fedoraproject.org/en-US/quick-docs/enable-touchpad-click/)
``` bash
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
        Option "TappingButtonMap" "lrm"
        Option "NaturalScrolling" "on"
        Option "ScrollMethod" "edge"
EndSection
```
37. [使用 systemd 添加一个新的服务](https://www.linode.com/docs/quick-answers/linux/start-service-at-boot/)，systemd 是最开始红帽开发 Linux 系统工具，包含用于启动和管理系统进程的引导系统。目前是大多数发行版系统的默认初始化系统。许多常用的工具比如 ssh 、 apache 都还有一个 systemd 的服务。
    1. 创建一个系统服务，在 /lib/systemd/system 目录添加一个 test.service 文件，添加可执行权限
    ``` bash
    [Unit]
    Description=Example systemd service
    [Service]
    Type=simple
    ExecStart=echo "test systemd" # 填写要执行的命令
    [Install]
    WantedBy=graphical.target
    ```
    2. 使能这个服务在每次开机时候运行，或者说创建这个服务
    ``` bash
    sudo systemctl enable test.service
    ```
    3. 开启这个服务
    ``` bash
    sudo systemctl start test.service
    ```
    4. 查看这个服务的状态
    ``` bash
    sudo systemctl status test.service
    ```
38. [Fedora tftp 服务器搭建](https://fedoramagazine.org/how-to-set-up-a-tftp-server-on-fedora/)
    ``` bash
    dnf install tftp-server tftp -y # 安装软件
    cp /usr/lib/systemd/system/tftp.service /etc/systemd/system/tftp-server.service
    cp /usr/lib/systemd/system/tftp.socket /etc/systemd/system/tftp-server.socket
    修改 /etc/systemd/system/tftp-server.service 文件的 Requires 字段为 Requires=tftp-server.socket
    修改 /etc/systemd/system/tftp-server.service 文件的 ExecStart 字段为 ExecStart=/usr/sbin/in.tftpd -c -p -s /var/lib/tftpboot
    ```
    * -c 字段表示允许新文件创建
    * -p 字段表示不需要额外的权限检查
    * -s 字段可以改善关于索引目录的问题
    ``` bash
    修改 Also 字段为 Also=tftp-server.socket
    ```
    ``` bash
    systemctl daemon-reload # 重新加载 daemon 服务
    systemctl enable --now tftp-server # 使能 tftp-server 服务
    firewall-cmd --add-service=tftp --perm # 配置防火墙放行 tftp 服务端口
    firewall-cmd --reload # 重新加载防火墙
    ```
39. 对比两个命令的性能工具[hyperfine](https://github.com/sharkdp/hyperfine)
    ``` bash
    $ hyperfine --warmup 3 'fd -e jpg' 'find -iname "*.jpg"'
    Benchmark #1: fd -e jpg
      Time (mean ± σ):     126.0 ms ±   1.8 ms    [User: 286.5 ms, System: 164.8 ms]
      Range (min … max):   123.7 ms … 130.2 ms    23 runs
    
    Benchmark #2: find -iname "*.jpg"
      Time (mean ± σ):     155.5 ms ±   1.9 ms    [User: 80.0 ms, System: 73.7 ms]
      Range (min … max):   153.2 ms … 159.8 ms    19 runs
    ```
40. find 命令对匹配到的内容执行动作
    ``` bash
    # 删除当前目录的 abc.txt 文件，结尾的 \; 符号很重要，否则会提示 exec 缺少参数
    find . -name "abc.txt" -exec rm {} \;
    ```
41. firewall-cmd 防火墙管理客户端
    ``` bash
    sudo firewall-cmd --add-port=3308/tcp # 当前 zone 开启 3308 tcp 端口
    sudo firewall-cmd --add-port=3308/tcp --permanent # 持久开启，当前 zone 开启 3308 tcp 端口
    sudo firewall-cmd --list-all # 列出默认的当前所在的 zone 和服务
    sudo firewall-cmd --list-all --zone=zone的名字 # 列出指定 zone 的服务
    sudo firewall-cmd --get-default-zone # 获取当前的 zone
    sudo firewall-cmd --set-default-zone= # 修改默认的 zone
    ```
42. coredump 调试文件
    ``` bash
    echo "/tmp/core-%p" > /proc/sys/kernel/core_pattern # 修改 core 文件的产生路径和命名规则
    ```
43. 开启 ssh 服务
    ```
    sudo vim /etc/ssh/ssh_config # 取消注释 Port 22 端口这行内容
    sudo systemctl restart sshd # 重启 sshd 服务
    sudo systemctl enable sshd # 创建开机启动
    sudo firewall-cmd --add-port=22/tcp --permanent # 如果还是无法连接，尝试手动放开该防火墙端口
    ```
44. pkg-config 命令可以将第三方库的库文件以及头文件所在的位置指定出来，pkg-config 通过解析 .pc 类型的文件，可以找到对应模块的第三方头文件和库文件，这时候就有一个环境变量 PKG_CONFIG_PATH 来指定 pc 文件的路径
    ``` bash
    pkg-config --cflags glib # 列出 glib 第三方库的头文件位置，自动添加了 -I
    pkg-config --libs glib # 列出 glib 第三方库库文件的位置，自动添加了 -L
    pkg-config --list-all # 列出所有可以使用的包
    ```
45. LD_LIBRARY_PATH 变量指定了程序运行时链接的动态库路径
46. shutter 是 Fedora Workstation 内置的截屏工具
47. Taskwarrior 是 Linux 的 TODO list 工具
    1. [日期格式](https://taskwarrior.org/docs/dates.html)
    2. [工具的 doc](https://taskwarrior.org/docs/)
    3. [同步 task 的方法，使用 freecinc](https://freecinc.com/generated_keys)， [freecinc 官方网站](https://freecinc.com/)
``` bash
sudo dnf install task # 安装 todolist
task learn cook due:2020-05-20T12:00:00 rc.dateformat:Y-M-DTH:N:S #task add something want todo due:Y-M-DTH:N:S rc.dateformat:Y-M-DTH:N:S
task ID done # 完成了某一个 task
# 统计任务相关的命令
task sum # 查看当前任务的概括以及完成度
task ghistory # 查看完成、正在进行和删除的任务的数量
task caleandar # 查看最近任务的日历信息
task burndown.daily # 按天图形化显示最近日期的任务概述（以火焰图的方式）
task burndown.weekly # 按周图形化显示最近日期的任务概述（以火焰图的方式）
task burndown.monthly # 按月图形化显示最近日期的任务概述（以火焰图的方式）
task ID modify project:project_name # 给某个任务的添加 project，将某个 task 划分到 project
task ID modify due:日期 # 修改某一个 task 的结束日期
task ID modify priority:M # 修改某个任务的优先级(H M L)
task ID modify +tag1 +tag2 # 给指定的任务添加 TAG 信息
task ID modify +next # 加速提高指定任务的优先级
task ID modify depends:OTHRE_ID # 修改指定的 task 依赖 OTHER_ID 对应的 task
task +tag list # 列出包含名称为 tag 的 task
task -tag list # 列出没有包含名称为 tag task
task +TAGGED list # 列出所有包含 tag 的标签
task tags.any: list # 列出所有包含 tag 的标签
task +DUETODAY list # 列出今天到期的所有 task，并且这个 DUETODAY 标签不可以直接添加活着删除从指定的任务，可以通过修改 taskid 的 due 参数来添加这个虚拟的 tag
task ID info # 查看当前 task 的信息
task add task任务描述 project:'工程名称'
task project:oldname modify project:newname
task add project:工程名等级一.工程名等级二 任务描述
task project:工程名等级一 count # 统计所有工程名等级一匹配的所有 task 的数量
task projects # 列出当前使用的 projects
task ID due: # 删除指定 ID 的 task 的截止日期
task ID modify scheduled:日期 YY-MM-DD # 修改指定的 task 的调度日期，当到达指定的日期的时候，就会修改指定的 task 为 ready 状态
task ID modify until:YY-MM-DD # 指定 ID 的任务当超过 YY-MM-DD 时会自动销毁这个任务
# rc.dateformat 参数会影响日期格式
task completed # 列出已经完成的 task
task all +COMPLETED # 列出已经完成的 task

timew # timewarrior 统计时间的工具，默认 Fedora 安装是没有自动补全的，如果需要自动补全可以参考 git bash 补全，从 timewarrior 源码获取 timew-completion.bash 文件，执行 source
timew start 'task 1' 'task 2' task3 # 开启 3 个任务并计时
timew summary task3 # 查看 task3 的概述总结
timew config tags.task3.description '任务三的描述'
timew track 9:00 - 11:00 task3
cp timew-1.3.0/ext/on-modify.timewarrior ~/.task/hooks/ # 从 timewarrior 的源码将脚本呢复制到 taskwarrior 的 hooks 目录，就可以将 timewarrior 集成到 taskwarrior
```
48. [文本和目录对比工具 meld](https://fedoramagazine.org/compare-files-with-these-graphical-diff-tools-in-fedora/)
``` bash
sudo dnf install meld
```
49. [关于 PEERDNS 参数的描述](https://support.hpe.com/hpesc/public/docDisplay?docId=mmr_kc-0110350)，[参考文件](file:///usr/share/doc/initscripts/sysconfig.txt)简单来说如果设置了 PEERDNS=yes，就会通过 dhcp 获取 dns 来修改 /etc/resolv.conf 文件，如果设置了 PEERDNS=no，就不会通过 dhclient 获取 dns 修改 resolv.conf 这个参数，而是使用 DNS1、DNS2 修改 dns
    1. 修改的文件一般是 /etc/sysconfig/network-scripts/ifcfg-*** 
    2. <a id='networkmanager'>NetworkManger 配置</a> 设置 USB 转网卡设备静态 IP 脚本文件(file:///etc/sysconfig/network-scripts/ifcfg-enp0s20f0u2u3)示例：
    ```
    TYPE=Ethernet
    BOOTPROTO=static
    NAME=enp0s20f0u2u3
    DEVICE=enp0s20f0u2u3
    # 特别要说的是这个 ONBOOT 特别重要，有了这个选项，可以使用 sudo service NetworkManager restart 重启网路时，自动配置这个网卡为指定的静态地址 IP
    ONBOOT=yes
    HWADDR=00:e0:4c:36:28:02
    IPADDR=192.168.100.200
	```
50. [带有色彩个数输出的类 cat 工具](https://github.com/sharkdp/bat)
	1. 安装
	``` bash
	sudo dnf install bat
	```
	2. 配置 man 使用 bat 带有色彩的打印
	``` bashrc
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export MANROFFOPT="-c"
	```
51. [delta 一款支持 git 命令语法高亮的工具](https://github.com/dandavison/delta)
	1. 安装
    ``` bash
    sudo dnf install git-delta # 安装
    ```
	2. 配置 .gitconfig 文件
	``` 
	[core]
        pager = delta --plus-color="#012800" --minus-color="#340001" --theme='Monokai Extended'
    [interactive]
        diffFilter = delta --color-only
	```
52. 设置系统时间和硬件时间， ARM Linux
	1. 设置系统时间
	``` bash
	date -s "2020-05-28 09:00:00" # 设置系统时间为 2020 年 5 月 28 日 9 点 0 分 0 秒，冒号很重要
	```
	2. 将系统时间修改为 RTC 硬件时间
	``` bash
	hwclock -w # 将系统时间修改为硬件 RTC 时间
	```
	3. 从 RTC 硬件时间设置系统时间
	``` bash
	hwclock -s # 将硬件 RTC 时间修改为系统时间
	```
	4. 现实硬件 RTC 时间
	``` bash
	hwclock -r
	```
53. fd 匹配内容
	
	1. fd 会默认忽略隐藏文件和 .gitignore 指定忽略的文件，如果需要搜索隐藏文件和 .gitignore 指定忽略的文件，需要添加分别添加选项 -H 和 -I
54. mutt 工具学习
	1. MXA 工具集合
		1. **MUA:Mail User Agent(email client)**
			mutttools
			这个是邮件客户端的前端
		2. **MTA:Mail Transport Agent(SMTP server)**
			exim,(postfix),sendmail,qmail
			这个是发送邮件的工具
		3. **MDA:Mail Delivery Agent**
			对 MTA 接收到的邮件进行派发，简单说是分到对应的目录（假如你创建了一些目录）
		4. **MRA:Mail Retrieval Agent(POP/IMAP client)**
			(fetchmail),getmail
			这个是接收邮件的工具
	2. 首先安装 mutt 然后安装 MTA
	```
	sudo dnf install mutt postfix
	sudo alternatives --config mta # 修改默认的 mta 配置，可以扩展到其他默认工具配置
	```
55. Fedora 安装对应内核的源码
``` bash
sudo dnf install kernel-devel
# 安装成功后，就会在 /usr/src/kernels 目录看到对应的内核源码
# 国内镜像内核源码下载的源地址 https://mirror.bjtu.edu.cn/kernel/linux/kernel/
```
56. file 命令
```
file -L 连接脚本 # 可以跟踪连接脚本，查看所连接的目标的文件属性，默认 file 连接脚本不会跟踪到连接脚本的目标
```
57. tar 命令
	* tar -tvf *.tar # 查看指定的压缩包的文件列表
	* tar -cvf a.tar 文件列表 # 创建 a.tar 的压缩包
58. **xrandr** 命令
```
xrandr # 现实屏幕连接的装信息
xrandr --output 分屏 --right-of 主屏 --auto # 屏幕扩展命令
xrandr --output 分屏幕 --off # 關閉一個屏幕顯示
xrandr --output 分屏幕 --brightness 0.6
```
59. gdb 调试 elf 文件
    1. gdb + elf 文件
        1. diassemble + 地址 # 反汇编指定地址的代码
60. [python 脚本执行 shell 命令，并且获取字符串格式的打印输出](https://docs.python.org/3/library/subprocess.html#subprocess.check_output)
    1. subprocess.check_output("git branch --show-current", shell=True, text=True) # text = True 强制输出为 str 类型，默认是 byte 类型的输出
61. 使用 sed 修改字符串
``` bash
echo "hello world" | sed 's/world/china/g'
```
62. 安装 fcitx5 ，关键的一个地方[修改X11 的默认输入法](https://wiki.archlinux.org/index.php/Fcitx#Input_method_module)
	1. 创建一个文件 **~/.pam_environment**，实测发现在 fedora + dwm 环境，修改的文件是 **~/.xsession** 文件，添加到处环境变量语句
    ``` bash
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
	```

fcitx5 &
    ```
	2. 如果是在 **.pam_environment** 在这个文件配置，测试配置为 fcitx 可以正常使用 fcitx5
	```
	GTK_IM_MODULE DEFAULT=fcitx
	QT_IM_MODULE  DEFAULT=fcitx
	XMODIFIERS    DEFAULT=@im=fcitx
	```
    3. 安装必要的包,检查可以使用 **rpm -qa** 查看所有安装的包,特别地 fcitx5-gtk 这个包如果不安装的话会导致在 firefox 环境无法使用，[只能在终端使用](https://github.com/fcitx/fcitx5/issues/123)
    * fcitx5-data-0-0.7.20200912gitd0383bc.fc33.noarch
    * fcitx5-0-0.7.20200912gitd0383bc.fc33.x86_64
    * fcitx5-qt-0-0.3.20200912git02bbbf6.fc33.x86_64
    * fcitx5-configtool-0-0.4.20200912git8f113a7.fc33.x86_64
    * fcitx5-chewing-0-0.3.20200822git7f7ea5e.fc33.x86_64
    * fcitx5-devel-0-0.7.20200912gitd0383bc.fc33.x86_64
    * fcitx5-rime-0-0.4.20200912git6da82ec.fc33.x86_64
    * fcitx5-lua-0-0.3.20200912gitff218dd.fc33.x86_64
    * fcitx5-chinese-addons-data-0-0.3.20200912git591848d.fc33.noarch
    * fcitx5-chinese-addons-0-0.3.20200912git591848d.fc33.x86_64
    * fcitx5-gtk-0-0.4.20200916git8835e96.fc33.x86_64ij
63. **xxd** 命令，二进制显示和处理文件工具
```
xxd -s 0x30 file # 跳过文件的前 0x30 字节内容显示
xxd -s -0x30 file # 只显示文件的最后 0x30 字节内容
xxd -i file # 以二进制显示文件，并直接导出到 .c 文件，作为数组的方式
xxd -r -s count file # 在 file 文件前填充 count 字节的 0
```
64. **htop** 工具
    1. M 按照内存大小排序
    2. P 按照 CPU 占用大小排序
    3. T 按照运行时间大小排序
65. GCC 修改字节对齐的大小
``` C
/* 按照字节对齐存储 */
#pragma pack(1)
.....
#pragma pack()
```
66. pacman 选项
``` bash
sudo pacman -Sy # 更新软件包缓存
sudo pacman -SU # 更新包
```
67. ckermit [记录串口终端的打印](http://www.columbia.edu/kermit/logserial.html)
``` bash
C-kermit> SET SESSION-LOG TEXT
C-kermit> log session filename(待保存打印的文件名)
C-kermit> c 连接
```
68. scons 工具学习
	1. scons -c 清理，类似 make clean
	2. scons GetDepend 或的方法
	``` python
	if GetDepend('APP_SUPPORT_SCREEN_MONITOR') or GetDepend('APP_SUPPORT_WBLCD_MONITOR'):
		do sth
	```
69. make 学习笔记
	
	1. **wildcard** Makefile 的通配符 函数
``` Makefile
# 匹配 path 路径下所有的 .c 文件
$(wildcard path/*.c)
```
	2. Makefile 的执行动作要用 Tab 键隔开
70. arch 配置 tftp 服务
``` bash
sudo pacman -S tftp-hpa # 安装程序
```
71. c++split 可以转换反编译出来的 C++ 的函数名为可视的函数名
72. linux 启动级别
```
# 默认需要切换到图形启动等级才可以正常到 xmd 的登陆界面
sudo systemctl set-default graphical.target
# intel 1000 系列无线网卡驱动安装
sudo dnf install iwl1000-firmware

# systemd level 系统等级的描述
1. multi-user.target level 2(无 nfs)
2. multi-user.target level 3(带 nfs)
3. graphical.target level 5
```
73. [emoji 图表网站](https://emojipedia.org/)
74. rpm 命令
    1. rpm -ivh 安装软件包
    2. rpm -qa （缺省时，查询所有安装的包,非缺省时，查询指定的包，可以使用通配符）
75. 通过 systemd 创建一个服务，系统启动时候自动删除额外的资源包
    1. 复制 [remove_extra_firm.service](https://github.com/iysheng/Notes/blob/master/Linux/Misc/remove_extra_firm.service) 到 /usr/lib/systemd/system/ 目录作为 systemd 的 unit 文件
    2. 复制 [remove_extra_firm.sh](https://github.com/iysheng/Notes/blob/master/Linux/Misc/remove_extra_firm.sh) 到 /usr/bin/ 目录执行 **dnf remove** 动作
76. [通过gdb+openocd调试stm32](https://blog.csdn.net/zhengyangliu123/article/details/54934719),连接成功的效果图
![gdb](../figures/gdb_stm32.png)
	1. 编译对应的 elf 文件，需要添加 -g 参数添加调试信息
	2. openocd 连接版卡
	3. arm-none-eabi-gdb *.elf 文件
	4. target extend-remote localhost:3333 连接设备
	5. monitor reset 发送 reset 命令给 openocd
	6. monitor halt 发送 halt 命令给 openocd
	7. load 加载 gdb 启动时传递的参数
	8. gdb 的调试命令
		8.1 list 打印代码
		8.2 b 添加断点
		8.3 c 继续执行
		8.4 s 单步执行
		8.5 n 跳出子函数单步执行
		8.6 finish 完成并跳出当前子函数
		8.7 p 打印变量或者函数或者寄存器
		8.8 info reg 查看寄存器
		8.9 bt 查看堆栈
		8.10 i b 查看断点
		8.11 d index(断点的编号) 删除指定编号的断点
	9. - 命令， 会到一个跟随现实代码的窗口
77. [Jim-Tcl](http://jim.tcl.tk/index.html/doc/www/www/index.html) 是一个轻量化的命令解释器， 是 tcl 的子集
78. zip -r a.zip 待壓縮的文件
79. chown -h red:red 軟連接名稱 # 修改軟連接的用戶需要添加 -h 參數
80.  字體庫相關的命令
	1. 更新字體庫
	``` bash
	sudo fc-cache
	```
	2. 列出當前支持的字體
	``` bash
	fc-list
	```
81. Ruby 相关内容
	1. gem  包管理命令 (gem 是 ruby 的包管理器)
		* gem install [gemname] 安装 gem 的包
		* gem install -l [gemname].gem 本地安装 gem 包
		* gem install [gemname] --version=[ver] 安装指定版本的 gem 包
		* gem update 更新所有的 gem 包
		* gem uninstall [gemname] 删除指定的 gem 包
		* gem uninstall [gemname] --version=[ver] 删除指定版本的 gem 包
		* gem list [--local] 查看本机已安装的所有 gem 包
82. [trash-cli Command Line Interface to FreeDesktop.org Trash.](https://github.com/andreafrancia/trash-cli)
	* trash-put 将文件和目录放到回收站
	* trash-empty 清空回收站
	* trash-list 列出来回收站的内容
	* trash-restore 回复一个指定的文件
	* trash-rm 删除一些文件从回收站
83. [install fcitx chinese](https://wiki.archlinux.org/index.php/Fcitx5#Chinese)
	1. sudo dnf install fcitx5 fcitx5-configtool fcitx5-qt fcitx5-gtk
	2. sudo dnf install fcitx5-chinese-addons
	3. 修改环境变量以及自动启动 ```fcitx5```，编辑文件 ~/.bashrc
	``` bash
	### 修改环境变量
	export GTK_IM_MODULE=fcitx
	export QT_IM_MODULE=fcitx
	export XMODIFIERS=@im=fcitx

	#### run fcitx5
	PIDOFFCITX=`pidof fcitx5`
	if [ $PIDOFFCITX != '' ];then
	    echo "fcitx is running" > /dev/null
	else
	    fcitx5 -d &> /dev/null
	fi
	```
84. libreoffice 编程
	* =A1+10 	Displays the contents of cell A1 plus 10. 求和
	* =A1*16% 	Displays 16% of the contents of A1. 乘以 * 0.16
	* =A1 * A2 	Displays the result of the multiplication of A1 and A2. 乘法
	* =ROUND(A1;1) 	Displays the contents of cell A1 rounded to one decimal place.
	* =EFFECTIVE(5%;12) 	Calculates the effective interest for 5% annual nominal interest with 12 payments a year.
	* =B8-SUM(B10:B14) 	Calculates B8 minus the sum of the cells B10 to B14. 先求和再做差
	* =SUM(B8;SUM(B10:B14)) 	Calculates the sum of cells B10 to B14 and adds the value to B8. 求和
85. **Makefile** 语法描述
	* ```strip``` 函数，删除开头和结尾的空格，eg: 
	``` makefile
	$(strip a b c ) => a b c #删除了结尾的空格
	```
86. [alacritty](https://github.com/alacritty/alacritty) 一款快速的，跨平台的，openGL 的终端模拟器
	
	* vi 模式: ```Ctrl Shift Space```
	* 前向搜索模式```Ctrl Shift f```  后向搜索模式```Ctrl Shift b``` 搜索的目标的时候，```Enter``` 表示向前跳转，```Shift Enter``` 表示向后跳转，```Escape``` 表示退出
87. [X,X11,Xorg,XServer,XClient,Xlib 概念](https://blog.csdn.net/a379039233/article/details/80782351)
![](../Misc/figures/xwindow.png)
* X 即 X window System,由 MIT 研发,设计哲学之一是:提供机制,而非策略.在 Unix Like 上使用的 GUI 被称为 X 或者 X11. X11 是一个软件而不是一个操作系统. X11 利用网络架构来进行图形界面的执行和绘制.较为著名的版本是 X11R6 这一版,目前大部分的 X 都是这个版本演化来的.现在大部分的发行版使用的 X 都是由 Xorg 基本会提供的 X11. X11 使用 MIT 授权.
* Xorg 项目旨在创建和维护一个自由\可再发行并且开源的 X11. 他是一个开发源码,基于 X11 桌面所需要的基本软件.
* Xwindow 在推出之后快速演化,在 1987 年时,已经是第 11 版本了,简称 X11.这个版本的核心协议基本稳定,不需要特别大的改动.所以目前 X window 依然是 X11.
* X11 只定义了如何和内核通讯,如何和 Client 通讯,具体的策略依然是交给开发者自己. X window 是基于网络架构的客户端\服务器模式,基本是分成 X server 和 X client 两个组件而已.
* X client 基于 X11 协议的客户端,X Client 最重要的工作是处理来自 X Server 的请坐,将这些动作处理成为绘图资料,再将这些绘图资料传回给 X server.
* X server 基于 X11 协议的服务端,管理硬件设备,键盘\鼠标\显示器等.X Client 主要就是告知 X server 要绘制什么.X server 的主要功能(不论是 Xorg 或者 XFree86 都是一个 Xserver), 就是在管理 X server 所在主机上面有关显示的硬件配置.
* Xorg 基金会, Xorg 也是一个 X server. X org 项目提供了一个 X window 的开源实现
* X Window Manager 视窗管理员,特殊的 X client,负责管理所有的 X client 软件. XFCE\GNOME\KDS 等都是 X window manager 的具体实现.
* Display Manager 提供登入需求,登入能够进入到 GUI 界面.
* startx start X window system. 可以接 X Client 和 X Server 的参数.在默认的情况下(使用者尚未有 ~/.xinitrc 文件时),输入 startx,等价执行 xinit /etc/X11/xinitrc /etc/X11/xinit/xserverrc 这个指令,为什么不直接执行 xinit 而使用 startx 呢.因为必须要取得一些参数, startx 可以帮我们快速找到这些参数而不必手动输入. X window 最先要启动就是 X server, X server 启动的脚本参数是透过 /etc/X11/xinit 中的 xserverrc
* Xlib C 语言版本的 X 接口的函数库
* X session 指的是, X server 启动后直到 X server 关闭这段时间一切和 X 相关的动作都属于 Xsession 的内容.管理 X session 的程序成为 Display Manager, 常见的有 gdm\kdm\xdm 等.
* 如果没有指定 DM 开机运行的话,手动启动 DM 使用的是 startx , 可以知道 startx 的作用可以看作是 DM 的一种隐形实现. 他使用 xinit 命令,分别根据 /etc/X11/xinit/xinitrc 和 /etc/X11/xinit/xserverrc 中所指定的设置唤起 X. 其中 Xserverrc 执行 Xserver 的运行任务, xinitrc 则运行 Xsession 命令. 综合来说 DM 完成三个任务:1. X server 启动, 2. X sessoion 初始化, 3. X session 管理.
* X server 给 X Client 发送的消息叫 **Event**, XClient 向 XServer 发送的消息叫 **Request**
