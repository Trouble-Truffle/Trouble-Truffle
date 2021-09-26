#include "Window_Manager.hpp"
#include <glog/logging.h>
#include <X11/Xlib.h>

std::unique_ptr<WindowManager> WindowManager::Create()
{
    Display* display = XOpenDisplay(nullptr);
    if( display == nullptr )
    {
        LOG(ERROR) << "Failed to open X display" << XDisplayName(nullptr);
        return nullptr;
    }

    return std::unique_ptr<WindowManager>(new WindowManager (display));
}

WindowManager::WindowManager(Display* display)
    :m_display(CHECK_NOTNULL(display))
     , m_root(DefaultRootWindow(m_display)) {}

WindowManager::~WindowManager()
{
    XCloseDisplay(m_display);
}

void WindowManager::Run(){

    wmDetected = false;
    XSetErrorHandler(&WindowManager::onWMDetected);
    XSelectInput(m_display, m_root, SubstructureRedirectMask | SubstructureNotifyMask);
    XSync(m_display, false);

    if(wmDetected)
    {
        LOG(ERROR) << "Detected another WM"
                   << XDisplayString(m_display);
    }
    return;

    XSetErrorHandler(&WindowManager::onXError);

    for(;;)
    {
        XEvent event;
        XNextEvent(m_display, &event);
        LOG(INFO) << "Received Event:" << ToString(event);

        switch(event.type)
        {
            case CreateNotify:
                onCreateNotify(event.xcreatewindow);
                break;
            case DestroyNotify:
                OnDestroyNotify(event.xdestroywindow);
                break;
            case ReparentNotify:
                OnReparentNotify(event.xreparent);
                break;
            default:
                LOG(WARNING) << "Ignored Event";
        }
    }
}

int WindowManager::onWMDetected(Display* display, XErrorEvent *event)
{
    CHECK_EQ(static_cast<int>(event->error_code), BadAccess);

    wmDetected = true;

    return EXIT_SUCCESS;
}
