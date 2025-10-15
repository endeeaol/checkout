{extends file=$layout}

{block name='header'}
  {include file='checkout/_partials/header.tpl'}
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
{/block}

{block name='content'}
 
{* Zmienna {$current_step_identifier} jest dostarczana przez moduł bestcheckout*}
{* Nawigacja kroków (ukryta na pierwszym kroku) *}
{if $current_step_identifier != 'checkout-personal-information-step'}

  {* ZMIANA: Uproszczone nazwy i usunięty Krok 1 z listy, tak jak chcieliśmy *}
  {assign var='static_steps' value=[
	['identifier' => 'checkout-personal-information-step', 'position' => 1, 'title' => {l s='CheckoutNav Personal data' d='Shop.Theme.Global'}],
    ['identifier' => 'checkout-addresses-step', 'position' => 2, 'title' => {l s='CheckoutNav Address' d='Shop.Theme.Global'}],
    ['identifier' => 'checkout-delivery-step', 'position' => 3, 'title' => {l s='CheckoutNav Shipping' d='Shop.Theme.Global'}],
    ['identifier' => 'checkout-payment-step', 'position' => 4, 'title' => {l s='CheckoutNav Payment' d='Shop.Theme.Global'}]
  ]}

  <div class="steps-navigation-container container mb-4">
    <div class="row">
      {assign var='is_current_step_passed' value=false}
      {foreach from=$static_steps item=step}

        {assign var='is_current' value=($step.identifier == $current_step_identifier)}
        {assign var='is_complete' value=(!$is_current_step_passed && !$is_current)}

        {* ZMIANA: Dodajemy klasy statusu (--current, --complete, --upcoming) do głównego kontenera 'col' *}
        <div class="col step-nav-col {if $is_current}--current{elseif $is_complete}--complete{else}--upcoming{/if}" id="nav-{$step.identifier}">
          
          
          {if $is_complete}
            <a href="#" class="checkout-nav-link" data-target="#{$step.identifier}">
          {/if}
          
          <div class="step-item">
            <h5 class="step-title mb-0">
              <span class="step-number">{$step.position}.</span>
              <span class="step-title-text">{$step.title}</span>
              {* ZMIANA: Dodajemy ikonę ✓ i link "(zmień)" dla ukończonych kroków *}
              {if $is_complete}
                <i class="material-icons step-check-icon">check_circle</i>
                <span class="step-change-link">({l s='CheckoutNav Change' d='Shop.Theme.Global'})</span>
              {/if}
            </h5>
          </div>

          {if $is_complete}
            </a>
          {/if}
        </div>
        
        {if $is_current}{assign var='is_current_step_passed' value=true}{/if}
      {/foreach}
    </div>
  </div>
{/if}

  
   
  
  
  
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
	{* === MAGAZYN TŁUMACZEŃ DLA JAVASCRIPT === *}
	<div id="bestcheckout-translations" style="display: none;"
		data-phone-error-short="{l s='Invalid phone number.' d='Shop.Theme.Global'}"
		data-phone-error-long="{l s='The phone number must have 9 digits' d='Shop.Theme.Global'}"
	>
	</div>
	{* === KONIEC MAGAZYNU === *}
{/block}