<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<s:if test="!embedded"> 
	<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
		<TR>
		    <TD class="boxFooter"><IMG  height="4" alt="" src="<qs2:imagesPath framework="true" />" width="1"></TD>
		</TR>
		<TR>
		    <TD class="footer"><A  href="http://www.quix.it">Project by QUIX S.r.l.</A></TD>
		</TR>
	</TABLE>
</s:if>   