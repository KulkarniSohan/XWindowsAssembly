#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>

char hello[] = "Hello World";
char hi[] = "Bilated Happy Birthday Sir";


int main (int argc, char *argv[])
{
	Display *my_display = NULL;
	Window my_window;
	GC my_gc;
	XEvent my_event;
	int my_screen, done = 0;
	unsigned int foreground, background;
	
	my_display = XOpenDisplay ("");
	if ( my_display == NULL )
	{
		printf ("\n\t Couldn't Open display\n");
		exit (-1);
	}
	my_screen = DefaultScreen (my_display);
	
	foreground = WhitePixel (my_display, my_screen);
	background = BlackPixel (my_display, my_screen);
	
	my_window = XCreateSimpleWindow (my_display, RootWindow (my_display, my_screen), 200, 300, 350, 350, 5, background, foreground);
	my_gc = XCreateGC (my_display, my_window, 0, 0);
	
	XSelectInput (my_display, my_window, ButtonPressMask | KeyPressMask | ExposureMask );

	XMapWindow (my_display, my_window );
	
	
	while (done == 0)
	{
		XNextEvent (my_display, &my_event);
		switch (my_event.type)
		{
			case Expose:
				XDrawString ( my_event.xexpose.display, my_event.xexpose.window, my_gc, 50, 50, hello, strlen (hello) );
				break;
			case ButtonPress:
				XDrawString ( my_event.xbutton.display, my_event.xbutton.window, my_gc, my_event.xbutton.x, my_event.xbutton.y, hi, strlen (hi));
				break;
			case KeyPress:
				done = 1;
				break;
			case MappingNotify:
				XRefreshKeyboardMapping ( (struct XMappingEvent *)&my_event);
				break;
		}
	}
	XFreeGC (my_display, my_gc );
	XDestroyWindow (my_display, my_window);
	XCloseDisplay (my_display);
}
