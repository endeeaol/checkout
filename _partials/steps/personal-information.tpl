{block name="step_content"}
<div class="row g-3 pt-4 pb-4">
    
    <div class="col-md-7 p-4">
        <ul class="uk-tab" uk-tab="animation: uk-animation-fade">
            <li class="{if !$show_login_form}uk-active{/if}">
                <a href="#">{l s='Sign in' d='Shop.Theme.Actions'}</a>
            </li>
            <li class="{if $show_login_form}uk-active{/if}">
                <a href="#">
                    {if $guest_allowed}
                        {l s='Order as a guest' d='Shop.Theme.Checkout'}
                    {else}
                        {l s='Create an account' d='Shop.Theme.Customeraccount'}
                    {/if}
                </a>
            </li>
        </ul>

        <ul class="uk-switcher uk-margin" id="form-switcher">
            {* -- ZAWARTOŚĆ 1: Formularz logowania -- *}
			<li id="checkout-login-form">
                {render file='customer/_partials/login-form.tpl' ui=$login_form}
            </li>
            {* -- ZAWARTOŚĆ 2: Formularz gościa/rejestracji -- *}
            <li id="checkout-guest-form">
                {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
            </li>
        </ul>
    </div>

    {* === PRAWA KOLUMNA: KORZYŚCI I PRZYCISK REJESTRACJI (BEZ ZMIAN) === *}
    <div class="col-md-5">
        <div class="card bggray100 corner8 p-2">
            <div class="card-body text-center">
                <h5 class="h5 strong text-left">{l s='Benefits of creating an account' d='Shop.Theme.Checkout'}</h5>
                <ul class="list-unstyled mt-3 text-left">
                    <li class="mb-3 ui"><span class="colorgreen pe-1" uk-icon="icon: clock"></span> {l s='Even faster shopping' d='Shop.Theme.Global'}</li>
                    <li class="mb-3 ui"><span class="colorgreen pe-1" uk-icon="icon: list"></span>  {l s='History and tracking of orders' d='Shop.Theme.Global'}</li>
                    <li class="mb-3 ui"><span class="colorgreen pe-1" uk-icon="icon: tag"></span>  {l s='Special discounts and promotions' d='Shop.Theme.Global'}</li>
					<li class="mb-3 ui"><span class="colorgreen pe-1" uk-icon="icon: mail"></span>  {l s='Newsletter bogaty w wiedzę' d='Shop.Theme.Global'}</li>
                </ul>
                <hr>
                <a href="{$urls.pages.registration}" class="btn btn-secondary outline btn-block mt-3">
                    {l s='Create an account' d='Shop.Theme.Actions'}
                </a>
            </div>
        </div>
    </div>

</div>
{/block}