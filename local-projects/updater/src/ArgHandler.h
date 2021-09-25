#pragma once
#include <algorithm>
#include <cstdio>
#include <string>
#include <vector>
#include <iostream>

class argHandler{
    
    public:
    argHandler(char **args);
    ~argHandler();
    
    void printArgs() const { for(std::string i: m_Args) std::cout << i << std::endl; }
    std::vector<std::string> args() const { return m_Args; }

    bool willAll() 		const { return m_willAll    ;   }
    bool willUpdate() 	const { return m_willUpdate ;   }
    bool willCompile() 	const { return m_willCompile;   }
    bool willPull() 	const { return m_willPull   ;   }
    bool willInstall() 	const { return m_willInstall;   }
    bool willPretend() 	const { return m_willPretend;   }
    bool isQuiet() 		const { return m_isQuiet    ;   }
    bool isVerbose() 	const { return m_isVerbose  ;   }
    bool isRecursive() 	const { return m_isRecursive;   }

    private:
        std::vector<std::string> m_Args;
        bool m_willAll
            ,m_willUpdate
            ,m_willCompile
            ,m_willPull
            ,m_willInstall
            ,m_willPretend
            ,m_isQuiet
            ,m_isVerbose
            ,m_isRecursive;
        
};
