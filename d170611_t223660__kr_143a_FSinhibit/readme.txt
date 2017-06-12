143a_FSinhibit Big change: removed 40ms LTS inhib. Adjusted other things.

	1. Undid long 40 ms LTS inhibitory time constant.
	2. Increased DC excitability of LTS: Jlts to -2 and gRS_LTS to 0.2
	3. Greatly increased gLTS->FS inhibit to 0.8. Decreased gLTS->FS to 0.2
	4. Slightly reduced gFS->LTS, also to make LTS cells more “reboundy"

	Figs 1-3 - 40 Hz pulse train
	Figs 4-5 - Spontaneous
	Figs 6-7 - 30 Hz pulse train