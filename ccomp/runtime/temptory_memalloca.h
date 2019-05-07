/* ******************************************************************* */
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/* ******************************************************************* */

/*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-20?? Hongwei Xi, ATS Trustful Software, Inc.
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
*/

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Start time: March, 2013 *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
*/

/* ****** ****** */

#ifndef TEMPTORY_MEMALLOCA_H
#define TEMPTORY_MEMALLOCA_H

/* ****** ****** */
//
// alloca.h
//
extern void *alloca(size_t bsz) ;
//
/* ****** ****** */
//
// HX: [afree] matches [alloca]
//
ATSinline()
atsvoid_t0ype
atsruntime_afree_libc
  (atstype_ptr ptr) { return ; }
// end of [atsruntime_afree_libc]

ATSinline()
atstype_ptr
atsruntime_alloca_libc
  (atstype_size bsz) { return alloca(bsz) ; }
// end of [atsruntime_alloca_libc]

/* ****** ****** */

#endif /* TEMPTORY_MEMALLOCA_H */

/* ****** ****** */

/* end of [temptory_memalloca.h] */
