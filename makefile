# Compilador
CC			:=	gcc
CFLAGS	:=	-std=c18 -Wall -Wextra -O3 -lm

# Directorios
SDIR		:=	src
ODIR		:=	obj
LDIR		:=	lib
BDIR		:=	bin

#	Métodos
.PHONY	:	all clean

# Archivos
OBJ	:=	$(addprefix $(ODIR)/, $(patsubst src/%.c, %.o, $(wildcard **/*.c)))
BIN	:=	transferencia

all	:	$(BDIR) $(BDIR)/$(BIN)

$(BDIR)/$(BIN)	:	$(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

$(ODIR)/%.o	:	$(SDIR)/%.c
	$(CC) -c $< -o $@ $(CFLAGS)

$(BDIR)	:
	mkdir $@ $(SDIR) $(ODIR) $(LDIR)

clean	:
	rm -r $(BDIR)
