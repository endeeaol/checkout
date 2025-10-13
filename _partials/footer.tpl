<div class="modal fade js-checkout-modal" id="checkout-modal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="js-modal-content"></div>
			</div>
		</div>
	</div>
</div>

{if $tos_cms != false}
	<div class="py-1 text-center">
		<span class="d-block js-terms colorprimary">{$tos_cms nofilter}</span>
	</div>
{/if}

<div class="container">
	<div class="row align-items-center my-3">
		<div class="col">
			<hr>
			<a class="colorprimary" href="{$urls.pages.index}"><span data-uk-icon="icon:arrow-left"></span> {l s='back to shopping' d='Shop.Theme.Global'}</a>
			<p class="small colorgray700">
				BEST LAB SP. Z O.O. ul. Grzybowska 87, 00-844 Warszawa<br/>
				NIP: 5272991208, KRS: 0000956521<br/>
				Tel.: 793 787 737 <br/>
				E-mail: info@bestlab.com.pl 
			</p>
		</div>
	</div>
</div>

<!-- ExpertSender --> 
{if $language.iso_code == 'pl'}
	{literal} 
		<script type="text/javascript">
			var $ecdp = window.$ecdp || {};
			window.$ecdp = {
				uId: 'co',
				wId: 'F',
				clickDomain: 'links.bestlab.info'
			};
			(function () {
				var d = document, g = d.createElement('script'),
						s = d.getElementsByTagName('script')[0],
						dbg = window.localStorage.getItem('ecdp.debug') === null ? '' : window.localStorage.getItem('ecdp.debug'),
						time = Math.floor(Date.now() / 600000);
				g.type = 'text/javascript';
				g.async = true;
				g.defer = true;
				g.src = 'https://sherlock.ecdp.cloud/script/co/F/ff811dad/' + time + '/' + dbg;
				s.parentNode.insertBefore(g, s);
			})();
		</script>
	{/literal}

{elseif $language.iso_code == 'de'}

    {literal}
		<script type="text/javascript">
			var $ecdp = window.$ecdp || {};
			window.$ecdp = {
				uId: 'co',
				wId: 'm',
				clickDomain: 'links.bestlab.info'
			};
			(function () {
				var d = document, g = d.createElement('script'),
						s = d.getElementsByTagName('script')[0],
						dbg = window.localStorage.getItem('ecdp.debug') === null ? '' : window.localStorage.getItem('ecdp.debug'),
						time = Math.floor(Date.now() / 600000);
				g.type = 'text/javascript';
				g.async = true;
				g.defer = true;
				g.src = 'https://sherlock.ecdp.cloud/script/co/m/0e11b2c6/' + time + '/' + dbg;
				s.parentNode.insertBefore(g, s);
			})();
		</script>
	{/literal}

{elseif $language.iso_code == 'en'}

	{literal}
		<script type="text/javascript">
			var $ecdp = window.$ecdp || {};
			window.$ecdp = {
				uId: 'co',
				wId: 'c',
				clickDomain: 'links.bestlab.info'
			};
			(function () {
				var d = document, g = d.createElement('script'),
						s = d.getElementsByTagName('script')[0],
						dbg = window.localStorage.getItem('ecdp.debug') === null ? '' : window.localStorage.getItem('ecdp.debug'),
						time = Math.floor(Date.now() / 600000);
				g.type = 'text/javascript';
				g.async = true;
				g.defer = true;
				g.src = 'https://sherlock.ecdp.cloud/script/co/c/9b616653/' + time + '/' + dbg;
				s.parentNode.insertBefore(g, s);
			})();
		</script>
	{/literal}

{else}

{/if}
<!-- Koniec ExpertSender --> 

