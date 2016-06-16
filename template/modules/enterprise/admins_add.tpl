{strip}
<script src="script/plugins/intlTelInput.js"></script>
<h2 class="title">{"{$title}"|L}</h2>

<form id="form" class="base mrbt10" action="?modules=enterprise&action=admins_save">
    <input autocomplete="off"  value="{$data.e_id}" name="em_ent_id" type="hidden" />
    <input autocomplete="off"  value="{$data.e_id}" name="e_id" type="hidden" />
    <input autocomplete="off"  value="{$data.do}" name="do" type="hidden" />
    <div class="block">
        <label class="title">{"帐号"|L}：</label>
        {if $data.do eq "edit"}
        <input chinese="true" autocomplete="off"   maxlength="32" value="{$em_id}" name="em_id" type="text" required="true" readonly="true" />
        {else}
        <input chinese="true" autocomplete="off"    maxlength="32" name="em_id" type="text" required="true" />
        {/if}
    </div>
    <div class="block">
        <label class="title">{"密码"|L}：</label>
        <input autocomplete="off"  maxlength="32" em_pswd1="true" id="password" value="{$data.em_pswd}" name="em_pswd" type="password" required="true" />
        &nbsp;&nbsp;<label class="show_passwd" style="font-size: 12px;color: #a43838;">{"查看密码"|L}</label>
    </div>
    <div class="block">
        <label class="title">{"名字"|L}：</label>
       
       <input  maxlength="32" autocomplete="off" placeholder="{'名字'|L}" maxlength="32" value="{$data.em_admin_name}" chinese="true" name="em_admin_name" type="text"  required="true" />
    </div>
    <div class="block">
        <label class="title">{"姓氏"|L}：</label>
       <input  maxlength="32" autocomplete="off"  placeholder="{'姓氏'|L}" maxlength="32" value="{$data.em_surname}" chinese="true" name="em_surname" type="text"  required="true" />
    </div>

    <div class="block">
        <label class="title">{"手机号"|L}：</label>
        <input class="mobile-number" mobile1="true" type="text" style="height: 28px;width: 245px;border:1px solid #ccc;" name="em_phone" value="{$data.em_phone}" required="true"/>
        {*<input autocomplete="off"  maxlength="32" value="{$data.em_phone}" name="em_phone" type="text" required="true" mobile="true" />*}
    </div>
    <div class="block">
        <label class="title">{"邮箱"|L}：</label>
        <input autocomplete="off"  maxlength="32" value="{$data.em_mail}" name="em_mail" type="text" required="true"  email="true"  />
    </div>
    <div class="block none">
        <label class="title">{"安全登录"|L}：</label>
        <div class="checkbox inline" value="{$data.em_safe_login}">
            <input autocomplete="off"  name="em_safe_login" type="checkbox" />
        </div>
    </div>
    <div class="block">
        <label class="title">{"描述"|L}：</label>
        <input chinese="true" maxlength="1024" autocomplete="off" value="{$data.em_desc}" name="em_desc" type="text" />
    </div>

    <div class="buttons mrtop40">
        <a goto="?m=enterprise&a=view&e_id={$data.e_id}" form="form" class="ajaxpost button normal">{"保存"|L}</a>
        <a class="goback button">{"取消"|L}</a>
    </div>
</form>
{/strip}