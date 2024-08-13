### 本文档记录 Bazel 构建工具的笔记

* Workspace:一个工程对应一个 repo,即 workspace,workspace 顶层目录下应该有一个 WORKSPACE 文件
* Packages:包含有 BUILD 文件的目录和其目录下的所有文件的文件夹（不包含 BUILD 文件的文件夹）
* Targets:构建目标，由 rule 给出，必须有一个名字, 这个名字也叫做 Labels
* Labels:表示描述目标的名称：[@workspace][//package/path][:][target]

* rule 规则，表示输入和输出之间的关系

* bazel query //toolchain:* 遍历 toolchain 包中的目标
* 在 .bazelrc 文件中设置工具链条的编译选项
    1. --cxxopt=-fPIC 设置 c++ 语言编译选项
    2. --copt=-fPIC   设置 c 语言编译选项
* 在 .bazelrc 中添加如下 entry：
    1. ``build:demo_config --cpu=k8`` ，在使用 ``bazel --config=demo_config`` 的时候就会自动调用到这个配置项
