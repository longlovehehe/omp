{foreach name=list item=item from=$list}
<tr>
    <td  style="width:20px; padding:8px 5px 8px 5px; ">
        <div><input onclick="getnum();" type="checkbox" name="checkbox[]" value="{$item.u_number}" class="cb" /><div>
                <div class="total none">{$total}</div>
                </td>
                <td  style="width:145px;" title="{$item.u_name}">
                    <div>{$item.u_name|mbsubstr:5}</div>
                </td>
                <td  style="width:40px;" title="{substr($item.u_number,6,1)}">
                    <div>{if substr($item.u_number,6,1) !=7}{$item.u_sub_type|modwordtype}{else}{4|modwordtype}{/if}</div>
                </td>
                <td>
                    <div style="width:90px;">{$item.u_number}</div>
                </td>
                <td class="rich group" title="{$item.ug_name}">
                    <div style="width: 180px;">{if mb_strlen($item.ug_name)<=5}{$item.ug_name}{else}{$item.ug_name|truncate: 5:''}... {/if}</div>
                </td>
                </tr>
                {foreachelse}{if $smarty.post.u_name !='' || $smarty.post.u_number !=''}none{else if}false{/if}{/foreach}
