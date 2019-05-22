(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2013 Hongwei Xi, ATS Trustful Software, Inc.
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
(* Start time: December, 2012 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)
//
// HX: shared by linmap_list
(*
// HX: shared by linmap_listord
*)
// HX: shared by linmap_avltree
// HX: shared by linmap_randbst
// HX: shared by linmap_skiplst
//
(* ****** ****** *)
//
absvtbox
map_vtbox
(k0:vtflt, x0:vtflt+) = ptr
vtypedef
map(k0:vtflt,x0:vtflt) = map_vtbox(k0, x0)
//
(* ****** ****** *)
//
fun
{k0:vtflt}
equal_key_key(k1: !k0, k2: !k0):<> bool
fun
{k0:vtflt}
compare_key_key(k1: !k0, k2: !k0):<> sint
//
(* ****** ****** *)
//
fun{}
linmap_nil{k0,x0:vtflt}(): map(k0, x0)
fun{}
linmap_make_nil{k0,x0:vtflt}(): map(k0, x0)
//
(* ****** ****** *)
//
fun{}
linmap_iseqz
{k0,x0:vtflt}(map: !map(k0, INV(x0))): bool
fun{}
linmap_isneqz
{k0,x0:vtflt}(map: !map(k0, INV(x0))): bool
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
linmap_size(map: !map(k0, INV(x0))): size
fun
{k0,x0:vtflt}
linmap_length(map: !map(k0, INV(x0))): Intgte(0)
//
(* ****** ****** *)

fun
{k0,x0:vtflt}
linmap_search
( map
: !map(k0, INV(x0))
, k0: !k0, r0: &x0? >> opt(x0, b)
) : #[b:bool] bool(b) (*found*) // endfun

fun{
key:t0p;itm:vt0p
} linmap_search_ref
  (map: !map (key, INV(itm)), k0: key): cptr0(itm)
// end of [linmap_search_ref]

fun{
key:t0p;itm:t0p
} linmap_search_opt
  (map: !map (key, INV(itm)), k0: key): Option_vt (itm)
// end of [linmap_search_opt]

(* ****** ****** *)
//
// HX-2012-12:
// if [k0] occurs in [map], [x0] replaces the
// item associated with [k0] in [map] while the
// item is stored in [res] instead.
//
fun{
key:t0p;itm:vt0p
} linmap_insert
(
  &map (key, INV(itm)) >> _, key, itm, res: &itm? >> opt(itm, b)
) : #[b:bool] bool(b) // endfun
fun{
key:t0p;itm:vt0p
} linmap_insert_opt
  (map: &map(key, INV(itm)) >> _, k0: key, x0: itm): Option_vt(itm)
// end of [linmap_insert_opt]

(* ****** ****** *)
//
// HX-2012-12:
// insertion always happens regardless whether
// [k0] is associated with some item in [map]
//
fun{
key:t0p;itm:vt0p
} linmap_insert_any
  (map: &map (key, INV(itm)) >> _, k0: key, x0: itm): void
// end of [linmap_insert_any]

(* ****** ****** *)

fun{
key:t0p;itm:vt0p
} linmap_takeout
(
  &map (key, INV(itm)) >> _, key, res: &itm? >> opt (itm, b)
) : #[b:bool] bool(b) // endfun
fun{
key:t0p;itm:vt0p
} linmap_takeout_opt
  (map: &map (key, INV(itm)) >> _, k0: key): Option_vt (itm)
// end of [linmap_takeout_opt]

(* ****** ****** *)

fun{
key:t0p;itm:t0p
} linmap_remove (
  map: &map (key, INV(itm)) >> _, k0: key): bool
// end of [linmap_remove]

(* ****** ****** *)
//
fun{
} fprint_linmap$sep (out: FILEref): void // "; "
fun{
} fprint_linmap$mapto (out: FILEref): void // "->"
//
fun{
key,itm:t@ype
} fprint_linmap
  (out: FILEref, map: !map (key, INV(itm))): void
//
overload fprint with fprint_linmap
//
(* ****** ****** *)

fun
{key:t0p
;itm:vt0p}
{env:vt0p}
linmap_foreach$fwork
  (k: key, x: &itm >> _, env: &(env) >> _): void
// end of [linmap_foreach$fwork]

fun{
key:t0p;itm:vt0p
} linmap_foreach (map: !map (key, INV(itm))): void
// end of [linmap_foreach]

fun
{key:t0p
;itm:vt0p}
{env:vt0p}
linmap_foreach_env
  (map: !map (key, INV(itm)), env: &(env) >> _): void
// end of [linmap_foreach_env]

(* ****** ****** *)

fun{
key:t0p;itm:t0p
} linmap_free (map: map (key, INV(itm))):<!wrt> void

(* ****** ****** *)

fun{
itm:vt0p
} linmap_freelin$clear (x: &itm >> _?):<!wrt> void
fun{
key:t0p;itm:vt0p
} linmap_freelin (map: map (key, INV(itm))):<!wrt> void

(* ****** ****** *)
//
// HX-2013:
// a linmap can be properly freed only if it is empty
//
fun{
key:t0p;itm:vt0p
} linmap_free_ifnil
(
  map: !map (key, INV(itm)) >> opt(map(key, itm), b)
) :<!wrt> #[b:bool] bool(b) (*~freed*) // endfun
//
(* ****** ****** *)
//
// HX: traversal fashion is unspecified
//
(* ****** ****** *)
//
fun
{key:t0p
;itm:vt0p}
{ki2:vt0p}
linmap_flistize$fopr (k: key, x: itm): ki2
fun
{key:t0p
;itm:vt0p}
{ki2:vt0p}
linmap_flistize (map: map (key, INV(itm))): List0_vt(ki2)
//
(* ****** ****** *)

fun
{key:t0p
;itm:vt0p}
linmap_listize
  (map: map (key, INV(itm))):<!wrt> List0_vt@(key, itm)
// end of [linmap_listize]
fun{
key,itm:t0p
} linmap_listize1
  (map: !map (key, INV(itm))):<!wrt> List0_vt@(key, itm)
// end of [linmap_listize1]

(* ****** ****** *)

(* end of [linmap.hats] *)
