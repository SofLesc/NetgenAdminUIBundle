{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{let page_limit=15
     package_list=fetch( package, list,
                         hash( offset, $view_parameters.offset,
                               limit, $page_limit,
                               repository_id, $repository_id ) )
     repository_list=fetch( package, repository_list )
     can_remove=fetch( package, can_remove )}
<form name="packagelist" method="post" action={concat('package/list', $view_parameters.offset|gt(0)|choose('', concat('/offset/',$view_parameters.offset)))|ezurl}>

        {* ## START messages ## *}
    {section show=$remove_list}

        {* DESIGN: Header START *}
        <div class="box-header">

            <h1 class="context-title">{'Remove section?'|i18n( 'design/admin/package/list' )}</h1>

            {* DESIGN: Mainline *}<div class="header-mainline"></div>

            {* DESIGN: Header END *}
        </div>

        {* DESIGN: Content START *}
        <div class="box-content panel">

            <div class="message-confirmation">

                <h2>{'Removal of packages'|i18n('design/admin/package/list')}</h2>
                <p>{'Are you sure you want to remove the following packages?
                The packages will be lost forever.
                Note: The packages will not be uninstalled.'|i18n('design/admin/package/list')|break}</p>
                <ul>
                {section var=package loop=$remove_list}
                    <li>
                        <input type="hidden" name="PackageSelection[]" value="{$package.name|wash}" />
                        {$package.name|wash} ({$package.summary|wash})
                    </li>
                {/section}
                </ul>

            </div>

            {* DESIGN: Content END *}

            <div class="controlbar">

                {* DESIGN: Control bar START *}
                    <input class="btn btn-primary" type="submit" name="ConfirmRemovePackageButton" value="{'Remove'|i18n('design/admin/package/list')}" />
                    <input class="btn btn-default" type="submit" name="CancelRemovePackageButton" value="{'Cancel'|i18n('design/admin/package/list')}" />
                {* DESIGN: Control bar END *}

            </div>

            {if $module_action|eq( 'CancelRemovePackage' )}
                <div class="message-feedback">
                    <h2>{'Package removal was canceled.'|i18n('design/admin/package/list')}</h2>
                </div>
            {/if}

        </div>
    {section-else}

        {* ## START default window ## *}

        {* DESIGN: Header START *}
        <div class="box-header">

            <h1 class="context-title">{'Packages'|i18n('design/admin/package/list')}</h1>

            {* DESIGN: Mainline *}<div class="header-mainline"></div>

        {* DESIGN: Header END *}
        </div>

        {* DESIGN: Content START *}
        <div class="box-content panel">

            <div class="context-attributes">

                <div class="block">
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <label>{'Change repository'|i18n( 'design/admin/package/list' )}:</label>
                            <div class="input-group">
                                <select class="form-control" name="RepositoryID">
                                    <option value="">{'All'|i18n( 'design/admin/package/list' )}</option>
                                    {section var=repository loop=$repository_list}
                                        <option value="{$repository.id|wash}"{if eq( $repository.id, $repository_id )} selected="selected"{/if}>{$repository.name|wash}</option>
                                    {/section}
                                </select>
                                <span class="input-group-btn">
                                    <input class="btn btn-default" type="submit" name="ChangeRepositoryButton" value="{'OK'|i18n( 'design/admin/package/list' )}" />
                                </span>
                            </div>
                        </div>
                    </div>
                </div>


                {section show=$package_list}
                <table class="list" width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <th class="tight"><i class="fa fa-check-square-o" onclick="ezjs_toggleCheckboxes( document.packagelist, 'PackageSelection[]' ); return false;" title="{'Invert selection.'|i18n( 'design/admin/package/list' )}"></i></th>
                        <th>{'Name'|i18n('design/admin/package/list')}</th>
                        <th>{'Version'|i18n('design/admin/package/list')}</th>
                        <th>{'Summary'|i18n('design/admin/package/list')}</th>
                        <th>{'Status'|i18n('design/admin/package/list')}</th>
                    </tr>
                    {section name=Package loop=$package_list sequence=array(bglight,bgdark)}
                    <tr class="{$:sequence}">
                        {if $can_remove}
                        <td width="1"><input type="checkbox" name="PackageSelection[]" value="{$:item.name|wash}"/></td>
                        {else}
                          <input type="checkbox" disabled="disabled">
                        {/if}
                        <td><a href={concat('package/view/full/',$:item.name)|ezurl}>{$:item.name|wash}</a></td>
                        <td>{$:item.version-number}-{$:item.release-number}{if $:item.release-timestamp}({$:item.release-timestamp|l10n( shortdatetime )}){/if}{if $:item.type} [{$:item.type|wash}]{/if}</td>
                        <td>{$:item.summary|wash}</td>
                        <td>
                            {if $:item.install_type|eq( 'install' )}
                                {if $:item.is_installed}
                                    {'Installed'|i18n('design/admin/package/list')}
                                {else}
                                    {'Not installed'|i18n('design/admin/package/list')}
                                {/if}
                            {else}
                                {'Imported'|i18n('design/admin/package/list')}
                            {/if}
                        </td>
                    </tr>
                    {/section}
                </table>
                {section-else}
                <p>{'There are no packages matching the selected repository.'|i18n( 'design/admin/package/list' )}</p>
                {/section}


            </div>
            {* DESIGN: Content END *}

            <div class="controlbar">
                {* DESIGN: Control bar START *}

                {let can_create=fetch( package, can_create )
                     can_import=fetch( package, can_import )}

                {if $package_list}
                    <input class="btn btn-default" type="submit" name="RemovePackageButton" value="{'Remove selected'|i18n('design/admin/package/list')}" {if and( $package_list|gt( 0 ), $can_remove )|not}disabled="disabled"{/if} />
                {else}
                    <input class="btn btn-default" type="submit" name="RemovePackageButton" value="{'Remove selected'|i18n('design/admin/package/list')}" disabled="disabled" />
                {/if}
                    <input class="btn btn-default" type="submit" name="InstallPackageButton" value="{'Import new package'|i18n('design/admin/package/list')}" {if $can_import|not}disabled="disabled"{/if}/>
                    <input class="btn btn-default" type="submit" name="CreatePackageButton" value="{'Create new package'|i18n('design/admin/package/list')}" {if $can_create|not}disabled="disabled"{/if} />
                </div>

                {/let}

                {* DESIGN: Control bar END *}
            </div>
        </div>

    {/section}

</form>

{/let}
