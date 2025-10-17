<section id="js-checkout-summary" class="card js-cart" data-refresh-url="{$urls.pages.cart}?ajax=1&action=refresh">

  <div class="card bggray100 corner8 p-2">
    <p class="pt-1 pb-0 px-4 mb-0 strong">{l s='Summary' d='Shop.Istheme'}</p>
  
	<div class="card-body mt-0">
	  {block name='hook_checkout_summary_top'}
		{include file='checkout/_partials/cart-summary-top.tpl' cart=$cart}
	  {/block}

	  {block name='cart_summary_products'}
		{include file='checkout/_partials/cart-summary-products.tpl' cart=$cart}
	  {/block}

	  {block name='cart_summary_subtotals'}
	   {include file='checkout/_partials/cart-summary-subtotals.tpl' cart=$cart} 
	  {/block}

	  {block name='cart_summary_totals'} 
		{include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
	  {/block}

	  {block name='cart_summary_voucher'}
		{include file='checkout/_partials/cart-voucher.tpl'}
	  {/block}
	</div>
  
</div>

</section>
