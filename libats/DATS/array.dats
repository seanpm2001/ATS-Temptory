(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2019 Hongwei Xi, ATS Trustful Software, Inc.
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
(* Start time: Feburary, 2012 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)

#staload "./../SATS/gint.sats"
#staload "./../SATS/gptr.sats"
#staload "./../SATS/gseq.sats"
#staload "./../SATS/array.sats"

(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)
//
implement
{a}(*tmp*)
array_getref_at
  (A0, i) =
  $UN.cast{cptr(a)}(addr@A0)+i
//
(* ****** ****** *)
//
implement
{}(*tmp*)
array_ptr_mfree
(pf1, pf2 | p0) =
let
prval () = $UN.cast2void(pf1)
prval () = $UN.cast2void(pf2)
in
  $extfcall(void, "ATS_MFREE", p0)
end // end of [array_ptr_mfree]
//
(* ****** ****** *)

implement
{a}(*tmp*)
array_ptr_alloc
  (asz) =
(
$UN.castvwtp0
(
  $extfcall
  (ptr, "ATS_MALLOC", asz*sizeof<a>)
)
) (* end of [array_ptr_alloc] *)

(* ****** ****** *)

(* end of [array.dats] *)
