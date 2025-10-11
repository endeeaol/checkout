{block name='cart_detailed_totals'}
	<div class="cart-detailed-totals js-cart-detailed-totals">

		{foreach from=$cart.subtotals item="subtotal"}
			{if $subtotal && $subtotal.value|count_characters > 0 && $subtotal.type !== 'tax'}
			
			<div class="row cart-summary-line cart-subtotal-{$subtotal.type}" id="cart-subtotal-{$subtotal.type}">
			
				{if $subtotal.type === 'products'}
				<div class="col-8"><span class="cartlabel"> {l s='Cart Wartość produktów' d='Shop.Theme.Global'}: </span></div>
				{/if}
				{if $subtotal.type === 'discount'}
				<div class="col-8"><span class="cartlabel"> {l s='Cart Wartość rabatów' d='Shop.Theme.Global'}:</span></div>
				{/if}
				
				
				{if $subtotal.type === 'products'}
					<div class="col-4"><span class="value text-right strong">{$subtotal.value}</span></div>
				{/if}
				{if $subtotal.type === 'discount'}
					<div class="col-4"><span class="colorred text-right strong">-{$subtotal.value}</span></div>
				{/if}
				
				{if $subtotal.type === 'shipping'}
					{hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}
				{/if}
	        </div>
			{/if}
		{/foreach}
	 
		{block name='cart_summary_totals'}
			{include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart} 
		{/block}
		{block name='cart_voucher'}
			{include file='checkout/_partials/cart-voucher.tpl'}
		{/block}
	</div>
{/block}
