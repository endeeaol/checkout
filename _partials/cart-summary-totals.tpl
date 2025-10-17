{block name='cart_summary_total'}
	{if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
		<div class="cart-summary-line row m-0"> 
			<span class="cartlabel col-8">{$cart.totals.total.label}&nbsp;{$cart.labels.tax_short}</span>
			<span class="value col-4">{$cart.totals.total.value} </span>
		</div>
		<div class="cart-summary-line cart-total row m-0">  
			<span class="label col-8">{$cart.totals.total_including_tax.label}</span>
			<span class="value col-4">{$cart.totals.total_including_tax.value}</span>
		</div>
	{else}
		
	{if !empty($cart.subtotals.shipping.value)}
		<div class="cart-summary-line-shipping row mb-2 d-flex align-items-center mx-0">
			<div class="col-6 text-right">
				<span class="label cartlabel">{l s='Cart Koszt dostawy od' d='Shop.Theme.Global'}:
					<div class="uk-inline">
						<button class="btn btnicon" type="button"><span uk-icon="icon:info; ratio: 0.75"></span></button>
						<div class="popme uk-card uk-card-body uk-card-default uk-padding-small" uk-drop="mode: click">
						{l s='shipping szacowany koszt dostawy' d='Shop.Theme.Global'}
						</div>
					</div>
				</span>
			</div>
			<div class="col-6 text-right">
				<span class="strong">{$cart.subtotals.shipping.value}</span>
			</div>
		</div>
	{/if}

	<div class="cart-summary-line cart-total corner4 mb-2 p-0 mx-2 row d-flex align-items-center mx-0">
		<span class="col-6 cartlabel text-right ">{$cart.totals.total.label}: </span>
		<span class="col-6  value text-right h5 m-0 p-0 lh100">{$cart.totals.total.value}</span> 
	</div>
{/if}
<hr>
	<div class="free-delivery-box">
		{widget name='gmgetfreeshipping'}
	</div>
{/block}


{block name='cart_summary_tax'}
	{if $cart.subtotals.tax}
		<div class="cart-summary-line">
			<span class="label sub">{l s='%label%:' sprintf=['%label%' => $cart.subtotals.tax.label] d='Shop.Theme.Global'}</span>
			<span class="value sub">{$cart.subtotals.tax.value}</span>
		</div>
	{/if}
{/block}

