{* DO NOT EDIT THIS FILE! Use an override template instead. *}

{* Default value. *}
<div class="block">
    <label>{'Default value'|i18n( 'design/standard/class/datatype' )}:</label>
    <input class="form-control" type="text" name="ContentClass_ezstring_default_value_{$class_attribute.id}" value="{$class_attribute.data_text1|wash}" size="30" maxlength="50" />
</div>

{* Maximum string length. *}
<div class="block">
    <label>{'Max string length'|i18n( 'design/standard/class/datatype' )}:</label>
    <input type="text" class="form-control" name="ContentClass_ezstring_max_string_length_{$class_attribute.id}" value="{$class_attribute.data_int1}" size="5" maxlength="5" />&nbsp;{'characters'|i18n( 'design/standard/class/datatype' )}
</div>
