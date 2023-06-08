clc;clear all;close all
% for get dynamics
% load temporal transitions
load Temporal_transition_postT_fro.mat tr_RSN_post
tt = tr_RSN_post;
[nsubj,nscan] = size(tt);
nstate = 14
tt = tt+1; %方便计算，将0-13状态变为1-nstate状态
cmap = [200 200 200
        31 107 160
        153 175 204
        222 114 19
        222 165 109
        42 142 44
        134 196 124
        187 39 41
        222 135 135
        131 94 168
        173 156 188
        124 79 71
        172 139 133
        198 107 172]./255
    
figure;        
heatmap(tt,'GridVisible','off');    
colormap(cmap)
xlabel('Brain volumes(TRs)')
title('postT')
% set(gca,'Colorbar',{'Hub','DMN','SMh','SMm','Vis','FPN','Aud','CPN','RTN','CON','VAT','SAL','DAT','None'})
% set(gca,'XDisplayLabels',{'0','100','200','300','400','500','600'})
set(gca,'YDisplayLabels',{'Sub01','Sub02','Sub03','Sub04','Sub05','Sub06','Sub07','Sub09','Sub10','Sub11','Sub12','Sub13','Sub15','Sub16','Sub19','Sub20','Sub21','Sub22','Sub23'})
set(gca,'FontName','Times New Roman','FontSize',14)
set(gcf,'position',[300,300,1500,500])

%%
% TR = 1.25
%         for s=1:nsubj
%             Ctime = tt(s,:);
%             
%             for c=1:nstate  % c equals the number of states
%                 % Probability
%                 P(s,c)=mean(Ctime==c);
%                 
%                 % Mean Lifetime
%                 Ctime_bin=Ctime==c;
%                 
%                 % Detect switches in and out of this state
%                 a=find(diff(Ctime_bin)==1);
%                 b=find(diff(Ctime_bin)==-1);
%                 
%                 % We discard the cases where state sarts or ends ON
%                 if length(b)>length(a)
%                     b(1)=[];
%                 elseif length(a)>length(b)
%                     a(end)=[];
%                 elseif  ~isempty(a) && ~isempty(b) && a(1)>b(1)
%                     b(1)=[];
%                     a(end)=[];
%                 end
%                 if ~isempty(a) && ~isempty(b)
%                     C_Durations=b-a;
%                 else
%                     C_Durations=0;
%                 end
%                 LT(s,c)=mean(C_Durations)*TR;
%             end
%         end
% %%
% ind_sort=[1:nstate];
% PTR_all = zeros(nstate,nstate,nsubj);  
% mcPTR_all = zeros(nstate,nstate,nsubj);  
% sum_all = zeros(nsubj,nstate);
% for s=1:nsubj
%     IDX = tt(s,:);
%     PTRANSITION=zeros(nstate,nstate);
% i=1;
% for c1=ind_sort
%     j=1;
%     for c2=ind_sort
%         sumatr=0;
%         for t=1:length(IDX)-1
%             if IDX(t)==c1 && IDX(t+1)==c2
%                 sumatr=sumatr+1;
%             end
%         end
%         if length(find(IDX(1:length(IDX)-1)==c1)) ~= 0
%             PTRANSITION(i,j)=sumatr/(length(find(IDX(1:length(IDX)-1)==c1)));
%         end
%         j=j+1;
%     end
%     i=i+1;
% end
%          PTRANSITION(logical(eye(size(PTRANSITION)))) = 0;
%          PTR_all(:,:,s) = PTRANSITION;
%          mc = dtmc(PTRANSITION);
%          mcP = mc.P; 
%          mcP(find(isnan(mc.P)==1)) = 0;
%          mcPTR_all(:,:,s) = mcP;
% 
%          sumPTR = sum(mcP)./nstate;
%          sum_all(s,:) = sumPTR;
% end

      
% mPTR = mean(mcPTR_all,3);
% 
% figure;
% heatmap(mPTR,'GridVisible','off');colorbar ;colormap('parula')       
% set(gca,'YDisplayLabels',{'Hub','DMN','SMh','SMm','Vis','FPN','Aud','CPN','RTN','CON','VAT','SAL','DAT','None'})
% set(gca,'XDisplayLabels',{'Hub','DMN','SMh','SMm','Vis','FPN','Aud','CPN','RTN','CON','VAT','SAL','DAT','None'})        
% set(gca,'FontName','Times New Roman','FontSize',14)
% set(gca,'YLabel','Source')
% set(gca,'XLabel','Destination')
% caxis([0,0.37]); 
% 
% 
% 
% figure;
% prob_all = P;
% fa = fcn_boxpts([prob_all(:,1), prob_all(:,2),prob_all(:,3), prob_all(:,4), prob_all(:,5),prob_all(:,6), prob_all(:,7),prob_all(:,8), prob_all(:,9), prob_all(:,10),prob_all(:,11), prob_all(:,12), prob_all(:,13),prob_all(:,14)],[],cmap);
% set(gca,'xtick',1:nstate,'xticklabel',{'Hub','DMN','SMh','SMm','Vis','FPN','Aud','CPN','RTN','CON','VAT','SAL','DAT','None'});
% set(gca,'FontName','Times New Roman','FontSize',10,'FontWeight','bold')
% ylabel('Activation(prob.)');
% title('preTMS')
% figure;
% prob_all = LT;
% fa = fcn_boxpts([prob_all(:,1), prob_all(:,2),prob_all(:,3), prob_all(:,4), prob_all(:,5),prob_all(:,6), prob_all(:,7),prob_all(:,8), prob_all(:,9), prob_all(:,10),prob_all(:,11), prob_all(:,12), prob_all(:,13),prob_all(:,14)],[],cmap);
% set(gca,'xtick',1:nstate,'xticklabel',{'Hub','DMN','SMh','SMm','Vis','FPN','Aud','CPN','RTN','CON','VAT','SAL','DAT','None'});
% set(gca,'FontName','Times New Roman','FontSize',10,'FontWeight','bold')
% ylabel('Duration time/s');
% title('preTMS')      
% figure;
% prob_all = sum_all;
% fa = fcn_boxpts([prob_all(:,1), prob_all(:,2),prob_all(:,3), prob_all(:,4), prob_all(:,5),prob_all(:,6), prob_all(:,7),prob_all(:,8), prob_all(:,9), prob_all(:,10),prob_all(:,11), prob_all(:,12), prob_all(:,13),prob_all(:,14)],[],cmap);
% set(gca,'xtick',1:nstate,'xticklabel',{'Hub','DMN','SMh','SMm','Vis','FPN','Aud','CPN','RTN','CON','VAT','SAL','DAT','None'});
% set(gca,'FontName','Times New Roman','FontSize',10,'FontWeight','bold')
% ylabel('Transition(prob.)');
% title('preTMS')

