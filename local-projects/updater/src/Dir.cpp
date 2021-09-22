#include "Dir.h"

namespace fs = std::filesystem;

std::string listDir(){
    return fs::current_path();
}
