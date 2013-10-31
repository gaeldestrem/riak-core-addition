* riak-core-addition
==================

Riak-core-addition : How to do a simple addition with riak-core on one/multiple nodes


* Riak-core environement

Follow this tutorial to get a working environement with riak-core:
https://github.com/rzezeski/try-try-try/tree/master/2011/riak-core-first-multinode

At the end, you should be able to ping your nodes :)

* I can ping my nodes but, How can I modify it and implement my functions?

You've got 2 environements where you can compile your sources, rel and dev

rel = play with one node
dev = play with multiple nodes

** Rel

start & stop your app:
>./rel/myapp/bin/myapp start
>./rel/myapp/bin/myapp stop

run functions on your node:
>./rel/myapp/bin/myapp attach

compile & deploy your app:
> make relclean && make rel

** Dev

start & stop your nodes:
> for d in dev/dev*; do $d/bin/myapp start; done
> for d in dev/dev*; do $d/bin/myapp stop; done

join your nodes:
> for d in dev/dev{2,3}; do $d/bin/myapp-admin join myapp1@127.0.0.1; done

cluster status:
>./dev/dev1/bin/myapp-admin member_status

compile & deploy your app:
make devclean && make devrel  => compile & deploy for multiple nodes configured





