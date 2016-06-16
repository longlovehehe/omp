{strip}
<h2 class="title">{"迁移{$smarty.session.ident}-Server"|L}</h2>
<div class="info lineheight25">
    <div class="block ">
        <label class="title">{"企业ID"|L}：</label>
        <span>{$data.e_id}</span>
    </div>

    <div class="block ">
        <label class="title">{"企业名称"|L}：</label>
        <span>{$data.e_name}</span>
    </div>

    <div class="block ">
        <label class="title">{"所属区域"|L}：</label>
        <span>{$data.e_area|mod_area_name}</span>
    </div>
    <div class="block ">
        <label class="title">{"当前企业分配的用户数"|L}：</label>
        <span class="cur_e_mds_users">{$data.e_mds_users|default: 0}</span>
    </div>
    <div class="block none">
        <label class="title">{"当前企业分配的并发数"|L}：</label>
        <span class="cur_e_mds_call">{$data.e_mds_call|default: 0}</span>
    </div>
    <div class="block ">
        <label class="title">{"当前企业分配的手机用户数"|L}：</label>
        <span class="cur_e_mds_phone">{$data.e_mds_phone|default: 0}</span>
    </div>
    <div class="block ">
        <label class="title">{"当前企业分配的调度台用户数"|L}：</label>
        <span class="cur_e_mds_dispatch">{$data.e_mds_dispatch|default: 0}</span>
    </div>
    <div class="block ">
        <label class="title">{"当前企业分配的GVS用户数"|L}：</label>
        <span class="cur_e_mds_gvs">{$data.e_mds_gvs|default: 0}</span>
    </div>
</div>

<form id="form" class="base mrbt10">
    <input autocomplete="off"  value="{$data.e_id}" name="e_id" type="hidden" />
    <input autocomplete="off"  value="{$data.e_create_name}" name="e_create_name" type="hidden" />
    <div class="block ">
        <label class="title">{"原{$smarty.session.ident}-Server"|L}</label>
        <span>{$data.mds_d_ip1}</span>
        <div class="data none" id="cur_e_mds_id">{$data.e_mds_id}</div>
    </div>
    <div class="block">
        <label class="title">{"企业区域"|L}：</label>
        <select name="e_area" class="autofix autoselect" action="?m=area&a=option_create&e_id={$data.e_id}" selected="true"  data='[{ "to": "e_mds_id","field": "d_area","view":"false" }]'>
            <option value='@'>{"未选择"|L}</option>
        </select>
    </div>
    <div class="block ">
        <label class="title">{"新的{$smarty.session.ident}-Server地址"|L}</label>
        <select id="e_mds_id" name="new_mds_id" new_mds_id="true" class=" long " size="10" action="?m=device&a=mds_option&d_deployment_id={$data.d_deployment_id}" selected="true" digits ="true"></select>
        <span class="mds_error none">{"该设备可用用户数少于目前企业用户数，无法迁移，请选择其他设备"|L}</span>
    </div>
    <div class="buttons mrtop40">
        <a id="move_mds" class="button green">{"迁移{$smarty.session.ident}-Server"|L}</a>
        <a href="?m=enterprise&a=view&e_id={$data.e_id}" class="button">{"取消"|L}</a>
    </div>
</form>
<div id="dialog-confirm" class="hide" title="{'操作确认'|L}">
    <p>{"确定要迁移吗"|L}？</p>
</div>

