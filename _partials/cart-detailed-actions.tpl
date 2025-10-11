
{block name='cart_detailed_actions'}
  <div id="cart-actions-container-mwzp" class="checkout cart-detailed-actions js-cart-detailed-actions card-block">
    {if $cart.minimalPurchaseRequired}
      <div class="alert alert-warning" role="alert">
        {$cart.minimalPurchaseRequired}
      </div>
      <div class="text-center">
        <button type="button" class="btn btn-primary disabled" disabled>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</button>
      </div>
    {elseif empty($cart.products) }
      <div class="text-center">
        <button type="button" class="btn btn-primary disabled" disabled>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</button>
      </div>
    {else}
      <div class="text-center">
        <a id="main-checkout-button-mwzp" href="{$urls.pages.order}" class="btn btn-primary">{l s='Finalize the order' d='Shop.Theme.Actions'}</a>
        {hook h='displayExpressCheckout'}
      </div>
    {/if}
  </div>
{/block}
 