#include <cstdlib>
#include <glog/logging.h>
#include <memory>

#include "Window_Manager.hpp"

int main (int argc, char **argv, char **argenv)
{
    google::InitGoogleLogging(argv[0]);

    std::unique_ptr<WindowManager> windowManager(WindowManager::Create());
    if (!windowManager){
        LOG(ERROR) << "Failed to initialize window manager.";
        return EXIT_FAILURE;
    }

    windowManager->Run();
    return EXIT_SUCCESS;
}