<script>
   
    (function () {
        var url = $("select#e_mds_id").attr("action");
        url += "&d_area=@";
        $.ajax({
            url: url,
            success: function (result) {
                $("select#e_mds_id").html(result);
            }
        });
    })();

    var phone_num = $("div.block span.cur_e_mds_phone").text();
    var dispatch_num = $("div.block span.cur_e_mds_dispatch").text();
    var gvs_num = $("div.block span.cur_e_mds_gvs").text();
    var sub = true;
    $("select#e_mds_id").bind("change", function () {
        var e_mds_id = $(this).children('option:selected').val();
        var select_e_mds_id = $("#cur_e_mds_id").html();
        var d_user = $(this).children('option:selected').attr("d_user");
        /*var d_call = $(this).children('option:selected').attr("d_call");*/
        var diff_phone = $(this).children('option:selected').attr("diff_phone");
        var diff_dispatch = $(this).children('option:selected').attr("diff_dispatch");
        var diff_gvs = $(this).children('option:selected').attr("diff_gvs");
        if (e_mds_id != select_e_mds_id) {
            if (diff_phone - phone_num < 0) {
                $("div.block span.mds_error").removeClass("none");
                sub = false;
            } else if (diff_dispatch - dispatch_num < 0) {
                $("div.block span.mds_error").removeClass("none");
                sub = false;
            } else if (diff_gvs - gvs_num < 0) {
                $("div.block span.mds_error").removeClass("none");
                sub = false;
            } else {
                $("div.block span.mds_error").addClass("none");
                sub = true;
            }
        }else{
                $("div.block span.mds_error").addClass("none");
                sub = true;
        }
        $("#form").valid();
    });

    $("#move_mds").click(function () {
        if ($("#form").valid()) {
       var flag = false;
                var cur_e_mds_users = parseInt($(".cur_e_mds_users").text());
                var sel_e_mds_users = parseInt($("select[name=new_mds_id] option:selected").attr("d_user"));
                var cur_e_mds_call = parseInt($(".cur_e_mds_call").text());
                var sel_e_mds_call = parseInt($("select[name=new_mds_id] option:selected").attr("d_call"));
                var cur_e_mds_phone = parseInt($(".cur_e_mds_phone").text());
                var sel_e_mds_phone = parseInt($("select[name=new_mds_id] option:selected").attr("diff_phone"));
                var cur_e_mds_dispatch = parseInt($(".cur_e_mds_dispatch").text());
                var sel_e_mds_dispatch = parseInt($("select[name=new_mds_id] option:selected").attr("diff_dispatch"));
                var cur_e_mds_gvs = parseInt($(".cur_e_mds_gvs").text());
                var sel_e_mds_gvs = parseInt($("select[name=new_mds_id] option:selected").attr("diff_gvs"));
                if ($("#e_mds_id").val() != $("#cur_e_mds_id").text()) {
                if (cur_e_mds_users > sel_e_mds_users || cur_e_mds_phone>sel_e_mds_phone || cur_e_mds_dispatch>sel_e_mds_dispatch || cur_e_mds_gvs>sel_e_mds_gvs) {
                     notice("{"迁移到的{$smarty.session.ident}-Server可用用户数比当前企业用户数小，无法迁移，如果没有这么多用户，请尝试减少用户数"|L}");
                flag = true;
    }

    /*
     if (cur_e_mds_call > sel_e_mds_call) {
     notice("迁移到的{$smarty.session.ident}-Server可用并发数比当前企业并发数小，无法迁移");
     $flag = true;
     }*/
    }
    if (!flag) {
    $("#dialog-confirm").dialog({
    resizable: false,
            height: 180,
            modal: true,
            buttons: {
            "{"迁移"|L}": function () {
            $(this).dialog("close");
                    if (sub == false) {
            return false;
            }
            notice("{"正在操作中"|L}");
                    $.ajax({
                    url: "?modules=enterprise&action=move_mds_item",
                            data: $("#form").serialize(),
                            dataType: "json",
                            success: function (result) {
                            if (result.status == 0) {
                            notice(result.msg, '?m=enterprise&a=view&e_id={$data.e_id}');
                            } else {
                            notice(result.msg);
                            }

                            }
                    });
            },
                    "{"取消"|L}": function () {
                    $(this).dialog("close");
                    }
            }
    });
    }
    }
    });
</script>
{/strip}