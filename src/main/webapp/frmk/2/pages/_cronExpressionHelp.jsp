<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="qs2" uri="/quix-strut2-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="qmodal-body" >
	<div class="qmodal-title">
		<i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;Campi e valori permessi nelle Cron Expression
	</div>
	<table class="qtable qtable-hover">
		<thead>
			<tr>
				<th style="text-align: left;">Nome</th>
				<th style="text-align: left;">Richiesto</th>
				<th style="text-align: left;">Valori permessi</th>
				<th style="text-align: left;">Caratteri speciali permessi</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="text-align: left;">Secondi</td>
				<td style="text-align: left;"><i class="fa fa-check" aria-hidden="true"></i></td>
				<td style="text-align: left;">0-59</td>
				<td style="text-align: left;">, - * /</td>
			</tr>
			<tr>
				<td style="text-align: left;">Minuti</td>
				<td style="text-align: left;"><i class="fa fa-check" aria-hidden="true"></i></td>
				<td style="text-align: left;">0-59</td>
				<td style="text-align: left;">, - * /</td>
			</tr>
			<tr>
				<td style="text-align: left;">Ore</td>
				<td style="text-align: left;"><i class="fa fa-check" aria-hidden="true"></i></td>
				<td style="text-align: left;">0-23</td>
				<td style="text-align: left;">, - * /</td>
			</tr>
			<tr>
				<td style="text-align: left;">Giorno del mese</td>
				<td style="text-align: left;"><i class="fa fa-check" aria-hidden="true"></i></td>
				<td style="text-align: left;">1-31</td>
				<td style="text-align: left;">, - * ? / L W C</td>
			</tr>
			<tr>
				<td style="text-align: left;">Mese</td>
				<td style="text-align: left;"><i class="fa fa-check" aria-hidden="true"></i></td>
				<td style="text-align: left;">0-11 or JAN-DEC</td>
				<td style="text-align: left;">, - * /</td>
			</tr>
			<tr>
				<td style="text-align: left;">Giorno della settimana</td>
				<td style="text-align: left;"><i class="fa fa-check" aria-hidden="true"></i></td>
				<td style="text-align: left;">1-7 or SUN-SAT</td>
				<td style="text-align: left;">, - * ? / L C #</td>
			</tr>
			<tr>
				<td style="text-align: left;">Anno</td>
				<td style="text-align: left;"><i class="fa fa-times" aria-hidden="true"></i></td>
				<td style="text-align: left;">vuoto or 1970-2099</td>
				<td style="text-align: left;">, - * /</td>
			</tr>
		</tbody>
	</table>
	<div class="qmodal-title">
		<i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;Esempi di Cron expression
	</div>
	<div class="qmodal-body">
		<table class="qtable qtable-hover">
			<thead>
				<tr>
					<th style="text-align: left;">Espressione</th>
					<th style="text-align: left;">Significato</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align: left;">* * * * * ? *</td>
					<td style="text-align: left;">Gira ogni secondo</td>
				</tr>
				<tr>
					<td style="text-align: left;">0 15 10 * * ? 2005</td>
					<td style="text-align: left;">Gira alle 10:15 AM tutti i giorni durante l'anno 2005</td>
				</tr>
				<tr>
					<td style="text-align: left;">0 * 14 * * ?</td>	
					<td style="text-align: left;">Gira ogni minuto dalle 2:00 PM alle 2:59 PM, ogni giorno</td>
				</tr>
				<tr>
					<td style="text-align: left;">0 0/5 14 * * ?</td>
					<td style="text-align: left;">Gira ogni 5 minuti dalle 2:00 PM alle 2:55 PM, ogni giorno</td>
				</tr>
				<tr>
					<td style="text-align: left;">0 15 10 ? JAN 6L 2002-2005</td>
					<td style="text-align: left;">Gira alle 10:15 AM ultimo venerdi dei mesi di gennaio degli anni 2002, 2003, 2004 e 2005</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>