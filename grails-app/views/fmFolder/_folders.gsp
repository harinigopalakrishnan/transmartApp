<g:set var="ts" value="${Calendar.instance.time.time}" />

<div class="search-results-table">
	<g:each in="${folders}" status="ti" var="folder">        
		<table class="folderheader" name="${folder.objectUid}">
			<tr>
				<td class="foldertitle">
					<span>
						<a id="toggleDetail_${folder.id}" href="#" onclick="toggleDetailDiv('${folder.id}', '${createLink(controller:'fmFolder',action:'getFolderContents',params:[id:folder.id])}');">
							<img alt="expand/collapse" id="imgExpand_${folder.id}" src="${resource(dir:'images',file:'folderplus.png')}" />
							<img alt="" src="${resource(dir:'images',file:'folder.png')}" />
						</a>
					</span>
					<a href="#" onclick="showDetailDialog('${createLink(controller:'experimentAnalysis',action:'expDetail',id:folder.objectUid)}');">
						<span class="result-folder-name"> ${folder.folderName}</span>
					</a>
				</td>
				<%--
				<td class="foldericons">
					<div class="foldericonwrapper" style="display: none;">
						<span class="foldericon view">View metadata</span>
						<span class="foldericon add">Add to export</span>
					</div>
				</td>
				--%>
			</tr>
		</table>
		<div id="${folder.id}_detail" name="${folder.id}" class="detailexpand"></div>
	</g:each>
	<%-- TODO This is unfinished. Don't display files here? Put them in a table in the metadata viewer --%>
	<g:each in="${files}" status="ti" var="file">
		<table class="folderheader" name="${file.id}" style="margin-left: 20px;">
			<tr>
				<td class="foldertitle">
					<span>
						<a id="toggleDetail_${file.id}" href="#" onclick="toggleDetailDiv('${file.id}', '${createLink(controller:'fmFolder',action:'getFolderContents',params:[id:file.id])}');">
							<span style="padding: 0px 16px 0px 0px"></span>
							<span class="fileicon ${file.fileType}"></span>
						</a>
					</span>
					<a href="#" onclick="showDetailDialog('${createLink(controller:'RWG',action:'getFileDetails',id:file.id)}');">
						<span class="result-file-name"> ${file.displayName}</span>
					</a>
				</td>
				<%-- 
				<td class="foldericons">
					<div class="foldericonwrapper" style="display: none;">
						<span class="foldericon viewfile">View file details</span>
						<span class="foldericon add">Add to export</span>
					</div>
				</td>
				--%>
			</tr>
		</table>
		<div id="${file.id}_filedetail" name="${file.id}" class="detailexpand"></div>
	</g:each>
</div>