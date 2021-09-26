#pragma once

extern "C"
{ 
#include <X11/Xlib.h>
}
#include <memory>

class WindowManager
{

public:

    static std::unique_ptr<WindowManager> Create();
    ~WindowManager();
    void Run();

    static int      onXError(Display* display, XErrorEvent* error);
    static int      onWMDetected(Display* display, XErrorEvent* event);
    static bool     wmDetected;

private:
    WindowManager(Display* display);

    Display* m_display;
    const Window m_root;

};

typedef struct _XKeyEvent
{
    int type;
}XKeyEvent;