%%
% propose we have finished the above process
% load preT_dynam_fro.mat
% load postT_dynam_fro.mat
% for i =1:nstate
%     a = P_pre(:,i)';
%     b = P_post(:,i)';
%     stats=permutation_htest2_np([a,b],[ones(1,numel(a)) 2*ones(1,numel(b))],5000,0.05,'ttest');
%     P_pval(i) = min(stats.pvals);
% % paired t-test,only use when two samples have the same std and has a normal distribution
% %    disp('Paired-Samples T-test:');
% %    [h2,p2,ci2,stats2]=ttest(a,b);
% %     P_pval_t(i) = p2;
% %    disp(['t = ',num2str(stats2.tstat,'%0.2f')]);
% %    disp(['p = ',num2str(p2,'%0.2e')]);  
%     c = LT_pre(:,i)';
%     d = LT_post(:,i)';
%     stats=permutation_htest2_np([c,d],[ones(1,numel(c)) 2*ones(1,numel(d))],5000,0.05,'ttest');
%     LT_pval(i) = min(stats.pvals);
%     
%     e = sum_pre(:,i)';
%     f = sum_post(:,i)';
%     stats=permutation_htest2_np([e,f],[ones(1,numel(e)) 2*ones(1,numel(f))],5000,0.05,'ttest');
%     sum_pval(i) = min(stats.pvals);
%   
% end
% for n = 1:nstate
%     for p = 1:nstate
%         a = squeeze(mcPTR_pre(n,p,:))';
%         b = squeeze(mcPTR_post(n,p,:))';
%         if mean(a)>0.1 && mean(b)>0.1 && length(find(a~=0))>9 && length(find(b~=0))>9
%         stats=permutation_htest2_np([a,b],[ones(1,numel(a)) 2*ones(1,numel(b))],5000,0.05,'ttest');
%         tran_pval(n,p) = min(stats.pvals);
%         else
%         tran_pval(n,p) = 0;
%         end
%     end  
% end
%%
% load graphMetrics_pre_fro.mat
% load graphMetrics_post_fro.mat
% a = Q_pre;
% b = Q_post;
% stats=permutation_htest2_np([a,b],[ones(1,numel(a)) 2*ones(1,numel(b))],1000,0.05,'ttest');
% Q_pval = min(stats.pvals);
% %%
% cmap0 = [0 0 0
%     100 100 100]./255;
% figure
% sor2des_pre = squeeze(mcPTR_pre(1,2,:));
% sor2des_post = squeeze(mcPTR_post(1,2,:));
% fa = fcn_boxpts([sor2des_pre, sor2des_post],[],cmap0);
% set(gca,'xtick',1:2,'xticklabel',{'preT','postT'});
% set(gca,'FontName','Times New Roman','FontSize',10,'FontWeight','bold')
% ylabel('Transition prob.');
% title('')
% figure
% sor2des_pre = squeeze(mcPTR_pre(2,1,:));
% sor2des_post = squeeze(mcPTR_post(2,1,:));
% fa = fcn_boxpts([sor2des_pre, sor2des_post],[],cmap0);
% set(gca,'xtick',1:2,'xticklabel',{'preT','postT'});
% set(gca,'FontName','Times New Roman','FontSize',10,'FontWeight','bold')
% ylabel('Transition prob.');
% title('')
% figure
% sor2des_pre = squeeze(mcPTR_pre(2,6,:));
% sor2des_post = squeeze(mcPTR_post(2,6,:));
% fa = fcn_boxpts([sor2des_pre, sor2des_post],[],cmap0);
% set(gca,'xtick',1:2,'xticklabel',{'preT','postT'});
% set(gca,'FontName','Times New Roman','FontSize',10,'FontWeight','bold')
% ylabel('Transition prob.');
% title('')
% figure
% sor2des_pre = squeeze(mcPTR_pre(2,7,:));
% sor2des_post = squeeze(mcPTR_post(2,7,:));
% fa = fcn_boxpts([sor2des_pre, sor2des_post],[],cmap0);
% set(gca,'xtick',1:2,'xticklabel',{'preT','postT'});
% set(gca,'FontName','Times New Roman','FontSize',10,'FontWeight','bold')
% ylabel('Transition prob.');
% title('')
% figure
% sor2des_pre = squeeze(mcPTR_pre(4,7,:));
% sor2des_post = squeeze(mcPTR_post(4,7,:));
% fa = fcn_boxpts([sor2des_pre, sor2des_post],[],cmap0);
% set(gca,'xtick',1:2,'xticklabel',{'preT','postT'});
% set(gca,'FontName','Times New Roman','FontSize',10,'FontWeight','bold')
% ylabel('Transition prob.');
% title('')
% figure
% sor2des_pre = squeeze(mcPTR_pre(7,1,:));
% sor2des_post = squeeze(mcPTR_post(7,1,:));
% fa = fcn_boxpts([sor2des_pre, sor2des_post],[],cmap0);
% set(gca,'xtick',1:2,'xticklabel',{'preT','postT'});
% set(gca,'FontName','Times New Roman','FontSize',10,'FontWeight','bold')
% ylabel('Transition prob.');
% title('')
% figure
% sor2des_pre = squeeze(mcPTR_pre(8,6,:));
% sor2des_post = squeeze(mcPTR_post(8,6,:));
% fa = fcn_boxpts([sor2des_pre, sor2des_post],[],cmap0);
% set(gca,'xtick',1:2,'xticklabel',{'preT','postT'});
% set(gca,'FontName','Times New Roman','FontSize',10,'FontWeight','bold')
% ylabel('Transition prob.');
% title('')
% figure
% sor2des_pre = squeeze(mcPTR_pre(10,6,:));
% sor2des_post = squeeze(mcPTR_post(10,6,:));
% fa = fcn_boxpts([sor2des_pre, sor2des_post],[],cmap0);
% set(gca,'xtick',1:2,'xticklabel',{'preT','postT'});
% set(gca,'FontName','Times New Roman','FontSize',10,'FontWeight','bold')
% ylabel('Transition prob.');
% title('')