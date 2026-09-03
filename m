Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AE64E3EE7
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449805; cv=none; b=BYERo9y9DxZtLU5fEDfPwdtQyzq9OGLapB/fUeqpP11heHEnwh9vHak+wzhjTfTqog57MWHWcnrL8g4ZllsXlKCpTII1sgaHoySNeWacp94gcrEj3uR2EqEV8MnzJYVDjtos1RlOsnXtPGfKoG5jdCtMXjVzNvp+egTBBkrt3Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449805; c=relaxed/simple;
	bh=EMi5f4lNBmWXu6d+fPcI1KX/wIAaZ8Vd47RfWN3nins=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Rvg3fub2WTgvnSfoPNROlX0CxnftD+/wtZAZwbVh9q6FCh3gjJ+hOC7PiQEe79AmBLD404QDsfxJ9qq9QA/K8QpsEUABDYBxpc9Y4uMQQR2jDonXQk6v9VeqfK6HajUg/cej1GCJN9W99aQ3HlcWYA03a1cYCFvWyPip1y6LmZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BumP3odJ; arc=none smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BumP3odJ"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-499c930cb9cso22945e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449802; x=1789054602; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d97CQnOJj0XmdozH/KAeoWsPcFgZWb7RGRKU1QNh0Po=;
        b=BumP3odJJLDrPht11NHmbXghsSbUQcx+ok/FIjGkP8n7ZgrRgQFfX4xC/YLOED3zdr
         wkCjGRtwYLvYbKEZOUOH8nkEPxFnPZlmgA3k7sRY8EFnUEq9Ci02QZ0BPjRvTCJ1vtFo
         SpXBQudQdhqHyC0503hrLUVCAM2RaYHOYBPZkIck6CNmDaR1jZap/gjxcCqv2IKmfpXk
         9Kb7DtvHnLWFjumQXmxTjJGzNqiqVKznbDq+PivyhPw6uy+CU9F+s8rO/dxPaR7KFqGw
         iTJ1f2A3TBFJZ6L12j9Bzj31dCx/OcgKOM/zr7KgPCJ4MYfzkzVxU5dIltYEj4jParXn
         gUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449802; x=1789054602;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d97CQnOJj0XmdozH/KAeoWsPcFgZWb7RGRKU1QNh0Po=;
        b=ngE6eAXO0+7RO8JNZjA/6nAxvcOuLY5fqObvScvy1d/X1ho3JGjyOplDXqWs4DV1XX
         EfaimhYqzhqsKoC7/Si2GLasBz413nRYlyMUKbRA05I+M6OJDBYUZJqF6nVrYjcPzOtp
         etgyb15HXIES5gMI+mkry1WQy2gvREJNLc40CyabM11qk1nWQsp5Z0LiqZOAcwtvQQzt
         /CFmdcpaSzDB63Zsa/QADoxt7uWnr0ykhvr/EM3IEVyFzYY5uwlT4gMcYMTpWIcTVf4d
         4qCF3lTSCmswVdkHWfG7sURiZ8xPQqwwufM2rY2wzNdQ4VLL9xV19BtWXSbVfD76CD7J
         fPNg==
X-Gm-Message-State: AFuF++mziBYVEWjpMzk1Ye4kSTfve+KdL1G17ipOXxGCED+UJfIrIjwv
	oklX+1u+FgSS737VTrjDuVZfQmAISpqw78D1y5qiwssIZILebOJJZIJWX9lsU0DG
