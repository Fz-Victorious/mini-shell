NAME = minishell
SRCS = $(wildcard mandatory/*.c)\
	  $(wildcard  mandatory/parsing/*.c)\
	  $(wildcard mandatory/execution/*.c)\
	  $(wildcard mandatory/expansion/*.c)\
	  $(wildcard utils/*.c)

HEADER = mandatory/minishell.h
RM = rm -f
LIBFT = utils/libft.a
FLAGS = -Werror -Wall -Wextra
MAKE = make

OBJS = $(SRCS:.c=.o)

$(NAME) : $(OBJS) $(LIBFT)
	gcc $(OBJS) -lreadline -L/Users/ssadiki/.brew/opt/readline/lib -L utils -o $(NAME) $(LIBFT)

%.o : %.c $(HEADER)
	gcc $(FLAGS) -I/Users/ssadiki/.brew/opt/readline/include -o $@ -c $<

all : $(NAME)

$(LIBFT) :
	$(MAKE) -C utils

clean:
	$(RM) $(OBJS)
	cd utils && make clean

fclean: clean
	$(RM) $(NAME)
	cd utils && make fclean

re: fclean all

.PHONY: clean fclean all re
