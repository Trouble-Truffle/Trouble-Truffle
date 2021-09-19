#include <cstdint>
#include <cstdio>
#include <iostream>
#include <ncurses.h>
#include <signal.h>

void* resizeHandler(int sig)
{
    uint32_t nh(0), nw(0);
    getmaxyx(stdscr, nh, nw);
    stdscr = newwin(nh, nw, 0, 0);
}

int main(int argc, char **argv)
{
    uint32_t Cols(85), Rows(25);
    std::printf("Hello World\n");
    initscr();

    WINDOW* win = newwin(Rows, Cols, 0, 0);
    for(;;)
    {
        signal(SIGWINCH, resizeHandler);
    }
}
