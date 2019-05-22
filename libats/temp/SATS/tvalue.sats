(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2019 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Start time: February, 2019 *)
(* Authoremail: gmmhwxiATgmailDOTcom *)

(* ****** ****** *)
//
#define
ATS_PACKNAME
"temptory.temp.tvalue."
//
(* ****** ****** *)
//
// HX: For tagged values
//
(* ****** ****** *)

#staload "./hashmap_chain.sats"

(* ****** ****** *)
//
datatype tvalue =
//
| TVnil of ()
//
| TVint of int
| TVptr of ptr
//
| TVarr of tarray0
| TVlst of tvalist
| TVobj of tobject
//
| TVfun of tcloref
//
| TVfloat of double
| TVstring of string
//
where
tvalist = list0(tvalue)
and
tarray0 = arrszref(tvalue)
and
tobject = hmapref(string, tvalue)
and
tcloref = tvalist -<cloref> tvalue
//
(* ****** ****** *)
//
fun
print_tvalue(tvalue): void
//
#symload print with print_tvalue
//
(* ****** ****** *)

(* end of [tvalue.sats] *)
