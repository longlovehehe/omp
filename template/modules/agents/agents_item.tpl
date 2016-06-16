{strip}
<form class="data">
    <table class="base full">
        <tr class='head'>
            <th width="20px"><input autocomplete="off"  type="checkbox" id="checkall" /></th>
            <th width="80px">{"编号"|L}</th>
            {*<th width="80px">{"登陆帐号"|L}</th>*}
            <th width="120px">{"代理商名称"|L}</th>
            <th width="50px">{"详情"|L}</th>
            {*
            <th width="70px">{"联系人姓名"|L}</th>
            <th width="100px">{"电话"|L}</th>
            <th width="100px">{"邮箱"|L}</th>
            *}
            <th width="100px">{"区域"|L}</th>
            <th width="100px">{"用户总数"|L}</th>
            {*
            <th width="70px">{"手机用户数"|L}</th>
            <th width="70px">{"调度台用户数"|L}</th>
            <th width="70px">{"GVS用户数"|L}</th>
            *}
            <th width="60px">{"级别"|L}</th>
            <th width="60px">{"操作"|L}</th>
        </tr>
        {foreach name=list item=item from=$list}
        <tr >
            <td><input autocomplete="off"  type="checkbox" name="checkbox[]" {if $item.stat eq 1 }disabled{else}{/if} {if $item.ag_level eq 0}{else}disabled{/if} value="{$item.ag_number}" class="cb" /></td>
            <td>{$item.ag_number}</td>
            {*<td>{$item.ag_id}</td>*}
            <td title="{$item.ag_name}">{if mb_strlen($item.ag_name)<=7}{$item.ag_name}{else}{$item.ag_name|truncate: 7:''}... {/if}</td>
            <td class="rich"><a  title="{'联系人姓名'|L}: 【{$item.ag_conname} {$item.ag_username}】<br />{'电话'|L}: 【{$item.ag_phone|default:0}】<br />{'邮箱'|L}: 【{$item.ag_mail|default:0}】<br />" class="link tips_title"><img src='images/pic_06.png'></a></td>
            <td><span class="ellipsis" style="width: 60px"  {if $item.ag_level eq 0}{else}disabled{/if}>{$item.ag_area|mod_area_name:option}</span></td>
            <td title="{'手机用户数'|L}: 【{$item.ag_phone_num}】<br />{'调度台用户数'|L}: 【{$item.ag_dispatch_num}】<br />{'GVS用户数'|L}: 【{$item.ag_gvs_num}】">{$item.ag_phone_num+$item.ag_dispatch_num+$item.ag_gvs_num}</td>
            {*
            <td>{$item.ag_phone_num}</td>
            <td>{$item.ag_dispatch_num}</td>
            <td>{$item.ag_gvs_num}</td>
            *}
            <td title="【{'创建者'|L}: {$item.ag_parent_id|getompman}】">{$item.ag_level|getaglevel}</td>
            <td>
                {if $item.ag_level eq 0}
                <a  href="?m=agents&a=agents_save&ag_number={$item.ag_number}&do=edit" class="link">{"编辑"|L}</a>
                {else}
                <a  href="javascript:void(0);" class="link dis">{"编辑"|L}</a>
                {/if}

            </td>
        </tr>
        {/foreach}
    </table>


    {if $list!=NULL}
    <div class="page none_select">
        <div class="num">{$numinfo}</div>
        <div class="turn">
            <a page="{$prev}" class="prev">{"上一页"|L}</a>
            <a page="{$next}" class="next">{"下一页"|L}</a>
        </div>
    </div>
</form>
{/if}
{/strip}