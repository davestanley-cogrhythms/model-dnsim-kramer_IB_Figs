111a_RS_FS_LTS_test_sparse Tried comparing my gamma network to Jasons gamma network and latency between RS and FS pulses.


t=data.time; figure; plotz(t,data.FS_FS_IBaIBdbiSYNseed_s,'b') ; hold on; plotz(t,data.RS_RS_IBaIBdbiSYNseed_s,'r'); plotz(t,data.LTS_V,'g');


for i = 1:9
    t = data.time; figure; plotz(t,data(i).E_I_iGABAa_s,'b'); hold on; plotz(t,data(i).I_E_iAMPA_s,'r');
end


