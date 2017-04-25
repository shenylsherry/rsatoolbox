subjects = {'CBU101295','CBU101316',...
'CBU101312','CBU101358',...
'CBU101513','CBU101322',...
'CBU101460','CBU101461',...
'CBU101331','CBU101325',...
'CBU101616','CBU101555',...
'CBU110250','CBU110362',...
'CBU101578','CBU101559',...
'CBU101450','CBU101592',...
'CBU101577','CBU101585',...
'CBU101363','CBU101370',...
'CBU101355','CBU101607',...
'CBU110280','CBU101365',...
'CBU101544','CBU101542',...
'CBU101364','CBU101356',...
'CBU110221','CBU101576',...
'CBU110294','CBU110428',...
'CBU101606','CBU110423',...
'CBU101596','CBU101605',...
'CBU110242','CBU101597'};

subjectI = 1;

Opt.analysisName = 'crossnobis_sl';
Opt.rootPath = fullfile('/home/adf/charesti/Documents/iRSA_fMRI/mridata2015',subjects{subjectI});
cd(Opt.rootPath);

Opt.spmDir   = fullfile('spmmodel');
load(fullfile(Opt.spmDir,'SPM.mat'))
Opt.conditionLabels = {SPM.Sess(1).Fc.name};
Opt.imageDataDir      = {'run1','run2','run3','run4','run5','run6','run7','run8','run9'};

addpath(genpath(fullfile('/media/bluebear','software','rsatoolbox-develop')))

% load mask.img
maskV = spm_vol(fullfile(Opt.rootPath,'spmmodel','mask.img'));
maskY = spm_read_vols(maskV);

S{1} = maskV; % 1x3 vector with volume dimensions (in voxels)
S{1}.data = maskY;

L = rsa.defineSearchlight(S,[]);

rsa.runSearchlightLDC(L,Opt);