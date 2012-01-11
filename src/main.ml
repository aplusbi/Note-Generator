let write file note = 
    let smf = Smf.smf_new () in
    let track = Smf.track_new () in
    Smf.add_track smf track;
    let event = Smf.event_new_from_bytes 0xC0 40 (-1) in
    Smf.track_add_event_seconds track event 0;
    let event = Smf.event_new_from_bytes 0x90 note 100 in
    Smf.track_add_event_seconds track event 0;
    let event = Smf.event_new_from_bytes 0x80 note 0 in
    Smf.track_add_event_seconds track event 1000;
    ignore (Smf.save smf file)

let _ =
    for i = 55 to 108 do
        let file = "midi/" ^ (string_of_int i) ^ ".mid" in
        write file i
    done
