# riak-core-addition
==================

Riak-core-addition : How to do a simple addition with riak-core on one/multiple nodes


## Riak-core environement

Follow this tutorial to get a working environement with riak-core:
https://github.com/rzezeski/try-try-try/tree/master/2011/riak-core-first-multinode

At the end, you should be able to ping your nodes :)

## I can ping my nodes but, How can I modify it and implement my functions?

You've got 2 environements where you can compile your sources, rel and dev

rel = play with one node

dev = play with multiple nodes

### Rel

start & stop your app:
>./rel/myapp/bin/myapp start
>
>./rel/myapp/bin/myapp stop

play & run functions on your node:
>./rel/myapp/bin/myapp attach

compile & deploy your app:
> make relclean && make rel

### Dev

start & stop your nodes:
> for d in dev/dev*; do $d/bin/myapp start; done
>
> for d in dev/dev*; do $d/bin/myapp stop; done

check if they are alive:
>for d in dev/dev{2,3}; do $d/bin/myapp-admin join myapp1@127.0.0.1; done

join your nodes:
> for d in dev/dev{2,3}; do $d/bin/myapp-admin join myapp1@127.0.0.1; done

cluster status:
>./dev/dev1/bin/myapp-admin member_status

compile & deploy your app on nodes:
>make devclean && make devrel 

play & run functions on your node:
>./dev/dev1/bin/myapp attach

** Sources
Your sources are in ./apps/myapp/src

We're going to add the possibility to make additions with our cluster

Check these two files:
./apps/myapp/src/myapp.erl
./apps/myapp/src/myapp_vnode.erl

I've just added addition(L) in myapp.erl and handle_command({addition, Data}, _Sender, State) & sum function in myapp_vnode.erl

Let's recompile your sources 
make relclean && make rel // make devclean && make devrel

and when you play with your shell, you should be able to do additions now :)

>(myapp1@127.0.0.1)1> myapp:addition([2,4]).
>{6,319703483166135013357056057156686910549735243776}
>
>(myapp1@127.0.0.1)2> myapp:addition([2,8]).
>{10,91343852333181432387730302044767688728495783936}











