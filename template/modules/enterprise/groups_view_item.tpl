
{strip}
<form class="table">
    <table class="base full">
        <tr class='head'>
            <th width="50px"><input autocomplete="off"  type="checkbox" id="checkall" />{"全选"|L}</th>
            <th>{"成员号码"|L}</th>
            <th width="100px">{"成员级别"|L}</th>
            <th width="100px">{"操作"|L}</th>
        </tr>
        {foreach name=list item=item from=$list}
        <tr>
            <td><input autocomplete="off"  type="checkbox" name="checkbox[]" value="{$item.pm_number}" class="cb" /></td>
            <td>{$item.pm_number}</td>
            <td>{$item.pm_level}</td>
            <td><a class="link" href="?m=enterprise&a=groups_view_edit&e_id={$data.e_id}&pm_pgnumber={$item.pm_pgnumber}&pm_number={$item.pm_number}&do=edit">编辑</a></td>
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
{/strip}
{/if}