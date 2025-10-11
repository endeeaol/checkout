{block name="step_content"}
  <div class="row pt-4 pb-4">
    <div class="col-md-6">
      <h2 class="h2">{l s='Log in' d='Shop.Theme.Actions'}</h2>
      {render file='customer/_partials/login-form.tpl' ui=$login_form}
    </div>
    <div class="col-md-6">
      <div class="card">
        <div class="card-body">
          <h3 class="h3">{l s='Order as a guest' d='Shop.Theme.Checkout'}</h3>
          <p>{l s='You can create an account after placing the order.' d='Shop.Theme.Checkout'}</p>
          <hr/>
          <h3 class="h3">{l s='Create new account' d='Shop.Theme.Checkout'}</h3>
          <ul class="list-unstyled">
            <li class="mb-2"><i class="material-icons text-success mr-2">&#xE876;</i> {l s='Even faster shopping' d='Shop.Theme.Checkout'}</li>
            <li class="mb-2"><i class="material-icons text-success mr-2">&#xE876;</i> {l s='History and tracking of orders' d='Shop.Theme.Checkout'}</li>
            <li class="mb-2"><i class="material-icons text-success mr-2">&#xE876;</i> {l s='Special discounts and promotions' d='Shop.Theme.Checkout'}</li>
            <li class="mb-2"><i class="material-icons text-success mr-2">&#xE876;</i> {l s='Personalized shopping lists' d='Shop.Theme.Checkout'}</li>
          </ul>
          <a href="{$urls.pages.registration}" class="btn btn-primary btn-block mt-3">{l s='Create an account' d='Shop.Theme.Actions'}</a>
        </div>
      </div>
    </div>
  </div>
{/block}