X-Gm-Gg: AYBFou0TlqUSEVJuQ2ggdh8nYPaMHSbzxdFnfsv/uvihdRpkCyxzqWQyOQQx/rqBqws
	4UegVCkea6xh0GpJELvkVmb/eL0AgDpBNIh8oF7JH0iZ5JlcmtaITg4G9MyDq1yCMbx531IzHlc
	WVscy5962Et7vigDr6MS0NHL2Cm4v1ti/SBltqHF5p79VhGB1oYYtOXF4XalWOsm7HykfPxn90+
	oEet1Tva+slU/zeQhBaZlKCtoTH3WIxjLXbcNLuJjubKkwbW0GMErqlrQm2xyTTWIp9+pxBJZGI
	Wfy7qzzXIWC+cp6TfFqKdnxU5toYtus8QDRzC2S15BwFqzBhV8vIZuj7xjn6t7UmXgxamJ6ytK1
	6ozY1kyNo6zoJXlOZclITu0/2dSrIMviFbKbTSwt216lE4klw1DgaHP6pEg2szGTNNaTuIzM7Ct
	jxTmZIzvl/MDV5WbVHe0XOs55LIhca+K7qtZ7wuy9W3lJK2DODinkcQiZ4XPJb9iIGkpHgBQ7Yd
	q5B58Ww8mMArcpkW4192umUcZsk+IFhcvUlNYw1fDyIupzl9JaRPSeUoPSP/Thw07tC8KvDJh5+
	FPA07S1nObkBG9PBxoZZHpaKkUI=
X-Received: by 2002:a05:600c:470d:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49ce58363f8mr200509115e9.15.1788449801763;
        Thu, 03 Sep 2026 08:36:41 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm87903355e9.1.2026.09.03.08.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:36:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 17:36:40 +0200
Message-Id: <DL5SJK7Q489U.1HFUM2S4I4G71@gmail.com>
Subject: Re: [PATCH bpf v1 05/10] bpf: Reject resilient lock operations in
 rbtree callbacks
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260903144433.1716731-1-memxor@gmail.com>
 <20260903144433.1716731-6-memxor@gmail.com>
 <20260903153146.2C3A81F00A3A@smtp.kernel.org>
In-Reply-To: <20260903153146.2C3A81F00A3A@smtp.kernel.org>

On Thu Sep 3, 2026 at 5:31 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The restriction against calling lock operations inside rbtree ca=
llbacks can be bypassed by nesting callbacks or calling subprograms, becaus=
e in_rbtree_lock_required_cb() only checks the immediate top frame.
> --
>
> commit c5914f67e15078bc12af13429620d2a2a4de2b11
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Reject resilient lock operations in rbtree callbacks
>
> This patch attempts to enforce the root's lock requirement for resilient
> locks in rbtree callbacks. It aims to prevent use-after-free conditions
> when nodes are removed and freed by other CPUs during the in-progress tre=
e
> walk.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index f540279ff4abb..32d31fa67036b 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -13241,6 +13241,11 @@ static int check_kfunc_args(struct bpf_verifier=
_env *env, struct bpf_call_arg_me
>>  		{
>>  			int flags =3D PROCESS_RES_LOCK;
>>
>> +			if (in_rbtree_lock_required_cb(env)) {
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does
> in_rbtree_lock_required_cb() fully protect against this bypass?
>
> Looking at in_rbtree_lock_required_cb(), it only checks the immediate top
> frame:
>
> kernel/bpf/verifier.c:in_rbtree_lock_required_cb() {
>     ...
> 	callee =3D state->frame[state->curframe];
>
> 	if (!callee->in_callback_fn)
> 		return false;
>
> 	kfunc_btf_id =3D insn[callee->callsite].imm;
> 	return is_rbtree_lock_required_kfunc(kfunc_btf_id);
> }
>
> If a BPF program calls a custom rbtree comparison callback, and inside th=
at
> callback it calls a static subprogram (or a nested callback like bpf_loop=
()),
> would state->curframe's in_callback_fn be false (or its kfunc_btf_id not
> match the rbtree add kfunc)?
>
> Could a program use this nested frame to successfully unlock the resilien=
t
> lock via a global map value (BPF_PSEUDO_MAP_VALUE), temporarily dropping =
the
> lock and allowing another CPU to concurrently remove and free the nodes b=
eing
> traversed by bpf_rbtree_add(), leading to a Use-After-Free?
>

Separate bug, will be separate fix. Let's still add this one.

>> +				verbose(env, "can't res_spin_{lock,unlock} in rbtree cb\n");
>> +				return -EACCES;
>> +			}
>> +
>>  			if (reg->type !=3D PTR_TO_MAP_VALUE && reg->type !=3D (PTR_TO_BTF_ID=
 | MEM_ALLOC)) {
>>  				verbose(env, "%s doesn't point to map value or allocated object\n",
>>  					reg_arg_name(env, argno));

