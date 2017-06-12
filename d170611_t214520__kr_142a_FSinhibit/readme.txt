142a_FSinhibit Big change: shifted to mode where LTS inhibit FS cells. See readme for details.

Summary of changes:
	1. LTS cell stimulation: More Jlts; less gRS->LTS
	2. Doubled LTS GABA tau (now 40 ms)
	3. Reduced feedback inhibition from LTS to compensate for longer tau
		gLTS->RS = 0.5 (down from 0.75)
		gLTS->FS = 0.2 (down from 0.3); likely still need to decrease this further
		