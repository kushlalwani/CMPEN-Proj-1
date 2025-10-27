function confusions()
    S = load('eval_results.mat'); 
    C = S.C;
    if isfield(S,'classlabels') && iscell(S.classlabels) && numel(S.classlabels)==10
        labels = S.classlabels;
    else
        labels = arrayfun(@(k)sprintf('C%d',k),1:size(C,1),'UniformOutput',false);
    end
    rowSums = sum(C,2);
    Cnorm = C ./ max(rowSums,1);

    opengl software; set(0,'DefaultFigureVisible','on');

    % --- Counts (annotated) ---
    figure(771); clf; set(gcf,'Renderer','painters','Position',[120 120 800 700]);
    imagesc(C); axis image; colorbar; colormap parula;
    title('Confusion Matrix (Counts)'); xlabel('Predicted'); ylabel('True');
    set(gca,'XTick',1:10,'YTick',1:10,'XTickLabel',labels,'YTickLabel',labels); xtickangle(45);
    annotate_cells(C,'count');
    drawnow; exportgraphics(gcf,'confusion_counts.png','Resolution',200);

    % --- Row-normalized (annotated %) ---
    figure(772); clf; set(gcf,'Renderer','painters','Position',[140 140 800 700]);
    imagesc(Cnorm,[0 1]); axis image; colorbar; colormap parula;
    title('Confusion Matrix (Row-Normalized)'); xlabel('Predicted'); ylabel('True');
    set(gca,'XTick',1:10,'YTick',1:10,'XTickLabel',labels,'YTickLabel',labels); xtickangle(45);
    annotate_cells(Cnorm,'percent');
    drawnow; exportgraphics(gcf,'confusion_normalized.png','Resolution',200);
end

function annotate_cells(M, mode)
    ax = gca; clim = ax.CLim; mid = mean(clim);
    for i = 1:size(M,1)
        for j = 1:size(M,2)
            if strcmp(mode,'percent')
                txt = sprintf('%.1f%%', 100*M(i,j));
                bgVal = clim(1) + M(i,j)*(clim(2)-clim(1)); % M in [0,1]
            else
                txt = sprintf('%d', M(i,j));
                bgVal = M(i,j);
            end
            color = 'w'; if bgVal > mid, color = 'k'; end
            text(j,i,txt,'HorizontalAlignment','center','FontSize',8,'FontWeight','bold','Color',color);
        end
    end
end