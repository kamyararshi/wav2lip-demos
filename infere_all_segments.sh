
#!/bin/bash



# ### Ursula
# VIDEO_ARGS=(
#    "./Demo/Ursula/segments_cloned/segment_1.mp4" 
#    "./Demo/Ursula/segments_cloned/segment_2.mp4"
#    "./Demo/Ursula/segments_cloned/segment_3.mp4"
# )
# AUDIO_ARGS=(
#    "./Demo/Ursula/audio_cloned/1.wav"
#    "./Demo/Ursula/audio_cloned/2.wav"
#    "./Demo/Ursula/audio_cloned/3.wav"
# )

### Trump
VIDEO_ARGS=(
   "./Demo/Trump/segments_cloned/segment_1.mp4"
   "./Demo/Trump/segments_cloned/segment_2.mp4"
   "./Demo/Trump/segments_cloned/segment_3.mp4"
   "./Demo/Trump/segments_cloned/segment_4.mp4"
   "./Demo/Trump/segments_cloned/segment_5.mp4"
   "./Demo/Trump/segments_cloned/segment_6.mp4"
   "./Demo/Trump/segments_cloned/segment_7.mp4"
   "./Demo/Trump/segments_cloned/segment_8.mp4"
)
AUDIO_ARGS=(
   "./Demo/Trump/audio_cloned/1.wav"
   "./Demo/Trump/audio_cloned/2.wav"
   "./Demo/Trump/audio_cloned/3.wav"
   "./Demo/Trump/audio_cloned/4.wav"
   "./Demo/Trump/audio_cloned/5.wav"
   "./Demo/Trump/audio_cloned/6.wav"
   "./Demo/Trump/audio_cloned/7.wav"
   "./Demo/Trump/audio_cloned/8.wav"
)

counter=1

for ((i=0; i<${#VIDEO_ARGS[@]}; i++)); do
    
    first_arg="${VIDEO_ARGS[i]}"
    second_arg="${AUDIO_ARGS[i]}"

    echo "Iteration $counter: Executing inference.py with arguments: $first_arg and $second_arg"
    echo "Saves at results/results_$counter.mp4"

    python -u inference.py \
            --checkpoint_path checkpoints/wav2lip_gan.pth \
            --face  "$first_arg"\
            --audio "$second_arg" \
            --outfile "results/results_$counter.mp4"
    ((counter++))
done

rm -r results.zip
zip -r results.zip results/
