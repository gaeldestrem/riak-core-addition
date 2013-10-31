-module(myapp).
-include("myapp.hrl").
-include_lib("riak_core/include/riak_core_vnode.hrl").

-export([
         ping/0,
         addition/1
        ]).

%% Public API

%% @doc Pings a random vnode to make sure communication is functional
ping() ->
    DocIdx = riak_core_util:chash_key({<<"ping">>, term_to_binary(now())}),
    PrefList = riak_core_apl:get_primary_apl(DocIdx, 1, myapp),
    [{IndexNode, _Type}] = PrefList,
    riak_core_vnode_master:sync_spawn_command(IndexNode, ping, myapp_vnode_master).

%% Addition function
addition(L) ->
    DocIdx = riak_core_util:chash_key({<<"addition">>, term_to_binary(now())}),
    PrefList = riak_core_apl:get_primary_apl(DocIdx, 1, myapp),
    [{IndexNode, _Type}] = PrefList,
    Message = {addition, L},
    riak_core_vnode_master:sync_spawn_command(IndexNode, Message, myapp_vnode_master).