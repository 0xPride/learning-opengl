CC=gcc
NAME=learngl
CFLAGS=-Wall -Wextra 
GLFLAGS= -lGLEW -lOpenGL -lglfw

SRCD = src/
SRCF = main.c

OBJD = .obj/

CFILES = $(addprefix $(SRCD), $(SRCF))
_OFILES = $(patsubst %c, %o, $(CFILES))
OFILES = $(addprefix $(OBJD), $(_OFILES)) 

all: $(NAME)

$(NAME): $(OFILES)
	$(CC) $(GLFLAGS) $(OFILES) -o $(NAME)

$(OBJD)%.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

re: fclean clean

fclean: clean
	$(RM) -f $(NAME)

clean:
	$(RM) -f $(OFILES)
