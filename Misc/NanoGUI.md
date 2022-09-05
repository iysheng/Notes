### NanoGUI 是一个针对 OpenGL 3.x 或者更高，并且跨平台，轻量的 widget library. 

####  主要使用了如下组件

1. Nanovg
2. glfw

---
#### 初始化流程(以 example1.cpp 为例进行描述)
``` cpp
nanogui::init()
    glfwInit() // glfw 初始化
    glfwSetTime(0) // 设置当前的 glfw 时间，以 s 为单位,

// 下式使用的是拷贝构造函数
// 在构造 Screen 对象的时候，会根据编译宏配置创建一个 glfw 窗口 m_glfw_window = glfwCreateWindow(mode->width, mode->height, caption.c_str(), monitor, nullptr);
// 并设置这个窗口为 glfw 的上下文  glfwMakeContextCurrent(m_glfw_window)
// 还会创建 m_nvg_context 上下文 m_nvg_context = nvgCreateGL3(flags) 即 NanoVG 的上下文
// 在这个对象的构造函数中，会执行 perform_layout 函数，完成控件的大小和位置的初始化
ref<ExampleApplication> app = new ExampleApplication() // 创建一个 ExampleApplication 对象，这个对象继承的是 Screen 类，并且将这个对象指针赋值给 ref<ExampleApplication> 这个实例化的类模板对象, 在构造这个 app 对象指针的时候会自动增加这个对象的引用计数,执行该函数，发现 ref_count() 竟然是 4
app->dec_ref() // 减少引用计数
app->draw_all()
    draw_setup() //
    /* 虚函数初始化, Screen 的 draw_contents 就是清屏
     * */
    draw_contents();
    /* 绘制所有的 child widget */
    draw_widgets();
        draw(m_nvg_context) // 绘制 widgets
app->set_visible(true);
nanogui::mainloop(1 / 60.f * 1000)
```
