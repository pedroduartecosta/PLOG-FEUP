:- include('board.pl').
:- include('utilities.pl').
:- include('logica.pl').
:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- use_module(library(random)).

yinyang:-
  init_board(T,6,6),
  display_board(T,6,6).
