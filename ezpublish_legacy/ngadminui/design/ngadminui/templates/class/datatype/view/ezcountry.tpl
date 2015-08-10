{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<div class="block">
    <label>{'Multiple choice'|i18n( 'design/standard/class/datatype' )}:</label>
    <p>{$class_attribute.content.multiple_choice|choose( 'Unchecked'|i18n( 'design/standard/class/datatype' ), 'Checked'|i18n( 'design/standard/class/datatype' ) )}</p>
</div>

<div class="block">
    <label>{'Default selection'|i18n( 'design/standard/class/datatype' )}:</label>
    {foreach $class_attribute.content.default_countries as $country}
         <p>{$country.Name}</p>
    {/foreach}
</div>

