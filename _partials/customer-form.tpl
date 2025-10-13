{extends "customer/_partials/customer-form.tpl"}

{block "form_field"}
  {if $field.name === 'password' and $guest_allowed}
      <p class="form-informations">
        <span class="font-weight-bold form-informations-title">
          {l s='Create an account' d='Shop.Theme.Checkout'}
        </span>
        <span class="font-italic form-informations-option">
          {l s='(optional)' d='Shop.Theme.Checkout'}
        </span>
        <br>
        <span class="text-muted form-informations-subtitle">
          {l s='And save time on your next order!' d='Shop.Theme.Checkout'}
        </span>
      </p>
      {$smarty.block.parent}
  {else}
    {$smarty.block.parent}
  {/if}
{/block}

{block "form_buttons"}
  <div class="text-right">
    <button
      class="continue btn btn-primary d-none d-md-inline-block"
      name="continue"
      data-link-action="register-new-customer"
      type="submit"
      value="1"
    >
        {l s='Continue' d='Shop.Theme.Actions'}
    </button>
    <button
      class="continue btn btn-primary btn-block d-block d-md-none"
      name="continue"
      data-link-action="register-new-customer"
      type="submit"
      value="1"
    >
        {l s='Continue' d='Shop.Theme.Actions'}
    </button>
  </div>
{/block}
