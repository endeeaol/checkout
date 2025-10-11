{block name="step_content"}
<div class="row pt-4 pb-4">

    {* === LEWA KOLUMNA: PRZEŁĄCZNIK I FORMULARZE (WERSJA UIKIT) === *}
    <div class="col-md-7">

        {* KROK 1: Tworzymy nawigację zakładek w stylu UIkit.
           Atrybut uk-tab="animation: uk-animation-fade" odpowiada za efekt przejścia. *}
        <ul class="uk-tab" uk-tab="animation: uk-animation-fade">
            {* Warunek `{if !$show_login_form}` sprawia, że ta zakładka jest aktywna domyślnie *}
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

        {* KROK 2: Tworzymy kontener na przełączaną treść *}
        <ul class="uk-switcher uk-margin">

            {* -- ZAWARTOŚĆ 1: Formularz logowania -- *}
            <li>
                {render file='customer/_partials/login-form.tpl' ui=$login_form}
            </li>

            {* -- ZAWARTOŚĆ 2: Formularz gościa/rejestracji -- *}
            <li>
                {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
            </li>

        </ul>
    </div>

    {* === PRAWA KOLUMNA: KORZYŚCI I PRZYCISK REJESTRACJI (BEZ ZMIAN) === *}
    <div class="col-md-5">
        <div class="card">
            <div class="card-body text-center">
                <h3 class="h3">{l s='Benefits of creating an account' d='Shop.Theme.Checkout'}</h3>
                <ul class="list-unstyled mt-3 text-left">
                    <li class="mb-2"><i class="material-icons text-success mr-2 align-middle">&#xE876;</i> {l s='Even faster shopping' d='Shop.Theme.Checkout'}</li>
                    <li class="mb-2"><i class="material-icons text-success mr-2 align-middle">&#xE876;</i> {l s='History and tracking of orders' d='Shop.Theme.Checkout'}</li>
                    <li class="mb-2"><i class="material-icons text-success mr-2 align-middle">&#xE876;</i> {l s='Special discounts and promotions' d='Shop.Theme.Checkout'}</li>
                </ul>
                <hr>
                <a href="{$urls.pages.registration}" class="btn btn-primary btn-block mt-3">
                    {l s='Create an account' d='Shop.Theme.Actions'}
                </a>
            </div>
        </div>
    </div>

</div>
{/block}