type t

module Iterate : sig
  type h5g = t
  type 'a t = h5g -> string -> 'a -> H5.Iter.t
end

external to_loc : t -> Loc.t = "%identity"
external of_loc : Loc.t -> t = "%identity"

external close : t -> unit = "hdf5_h5g_close"
external create : Loc.t -> ?lcpl:H5p.t -> ?gcpl:H5p.t -> ?gapl:H5p.t -> string -> t
  = "hdf5_h5g_create"
external open_ : Loc.t -> ?gapl:H5p.t -> string -> t = "hdf5_h5g_open"
external link : Loc.t -> H5l.Type.t -> current_name:string -> new_name:string -> unit
  = "hdf5_h5g_link"
external unlink : Loc.t -> string -> unit = "hdf5_h5g_unlink"
external set_comment : Loc.t -> string -> string -> unit = "hdf5_h5g_set_comment"
external get_comment : Loc.t -> string -> string = "hdf5_h5g_get_comment"
external iterate : Loc.t -> string -> ?idx:int ref -> 'a Iterate.t -> 'a -> unit
  = "hdf5_h5g_iterate"