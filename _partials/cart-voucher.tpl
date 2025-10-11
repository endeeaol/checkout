{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
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
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{if $cart.vouchers.allowed}
  {block name='cart_voucher'}
    <div class="block-promo">
      <div class="cart-voucher js-cart-voucher">
        {if $cart.vouchers.added}
          {block name='cart_voucher_list'}
            <ul class="promo-name card-block ps-3 pt-2 mt-3 bggray100 corner4">
              {foreach from=$cart.vouchers.added item=voucher}
                <li class="cart-summary-line">
					
					-{$voucher.reduction_percent|intval}% {l s='Cart na kod rabatowy' d='Shop.Theme.Global'}
					
					<label class="d-inline-block p-0 corner4">"{$voucher.name}":</label> 
					
                  <div class="value d-inline-flex align-items-center">
                    <span>{$voucher.reduction_formatted}</span>
                      {if isset($voucher.code) && $voucher.code !== ''}
                        <a href="{$voucher.delete_url}" data-link-action="remove-voucher" class="text-danger ml-1 d-inline-block ps-2 pt-n1">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" viewBox="0 0 18 20" fill="none">
                                <path d="M17.25 3.625H13.125V2.5C13.125 2.00272 12.9275 1.52581 12.5758 1.17417C12.2242 0.822544 11.7473 0.625 11.25 0.625H6.75C6.25272 0.625 5.77581 0.822544 5.42417 1.17417C5.07254 1.52581 4.875 2.00272 4.875 2.5V3.625H0.75C0.650544 3.625 0.555161 3.66451 0.484835 3.73484C0.414509 3.80516 0.375 3.90054 0.375 4C0.375 4.09946 0.414509 4.19484 0.484835 4.26516C0.555161 4.33549 0.650544 4.375 0.75 4.375H1.875V18.25C1.875 18.5484 1.99353 18.8345 2.2045 19.0455C2.41548 19.2565 2.70163 19.375 3 19.375H15C15.2984 19.375 15.5845 19.2565 15.7955 19.0455C16.0065 18.8345 16.125 18.5484 16.125 18.25V4.375H17.25C17.3495 4.375 17.4448 4.33549 17.5152 4.26516C17.5855 4.19484 17.625 4.09946 17.625 4C17.625 3.90054 17.5855 3.80516 17.5152 3.73484C17.4448 3.66451 17.3495 3.625 17.25 3.625ZM5.625 2.5C5.625 2.20163 5.74353 1.91548 5.9545 1.7045C6.16548 1.49353 6.45163 1.375 6.75 1.375H11.25C11.5484 1.375 11.8345 1.49353 12.0455 1.7045C12.2565 1.91548 12.375 2.20163 12.375 2.5V3.625H5.625V2.5ZM15.375 18.25C15.375 18.3495 15.3355 18.4448 15.2652 18.5152C15.1948 18.5855 15.0995 18.625 15 18.625H3C2.90054 18.625 2.80516 18.5855 2.73484 18.5152C2.66451 18.4448 2.625 18.3495 2.625 18.25V4.375H15.375V18.25ZM7.125 8.5V14.5C7.125 14.5995 7.08549 14.6948 7.01517 14.7652C6.94484 14.8355 6.84946 14.875 6.75 14.875C6.65054 14.875 6.55516 14.8355 6.48483 14.7652C6.41451 14.6948 6.375 14.5995 6.375 14.5V8.5C6.375 8.40054 6.41451 8.30516 6.48483 8.23483C6.55516 8.16451 6.65054 8.125 6.75 8.125C6.84946 8.125 6.94484 8.16451 7.01517 8.23483C7.08549 8.30516 7.125 8.40054 7.125 8.5ZM11.625 8.5V14.5C11.625 14.5995 11.5855 14.6948 11.5152 14.7652C11.4448 14.8355 11.3495 14.875 11.25 14.875C11.1505 14.875 11.0552 14.8355 10.9848 14.7652C10.9145 14.6948 10.875 14.5995 10.875 14.5V8.5C10.875 8.40054 10.9145 8.30516 10.9848 8.23483C11.0552 8.16451 11.1505 8.125 11.25 8.125C11.3495 8.125 11.4448 8.16451 11.5152 8.23483C11.5855 8.30516 11.625 8.40054 11.625 8.5Z" fill="black"/>
                            </svg>
                        </a>
                      {/if}
                  </div>
                </li>
              {/foreach}
            </ul>
          {/block}
        {/if}

        <p class="mb-2">
          {l s='Have a promo code?' d='Shop.Theme.Checkout'}
        </p>

        <div id="promo-code">
          <div class="promo-code" style="display:block !important!">
            {block name='cart_voucher_form'}
              <form action="{$urls.pages.cart}" data-link-action="add-voucher" method="post">
                <input type="hidden" name="token" value="{$static_token}">
                <input type="hidden" name="addDiscount" value="1">

                <div class="input-group js-parent-focus">
                  <input class="promo-input form-control js-child-focus" type="text" name="discount_name" placeholder="{l s='Promo code' d='Shop.Theme.Checkout'}">
                  <span class="input-group-append">
                    <button type="submit" class="btn btn-primary">
                      {l s='Add' d='Shop.Theme.Actions'}
                    </button>
                  </span>
                </div>
              </form>
            {/block}

            {block name='cart_voucher_notifications'}
              <div class="alert alert-danger js-error mt-2" role="alert" style="display:none;">
                <span class="js-error-text"></span>
              </div>
            {/block}
          </div>
        </div>

        {if $cart.discounts|count > 0}
          <p class="block-promo promo-highlighted h6 mb-1 mt-3">
            {l s='Take advantage of our exclusive offers:' d='Shop.Theme.Actions'}
          </p>
          <ul class="js-discount card-block promo-discounts mb-0">
            {foreach from=$cart.discounts item=discount}
              <li class="cart-summary-line">
                <span class="label"> 
                  <a href="#" class="js-code font-weight-bold">{$discount.code}</a> - {$discount.name} 
                </span>
              </li>
            {/foreach}
          </ul>
        {/if}
      </div>
    </div>
  {/block}
{/if}
