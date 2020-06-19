

in_thread do
  use_synth :dsaw
  loop do
    if one_in(8)
      play 50, amp: 0.5, release: 2
      play 53, amp: 0.7, release: 3 if one_in(2)
      play 57, amp: 0.8, release: 4 if one_in(3)
      play 60, amp: 0.9, release: 4 if one_in(4)
    end
    sleep 1.5
  end
end

in_thread do
  loop do
    if not one_in(4)
      use_synth :fm
      play (choose [50, 57, 53, 60, 69, 72]),
        amp: rrand(0.7, 1)
    end
    sleep 0.25
  end
end

in_thread do
  loop do
    use_synth :fm
    play (choose [62, 65, 72, 62, 65, 72, 81]),
      amp: rrand(0.3, 0.7),
      release: rrand(1, 1.5) if one_in(2)
    sleep 0.125
  end
end

in_thread do
  loop do
    sample :drum_cymbal_closed, amp: rrand(0.3, 0.5) if not one_in(4)
    sleep 0.25
  end
end


loop do
  sample :drum_heavy_kick, amp: rrand(0.8, 1)
  sleep 0.5
  sample :drum_heavy_kick, amp: rrand(0.8, 1) if not one_in(4)
  sample :drum_snare_soft
  sleep 0.5
  sample :drum_heavy_kick, amp: rrand(0.8, 1)
  sleep 0.5
  sample :drum_heavy_kick, amp: rrand(0.8, 1) if not one_in(4)
  sleep 0.5
end