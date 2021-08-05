import times

type User* = object
  id*: string
  email*: string
  password*: string
  name*: string
  created_at*: Time
  updated_at*: Time
  deleted_at*: Time
