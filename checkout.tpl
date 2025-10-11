{extends file=$layout}

{block name='header'}
  {include file='checkout/_partials/header.tpl'}
{/block}

{block name='content'}

  {* Zmienna {$current_step_identifier} jest dostarczana przez nasz moduł *}

  {* Nawigacja jest teraz wyświetlana ZAWSZE (ukryjemy ją za pomocą CSS w kroku 1) *}
  {assign var='static_steps' value=[
    ['identifier' => 'checkout-personal-information-step', 'position' => 1, 'title' => {l s='Personal Information' d='Shop.Theme.Checkout'}],
    ['identifier' => 'checkout-addresses-step', 'position' => 2, 'title' => {l s='Addresses' d='Shop.Theme.Checkout'}],
    ['identifier' => 'checkout-delivery-step', 'position' => 3, 'title' => {l s='Shipping Method' d='Shop.Theme.Checkout'}],
    ['identifier' => 'checkout-payment-step', 'position' => 4, 'title' => {l s='Payment' d='Shop.Theme.Checkout'}]
  ]}
  <div class="steps-navigation-container container mb-4">
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
  </div>

  {* Układ dwukolumnowy jest teraz wyświetlany ZAWSZE (zmodyfikujemy go za pomocą CSS w kroku 1) *}
  <section id="content">
    <div class="row">
      <div class="cart-grid-body col-12 col-lg-8 mb-4">
        <div class="card">
          {block name='checkout_process'}
            {render file='checkout/checkout-process.tpl' ui=$checkout_process}
          {/block}
        </div>
      </div>
      <div class="cart-grid-right col-12 col-lg-4">
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