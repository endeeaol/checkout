{block name='cart_summary_product_line'}
  <div class="cart-products d-flex align-items-center pb-0">
    <div class="cart-products__thumb">
      {images_block webpEnabled=$webpEnabled}
        <img
          {if $product.default_image}
            {generateImagesSources image=$product.default_image size='cart_default' lazyload=false}
          {else}
            src="{$urls.no_picture_image.bySize.cart_default.url}"
          {/if}
          alt="{$product.name|escape:'quotes'}"
          class="img-fluid rounded"
          width="{$product.default_image.bySize.cart_default.width}"
          height="{$product.default_image.bySize.cart_default.height}">
      {/images_block}
    </div>
	
    <div class="cart-products__desc">
		<p class="p-0 m-0 lh100"><span class="text-muted">{$product.quantity} × </span> {$product.name}</p>
		<p class="p-0 m-0 strong lh100">{$product.price}</p>
      <ul class="m-0">
        {foreach from=$product.attributes key="attribute" item="value"}
          <li class="text-muted small">
            <span>{$attribute}:</span>
            <span class="font-weight-bold">{$value}</span>
          </li>
        {/foreach}
      </ul>
    </div>
  </div>
		<hr/>
{/block}
