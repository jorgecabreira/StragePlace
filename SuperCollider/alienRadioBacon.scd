(
{
	Limiter.ar(HPF.ar(
		GVerb.ar(
			Pan2.ar(
				PMOsc.ar(
					Demand.kr(
						Impulse.kr(
							SinOsc.kr(SinOsc.kr(1/30).range(1/10, 1/15)).range(0, 25)
							* LFPulse.kr(0.2).range(0.5, 1)
							+
							LFDNoise3.kr(1/10, 10, 10)
						),
						0,
						Dxrand(Array.geom(100, 50, 1.06), inf) + Dgeom(1, 1.005)
					),
					[[3,5],[7,11]] + SinOsc.ar([1/60, 1/45]).range(0, 1300),
					Demand.kr(
						Impulse.kr(SinOsc.kr(0.1).range(0.1, 20)),
						0,
						Dxrand(Array.series(13, 0, 0.5), inf)
					)
				).sum,
				SinOsc.ar(1, mul:0.5),
				LFPar.ar([1/5,1/3]).range(0.3, 1)
			),
			250,
			0.5,
			damping:SinOsc.kr(1/20).range(0.2,0.7),
			drylevel: SinOsc.kr(1/15).range(0.2,0.7),
			earlyreflevel:0.3
		) * 0.1
		+
		LFDNoise3.ar(SinOsc.kr(1/15, [0, pi/4]).range(100,350), 0.3),
		[SinOsc.ar(1/45, [0,pi/2]).range(20, 120)]
	))
}.play
)