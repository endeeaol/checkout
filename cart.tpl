{extends file=$layout}
{block name='content'}
	<section id="main">
		<div class="cart-grid row">
			<!-- Left Block: cart product informations & shpping -->
			<div class="cart-grid-body col-12 col-lg-8">
				{fscustomhtml hook='displayCartTop'}
				<!-- cart products detailed -->
				<div class="card cart-container">
					<div class="">
						<h4 class="h4 mb-0 mt-2">{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h4>
						<hr>
					</div>
					{block name='cart_overview'}
						{include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
					{/block}
				</div>
				
				{* EKSPERTSENDER Produkty Rekomendowane w koszyku PL DE  EN*}
				<div id="recommend-es-cart">{* Ramka rekomendacji ExpertSender Koszyk*}</div>
				<div id="recommend-es-cart-de">{* Ramka rekomendacji ExpertSender Koszyk*}</div>
				<div id="recommend-es-cart-en">{* Ramka rekomendacji ExpertSender Koszyk*}</div>
					
				{if isset($customer) && $customer.is_logged && $customer.id_default_group == 5}{/if}
				
				
				{*        {block name='continue_shopping'}*}
				{*          <div class="my-3">*}
				{*            <a class="btn btn-outline-primary" href="{$urls.pages.index}">*}
				{*              <span class="material-icons btn-icon mr-1">keyboard_arrow_left</span>*}
				{*              {l s='Continue shopping' d='Shop.Theme.Actions'}*}
				{*            </a>*}
				{*          </div>*}
				{*        {/block}*}

				{* cart footer *}
				{block name='hook_shopping_cart_footer'}
					{hook h='displayShoppingCartFooter'}
				{/block}
				

				
			</div>

			<!-- Right Block: cart subtotal & cart total -->
			<div class="cart-grid-right col-12 col-lg-4">
				{block name='cart_summary'}
					<div class="card cart-summary">
						<div class=" ">
							<h4 class="h4 mb-0">{l s='Summary' d='Shop.Istheme'}</h4>
							<hr>
						</div>
						<div class="card-body">
							{block name='hook_shopping_cart'}
								{hook h='displayShoppingCart'}
							{/block}
							{block name='cart_totals'}
								{include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
							{/block}
						</div>
						<div class="card-body">
							{block name='cart_actions'}
								{include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
							{/block}
						</div>
					</div>
				{/block}
				{block name='hook_reassurance'}
					{hook h='displayReassurance'}
				{/block}
			</div>
		</div>
		{hook h='displayCrossSellingShoppingCart'}
	</section>
{/block}