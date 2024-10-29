cd ~/local/dock6.10/src/dock/nab
make clean
make copy.lex.mm_options.c
make -e DOCKBUILDFLAGS='-Dflex' all
cd ~/local/dock6.10/install
make dock
