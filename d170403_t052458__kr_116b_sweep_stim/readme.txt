116b_sweep_stim Swept stim through a range of values

Plotting command:
for i = 1:4:16;  PlotData2(data,'plot_type','imagesc','varied1',i:i+3,'population','RS|FS','crop_range',[200 300],'dim_stacking',{'varied1','populations'}); end
