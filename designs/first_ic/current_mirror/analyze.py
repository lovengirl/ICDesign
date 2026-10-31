from pathlib import Path
import os,json
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
p=Path(__file__).resolve().parent
os.chdir(p)
a=np.loadtxt('direct.dat',skiprows=1); b=np.loadtxt('xschem.dat',skiprows=1)
assert a.shape==b.shape and len(a)==1201
for data,name in [(a,'direct'),(b,'xschem')]:
    np.savetxt(name+'.csv',np.column_stack((data[:,1],data[:,2],data[:,3],(data[:,2]/1e-5-1)*100)),delimiter=',',header='Vout_V,Iout_A,Vgate_V,error_percent',comments='',fmt='%.15g')
i=int(np.argmin(abs(a[:,1]-.6)))
result=dict(Vout_V=float(a[i,1]),Iref_A=1e-5,Iout_A=float(a[i,2]),error_A=float(a[i,2]-1e-5),error_percent=float((a[i,2]/1e-5-1)*100),Vgate_V=float(a[i,3]),xschem_Iout_A=float(b[i,2]),max_abs_difference_A=float(np.max(abs(a[:,2]-b[:,2]))),points=len(a))
(p/'results.json').write_text(json.dumps(result,indent=2)+'\n')
plt.figure(figsize=(8,5)); plt.plot(a[:,1],a[:,2]*1e6,label='Direct netlist'); plt.plot(b[:,1],b[:,2]*1e6,'--',label='Xschem netlist'); plt.axhline(10,color='gray',ls=':',label='10 uA reference'); plt.scatter([.6],[a[i,2]*1e6],color='black'); plt.xlabel('Output voltage (V)'); plt.ylabel('Output current (uA)'); plt.title('IHP SG13G2 NMOS 1:1 current mirror\nW/L=2um/1um, TT, 27 C'); plt.grid(); plt.legend(); plt.tight_layout(); plt.savefig('current_mirror.png',dpi=180)
print(json.dumps(result,indent=2))
