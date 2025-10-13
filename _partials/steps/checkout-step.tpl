<section  id    = "{$identifier}"
          class = "{[
            'checkout-step'   => true,
            '-current'        => $step_is_current,
            '-reachable'      => $step_is_reachable,
            '-complete'       => $step_is_complete,
            'js-current-step' => $step_is_current
          ]|classnames}"
>
  {* Nagłówek kroku jest celowo wykomentowany, zgodnie z naszymi pierwszymi ustaleniami *}
  {*  *}
  <code class="step-title h3">
    <span class="step-number">{$position} </span>
    {$title}
  </code>


  <div class="content">
    {block name='step_content'}DUMMY STEP CONTENT{/block}
  </div>
</section>