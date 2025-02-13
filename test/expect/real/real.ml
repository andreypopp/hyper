(* This file is part of Hyper, released under the MIT license. See LICENSE.md
   for details, or visit https://github.com/aantron/hyper.

   Copyright 2022 Anton Bachin *)



let%expect_test _ =
  Lwt_main.run begin
    let%lwt response =
      Hyper.run
        (Hyper.request "https://github.com" ~headers:["Host", "github.com"]) in
    response
    |> Dream_pure.Message.status
    |> Dream_pure.Status.status_to_string
    |> print_endline;
    Lwt.return_unit
  end;
  [%expect {| OK |}]
