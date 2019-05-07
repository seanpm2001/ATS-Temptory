(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
//
// Author: Hongwei Xi
// Start Time: May, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload "./../SATS/print.sats"
#staload "./../SATS/stdio.sats"
//
(* ****** ****** *)

implement
{a}(*tmp*)
print$val(x) =
fprint$val<a>(the_stdout<>(), x)
implement
{a}(*tmp*)
print$ref(x) =
fprint$ref<a>(the_stdout<>(), x)

(* ****** ****** *)
//
implement
{}(*tmp*)
print_newline() =
fprint_newline<>(the_stdout<>())
//
(* ****** ****** *)

implement
{}(*tmp*)
print_int(x) = print$val<int>(x)
implement
{}(*tmp*)
print_bool(x) = print$val<bool>(x)
implement
{}(*tmp*)
print_char(x) = print$val<char>(x)
(*
implement
print_double(f0) = print$val<double>(f0)
*)
implement
{}(*tmp*)
print_string(cs) = print$val<string>(cs)

(* ****** ****** *)

implement
fprint$val<int>(out, x) =
$extfcall(void, "fprintf", out, "%i", x)

(* ****** ****** *)

(* end of [print.dats] *)
