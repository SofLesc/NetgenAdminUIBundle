

        {include uri='design:page_aside_user.tpl'}

        <div class="navi-wrap">
          <!-- user -->
          <div class="clearfix hidden-xs text-center hide" id="aside-user">

          </div>
          <!-- / user -->

          <!-- nav -->
          <nav ui-nav="" class="navi clearfix">
            <ul class="nav dk">
              <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                <span>Navigation</span>
              </li>

              {def $liclass='unselected '}
              {def $icon='unselected '}
              {foreach topmenu($ui_context, true() ) as $index => $menu_item}


                  {switch match=$menu_item.url}

                      {case match='content/dashboard'}
                          {set $icon='fa fa-tachometer'}
                      {/case}
                      {case match='content/view/full/2'}
                          {set $icon='fa fa-sitemap'}
                      {/case}
                      {case match='content/view/full/43'}
                          {set $icon='fa fa-picture-o'}
                      {/case}
                      {case match='content/view/full/5'}
                          {set $icon='fa fa-user'}
                      {/case}
                      {case match='setup/cache'}
                          {set $icon='fa fa-cog'}
                      {/case}
                      {case match='ezfind/elevate'}
                          {set $icon='fa fa-cubes'}
                      {/case}
                      {case match='tags/dashboard'}
                          {set $icon='glyphicon glyphicon-tags'}
                      {/case}
                      {case}
                          {set $icon='glyphicon glyphicon-file'}
                      {/case}

                  {/switch}


                  {set $liclass=' '}
                  {if eq( $navigation_part.identifier, $menu_item.navigationpart_identifier ) }
                      {set $liclass='active '}
                  {/if}

                  <li class="{$liclass}{$menu_item.position} {$menu_item.navigationpart_identifier}">
                    {if and( $menu_item.enabled, or( is_unset( $menu_item.access ), $menu_item.access ) )}
                      <a href={$menu_item.url|ezurl} title="{$menu_item.tooltip}">
                    {else}
                      <a href="#">
                    {/if}
                    <i class="{$icon}"></i>
                      <span{if $index|lt(3)} class="font-bold"{/if}>{$menu_item.name|wash}</span>
                    </a>
                  </li>

              {/foreach}
              {undef $liclass $icon}

              <li class="dropdown">
                <a href="#" data-toggle="dropdown" class="dropdown-toggle">
                  <i class="fa fa-refresh"></i>
                  <span>Cache</span>
                  <span class="caret"></span>
                </a>
                <ul class="dropdown-menu animated fadeInLeft w hidden-folded">
                    <li class="wrapper m-b-sm m-t-n-xs">
                    <span class="arrow top hidden-folded"></span>
                    {tool_bar name='admin_developer' view='full'}
                    </li>
                </ul>
              </li>





              </ul>

              <ul class="nav">

              <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                <span>Netgen More Components</span>
              </li>

              <li>
                <a href="ui_chart.html">
                  <i class="fa fa-credit-card"></i>
                  <span>Sylius E-Commerce</span>
                </a>
              </li>

              <li>
                <a href="" class="auto">
                  <span class="pull-right text-muted">
                    <i class="fa fa-fw fa-angle-right text"></i>
                    <i class="fa fa-fw fa-angle-down text-active"></i>
                  </span>
                  <i class="glyphicon glyphicon-th"></i>
                  <span>Blocks</span>
                </a>
              </li>
              <li>
                <a href="" class="auto">
                  <span class="pull-right text-muted">
                    <i class="fa fa-fw fa-angle-right text"></i>
                    <i class="fa fa-fw fa-angle-down text-active"></i>
                  </span>
                  <i class="fa fa-columns icon"></i>
                  <span>Zones Builder</span>
                </a>
              </li>

              <li>
                <a href="ui_chart.html">
                  <i class="fa fa-bar-chart"></i>
                  <span>Social Stats</span>
                </a>
              </li>

              <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                <span>Your Stuff</span>
              </li>
              <li>
                <a href="page_profile.html">
                  <i class="fa fa-bookmark"></i>
                  <span>Bookmarks</span>
                </a>
              </li>
              <li>
                <a href="page_profile.html">
                  <i class="fa fa-comments text-success-lter"></i>
                  <b class="badge bg-success pull-right">7</b>
                  <span>Activity</span>
                </a>
              </li>

              <li class="line dk hidden-folded"></li>

              <li>
                <a href="">
                  <i class="icon-question icon"></i>
                  <span>Documentation</span>
                </a>
              </li>

              <li>
              {if $ui_context_edit}
                  <i class="fa fa-sign-out"></i>
                  <span title="{'Logout from the system.'|i18n( 'design/admin/pagelayout' )}" class="disabled">Logout</span></li>
              {else}
                  <a href={'/user/logout'|ezurl} title="{'Logout from the system.'|i18n( 'design/admin/pagelayout' )}">
                  <i class="fa fa-sign-out"></i>
                  <span>Logout</span>
                  </a>
              {/if}
              </li>

            </ul>
          </nav>
          <!-- nav -->

        </div>

