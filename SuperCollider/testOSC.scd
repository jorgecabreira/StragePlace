// Define a synth that calculates amplitude (RMS) and sends it
(
SynthDef(\rmsSender, {
    var sig = SinOsc.ar(440);
    var rms = Amplitude.kr(sig, 0.05, 0.05);
    SendReply.kr(Impulse.kr(20), '/rms', [rms]); // 20 times/sec
    Out.ar(0, sig * 0.2);
}).add;
)

// Set up a responder to relay OSC to Processing
(
OSCdef(\forwardToProcessing, { |msg|
    var val = msg[3];
    NetAddr("127.0.0.1", 12000).sendMsg("/rms", val);
}, '/rms');
)

// Start the synth
x = Synth(\rmsSender);