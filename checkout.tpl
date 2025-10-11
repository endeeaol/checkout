{extends file=$layout}
{block name='header'}
  {include file='checkout/_partials/header.tpl'}
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
{/block}

{block name='content'}
  {assign var='static_steps' value=[
    ['identifier' => 'checkout-personal-information-step', 'position' => 1, 'title' => {l s='Personal Information' d='Shop.Theme.Checkout'}],
    ['identifier' => 'checkout-addresses-step', 'position' => 2, 'title' => {l s='Addresses' d='Shop.Theme.Checkout'}],
    ['identifier' => 'checkout-delivery-step', 'position' => 3, 'title' => {l s='Shipping Method' d='Shop.Theme.Checkout'}],
    ['identifier' => 'checkout-payment-step', 'position' => 4, 'title' => {l s='Payment' d='Shop.Theme.Checkout'}]
  ]}
  
  
<aside class="steps-navigation-container container mb-4 {if $current_step_identifier == 'checkout-personal-information-step'} d-none{/if}">
    <div class="row">
      {assign var='is_current_step_passed' value=false}
      {foreach from=$static_steps item=step}
        {assign var='is_current' value=($step.identifier == $current_step_identifier)}
        <div class="col" id="nav-{$step.identifier}">
          <div class="step-item {if $is_current}--current{elseif !$is_current_step_passed}--complete{/if}">
            <h5 class="step-title mb-0"><span class="step-number">{$step.position}.</span> {$step.title}</h5>
          </div>
        </div>
        {if $is_current}{assign var='is_current_step_passed' value=true}{/if}
      {/foreach}
    </div>
</aside>

	  
{* Ukrywam podsumowanie w logowaniu *}
  <section id="content" class="checkoutcontent">
    <div class="row">
      <div class="cart-grid-body {if $current_step_identifier == 'checkout-personal-information-step'} col-12 col-lg-8 mb-4 m-auto {else} order-2 order-lg-1 col-12 col-lg-8 mb-4{/if}">
        <div class="card">
          {block name='checkout_process'}
            {render file='checkout/checkout-process.tpl' ui=$checkout_process}
          {/block}
        </div>
      </div>
      <div class="cart-grid-right {if $current_step_identifier == 'checkout-personal-information-step'}d-none{else}order-1 order-lg-2 col-12 col-lg-4{/if}">
        {block name='cart_summary'}
          {include file='checkout/_partials/cart-summary.tpl' cart=$cart}
        {/block}
        {hook h='displayReassurance'}
      </div>
    </div>
  </section>

{/block}

{block name='footer'}
  {include file='checkout/_partials/footer.tpl'}
{/block}