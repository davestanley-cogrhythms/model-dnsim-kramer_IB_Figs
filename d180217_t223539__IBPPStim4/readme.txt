
Increased Jdfs5 from 1.0 to 1.2 (make more hyperpolarized so that they don't fire spontaneously when top-down inputs blocked)
Reduced gGABAb_ngib from 1.1/Ng down to 0.9/Nng 			(This means less inhibition needs to come from IB firing and more can come from FS activity)
Sweeping gRS->deepFS: 'RS->dFS5','g_SYN',[linspace(0.1,1.2,8)]/Nrs;
	The goal of this is to possibly increase deep FS activity so that we can compensate for change #2 and maintain total inhibition levels.


