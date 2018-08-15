open Hm

let check msg x = Alcotest.(check bool) msg true x

let stuff () =
  check "2. > 1." (2. > 1.);
  check "1. = 1." (1. = 1.)

let tests = [
  "stuff", `Quick, stuff;
]

let test_suites: unit Alcotest.test list = [
  "stuff", tests
]

let () = Alcotest.run "hm" test_suites
