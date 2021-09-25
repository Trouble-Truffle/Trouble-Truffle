#include "ArgHandler.h"
#include <cstddef>

argHandler::argHandler(char **args)
{
    for(size_t i=0; args[i] != nullptr; i++)
    {
        m_Args.push_back(args[i]);

    }
}
argHandler::~argHandler()
{
}
