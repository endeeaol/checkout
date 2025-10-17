 
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  <div class="js-address-form">
    <form method="POST" data-id-address="{$id_address}" action="{url entity='order' params=['id_address' => $id_address]}" data-refresh-url="{url entity='order' params=['ajax' => 1, 'action' => 'addressForm']}" >

      {if $use_same_address}
        <p class="pt-2 pb-4 strong m-auto user-form--sm" style="border-top: 1px solid lightgray;">
          {if $cart.is_virtual}
            {l s='Address delivery and invoice.' d='Shop.Theme.Global'}
          {else}
            {l s='The selected Address delivery and invoice' d='Shop.Theme.Global'}
          {/if}
        </p>
      {else}
        <p class="strong">{l s='Shipping Address' d='Shop.Theme.Checkout'}</p>
      {/if}

      {if $show_delivery_address_form}
        <div id="delivery-address" class="user-form user-form--sm">
			<div class="form-group">
				<div class="custom-control custom-checkbox">
				  <input type="checkbox" class="custom-control-input" id="js-is-company-checkbox">
				  <label class="custom-control-label" for="js-is-company-checkbox">
					{l s='I am buying as a company' d='Shop.Theme.Global'}
				  </label>
				</div>
			</div>
			{render file = 'checkout/_partials/address-form.tpl'
			  ui = $address_form
			  use_same_address = $use_same_address
			  type = "delivery"
			  form_has_continue_button  = $form_has_continue_button
			}
        </div>
		
      {elseif $customer.addresses|count > 0}
		  
        <div id="delivery-addresses" class="address-selector js-address-selector row g-4">
          {include  file        = 'checkout/_partials/address-selector-block.tpl'
            addresses   = $customer.addresses
            name        = "id_address_delivery"
            selected    = $id_address_delivery
            type        = "delivery"
            interactive = !$show_delivery_address_form and !$show_invoice_address_form
          }
        </div>

        {if isset($delivery_address_error)}
          <p class="alert alert-danger js-address-error" name="alert-delivery" id="id-failure-address-{$delivery_address_error.id_address}">{$delivery_address_error.exception}</p>
        {else}
          <p class="alert alert-danger js-address-error" name="alert-delivery" style="display: none">{l s="Your address is incomplete, please update it." d="Shop.Notifications.Error"}</p>
        {/if}

        <div class="add-address mt-0 mb-3">
          <a class="btn btn-secondary outline btn-sm" href="{$new_address_delivery_url}">{l s='add new address' d='Shop.Theme.Actions'}</a>
        </div>

        {if $use_same_address && !$cart.is_virtual}
          <p>
            <a data-link-action="different-invoice-address" href="{$use_different_address_url}">
              {l s='Billing address differs from shipping address' d='Shop.Theme.Global'}
            </a>
          </p>
        {/if}

      {/if}

      {if !$use_same_address}

        <p class="strong">{l s='Your Invoice Address' d='Shop.Theme.Checkout'}</p>

        {if $show_invoice_address_form}
          <div id="invoice-address">
            {render file                      = 'checkout/_partials/address-form.tpl'
              ui                        = $address_form
              use_same_address          = $use_same_address
              type                      = "invoice"
              form_has_continue_button  = $form_has_continue_button
            }
          </div>
        {else}
          <div id="invoice-addresses" class="address-selector js-address-selector row">
            {include  file        = 'checkout/_partials/address-selector-block.tpl'
              addresses   = $customer.addresses
              name        = "id_address_invoice"
              selected    = $id_address_invoice
              type        = "invoice"
              interactive = !$show_delivery_address_form and !$show_invoice_address_form
            }
          </div>

          {if isset($invoice_address_error)}
            <p class="alert alert-danger js-address-error" name="alert-invoice" id="id-failure-address-{$invoice_address_error.id_address}">{$invoice_address_error.exception}</p>
          {else}
            <p class="alert alert-danger js-address-error" name="alert-invoice" style="display: none">{l s="Your address is incomplete, please update it." d="Shop.Notifications.Error"}</p>
          {/if}

          <div class="add-address mt-3 mb-3">
            <a class="btn btn-secondary outline btn-sm" href="{$new_address_invoice_url}">{l s='add new address' d='Shop.Theme.Actions'}</a>
          </div>
        {/if}

      {/if}

      {if !$form_has_continue_button}
        <div class="text-center">
          <button type="submit" class="btn btn-primary continue d-none d-md-inline-block" name="confirm-addresses" value="1">
            {l s='Continue - delivery method' d='Shop.Theme.Global'}
          </button>
          <button type="submit" class="btn btn-primary continue btn-block d-block d-md-none" name="confirm-addresses" value="1">
            {l s='Continue - delivery method' d='Shop.Theme.Global'}
          </button>
          <input type="hidden" id="not-valid-addresses" class="js-not-valid-addresses" value="{$not_valid_addresses}">
        </div>
      {/if}
	  <input type="hidden" name="use_same_address" value="1">
    </form>
  </div>
{/block}
