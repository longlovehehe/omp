
{strip}
{foreach name=list item=item from=$list}
<tr class="gp_line" {if $item.u_number eq $info.c_pg_creater_num}style="color:#A43838;"{/if}>
    <td style="padding: 0px;display:inline;" class="linebr"><div style="width:30px;"><div class="total none">{$total}</div></div></td>
    <td title="{$item.u_name}" style="padding: 0px 5px;" class="linebr title"><div style="width:115px;">{if mb_strlen($item.u_name)<=12}{$item.u_name}{else}{$item.u_name|truncate: 12:''}... {/if}</div></td>
    <td style="padding: 0px 5px;" class="linebr"><div style="width:60px;" >{if substr($item.u_number,6,1) ==7}{4|modwordtype}{else}{$item.u_sub_type|modwordtype}{/if}</div></td>
    <td style="padding: 0px 5px;" class="linebr"><div style="width:140px;">{$item.u_number}</div></td>
    <td style="padding: 0px 5px;" class="linebr" title='{$item.ug_name}'><div style="width:250px;">{if mb_strlen($item.ug_name)<=5}{$item.ug_name}{else}{$item.ug_name|truncate: 5:''}... {/if}</div></td>
</tr>
    {foreachelse}<tr class="none"></tr>{/foreach}
    {/strip}


