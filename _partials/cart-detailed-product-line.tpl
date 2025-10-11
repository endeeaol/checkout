{**
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License 3.0 (AFL-3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* https://opensource.org/licenses/AFL-3.0
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2017 PrestaShop SA
* @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
* International Registered Trademark & Property of PrestaShop SA
*}

<div class="product-line-grid">
	<div class="product-line-grid__row row align-items-center">
		<div class="product-line-grid__block product-line-grid__block--image">
			{images_block webpEnabled=$webpEnabled}
			<img
				{generateImagesSources image=$product.default_image size='cart_default' lazyload=false}
				alt="{$product.name|escape:'quotes'}"
				class="img-fluid rounded"
				width="{$product.default_image.bySize.cart_default.width}"
				height="{$product.default_image.bySize.cart_default.height}">
			{/images_block}
		</div>
		<div class="product-line-grid__block product-line-grid__block--prod">
			<p class="h6 product-line-grid__title my-0">
				<a class="text-reset" href="{$product.url}" data-id_customization="{$product.id_customization|intval}">
					{$product.name}
				</a>
			</p>

			{*      {if $product.attributes}*}
			{*        <ul class="mb-2">*}
			{*          {foreach from=$product.attributes key="attribute" item="value"}*}
			{*            <li class="text-muted small">*}
			{*              <span>{$attribute}:</span>*}
			{*              <span class="font-weight-bold">{$value}</span>*}
			{*            </li>*}
			{*          {/foreach}*}
			{*        </ul>*}
			{*      {/if}*}

			<div class="product-line-info product-price{if $product.has_discount} has-discount{/if}">
				<div class="current-price text-start">
					{if $product.has_discount}
						<span class="price price--regular mr-1">{$product.regular_price}</span>
					{/if}
					<span
						class="current-price-display price{if $product.has_discount} current-price-discount{/if}">{$product.price}</span>
					{if $product.unit_price_full}
						<div class="unit-price-cart">{$product.unit_price_full}</div>
					{/if}
				</div>

				{hook h='displayProductPriceBlock' product=$product type="unit_price"}
			</div>
			{* end product-price *}
			{if is_array($product.customizations) && $product.customizations|count}
				{block name='cart_detailed_product_line_customization'}
					<div class="mt-3">
						{foreach from=$product.customizations item="customization"}
							<a href="#" data-toggle="modal"
							   data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
							<div class="modal fade customization-modal js-customization-modal" id="product-customizations-modal-{$customization.id_customization}"
								 tabindex="-1" role="dialog" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
											<button type="button" class="close" data-dismiss="modal"
													aria-label="{l s='Close' d='Shop.Theme.Global'}">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											{foreach from=$customization.fields item="field"}
												<div class="product-customization-line row">
													<div class="col-sm-3 col-4 label">
														{$field.label}
													</div>
													<div class="col-sm-9 col-8 value">
														{if $field.type == 'text'}
															{if (int)$field.id_module}
																{$field.text nofilter}
															{else}
																{$field.text}
															{/if}
														{elseif $field.type == 'image'}
															<img src="{$field.image.small.url}">
														{/if}
													</div>
												</div>
											{/foreach}
										</div>
									</div>
								</div>
							</div>
						{/foreach}
					</div>
				{/block}
			{/if}
		</div>

		<div class="product-line-grid__block product-line-grid__block--qty">
			{if !empty($product.is_gift)}
				<span class="gift-quantity">{$product.quantity}</span>
			{else}
				<div>
					<input
						class="js-cart-line-product-quantity input-touchspin"
						data-down-url="{$product.down_quantity_url}"
						data-up-url="{$product.up_quantity_url}"
						data-update-url="{$product.update_quantity_url}"
						data-product-id="{$product.id_product}"
						type="number"
						inputmode="numeric"
						pattern="[0-9]*"
						value="{$product.quantity}"
						name="product-quantity-spin"
						min="{$product.minimal_quantity}"
						aria-label="{l s='%productName% product quantity field' sprintf=['%productName%' => $product.name] d='Shop.Theme.Checkout'}"
						/>
				</div>
			{/if}
		</div>

		<div class="product-line-grid__block product-line-grid__block--total">
			<span class="product-price">
				{if !empty($product.is_gift)}
					<span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
				{else}
					<span class="price">
						{$product.total}
					</span>
				{/if}
			</span>
		</div>

		<div class="product-line-grid__block product-line-grid__block--delete">
			{if empty($product.is_gift)}
				<a class="remove-from-cart text-danger" rel="nofollow" href="{$product.remove_from_cart_url}"
				   data-link-action="delete-from-cart" data-id-product="{$product.id_product|escape:'javascript'}"
				   data-id-product-attribute="{$product.id_product_attribute|escape:'javascript'}"
				   data-id-customization="{$product.id_customization|default|escape:'javascript'}">
					{*          <span class="material-icons font-reset">delete</span>*}
					<svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" viewBox="0 0 18 20" fill="none">
					<path d="M17.25 3.625H13.125V2.5C13.125 2.00272 12.9275 1.52581 12.5758 1.17417C12.2242 0.822544 11.7473 0.625 11.25 0.625H6.75C6.25272 0.625 5.77581 0.822544 5.42417 1.17417C5.07254 1.52581 4.875 2.00272 4.875 2.5V3.625H0.75C0.650544 3.625 0.555161 3.66451 0.484835 3.73484C0.414509 3.80516 0.375 3.90054 0.375 4C0.375 4.09946 0.414509 4.19484 0.484835 4.26516C0.555161 4.33549 0.650544 4.375 0.75 4.375H1.875V18.25C1.875 18.5484 1.99353 18.8345 2.2045 19.0455C2.41548 19.2565 2.70163 19.375 3 19.375H15C15.2984 19.375 15.5845 19.2565 15.7955 19.0455C16.0065 18.8345 16.125 18.5484 16.125 18.25V4.375H17.25C17.3495 4.375 17.4448 4.33549 17.5152 4.26516C17.5855 4.19484 17.625 4.09946 17.625 4C17.625 3.90054 17.5855 3.80516 17.5152 3.73484C17.4448 3.66451 17.3495 3.625 17.25 3.625ZM5.625 2.5C5.625 2.20163 5.74353 1.91548 5.9545 1.7045C6.16548 1.49353 6.45163 1.375 6.75 1.375H11.25C11.5484 1.375 11.8345 1.49353 12.0455 1.7045C12.2565 1.91548 12.375 2.20163 12.375 2.5V3.625H5.625V2.5ZM15.375 18.25C15.375 18.3495 15.3355 18.4448 15.2652 18.5152C15.1948 18.5855 15.0995 18.625 15 18.625H3C2.90054 18.625 2.80516 18.5855 2.73484 18.5152C2.66451 18.4448 2.625 18.3495 2.625 18.25V4.375H15.375V18.25ZM7.125 8.5V14.5C7.125 14.5995 7.08549 14.6948 7.01517 14.7652C6.94484 14.8355 6.84946 14.875 6.75 14.875C6.65054 14.875 6.55516 14.8355 6.48483 14.7652C6.41451 14.6948 6.375 14.5995 6.375 14.5V8.5C6.375 8.40054 6.41451 8.30516 6.48483 8.23483C6.55516 8.16451 6.65054 8.125 6.75 8.125C6.84946 8.125 6.94484 8.16451 7.01517 8.23483C7.08549 8.30516 7.125 8.40054 7.125 8.5ZM11.625 8.5V14.5C11.625 14.5995 11.5855 14.6948 11.5152 14.7652C11.4448 14.8355 11.3495 14.875 11.25 14.875C11.1505 14.875 11.0552 14.8355 10.9848 14.7652C10.9145 14.6948 10.875 14.5995 10.875 14.5V8.5C10.875 8.40054 10.9145 8.30516 10.9848 8.23483C11.0552 8.16451 11.1505 8.125 11.25 8.125C11.3495 8.125 11.4448 8.16451 11.5152 8.23483C11.5855 8.30516 11.625 8.40054 11.625 8.5Z" fill="black"/>
					</svg>
				</a>
			{/if}

			{block name='hook_cart_extra_product_actions'}
				{hook h='displayCartExtraProductActions' product=$product}
			{/block}
		</div>
	</div>

</div>
