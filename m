Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB1A371899
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 09:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537044; cv=none; b=ma8vSZ9iTV5yeKARui99O1iR8smDYuX7YPsqHzuM5XMcsksZsaZbfktSocXhWKJdJnf9/o/cUXAXYgdP0sxOHu6t7OnLZyUa0BElpAaacy1AQ3jcFI4cGaq3PtWcODyXSJcSZURp7Lp5WNrhmFuQs3Td3lbBXmFgpBCH44FG5oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537044; c=relaxed/simple;
	bh=hSrFY6yJOAn0mmdan1yEptjvNe8y2O/A+HPVrFv+sLU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L2LjKj0sLhqoRNJsE/S6aof7WnkTGkFgjBkE37O+KvtiNjFgGnmYmHmHHt3aoQNR65NPsE913U2nugnKAjQDd5Nosu+frXEG/AomCpg/p2kMMxoCq19BR0jdgP6LDmg5/FOGoEfpZcYLIbc8d2jSkgEj5Hw+ymvKvimf61QvHyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=c2gwWS5/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="c2gwWS5/"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b001cd92bso3219886f8f.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 02:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791537040; x=1792141840; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/JIy/pMq5OkQ+wPHl+YKwojqjh6/wHrpuO6FCK/Wi4=;
        b=c2gwWS5/UjlbpxzVALKIXjn4OUF9QruYElbyIb9aMm0A7L3R4cymC99hlFNBZl7f2j
         g6sCnX9TyElCjfqydB8TavHG3Kb0QiAv+r3h+SShJ1l6DUSj8wrx4oSUA/6IJ5kYxcKj
         ZxlajJlCbWU7OOCZdbZh73xTJfNE6Wn8r7uPIayBZAAIeI5GaPdC+erZjN9nf8GL3hPg
         FyqjMYBB4WxTowmBBlMUR2jGvOajMtoBJHHPfX3clzh95zO0mlEzoYfaF159rAioiVwR
         rJ3fM3hrbgRVuK81N4K+lBjHrA/f/cWVGopHVCmO6vSaTsiwijw7OyYXWjPqeUJzI84E
         kXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791537040; x=1792141840;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/JIy/pMq5OkQ+wPHl+YKwojqjh6/wHrpuO6FCK/Wi4=;
        b=1iUSN32N+M1kQmIandcoR5XxGx2IO4+uVWDbe0nGbMDgkHRfJsrm9qVQcxjfqbWa6f
         S9VlV30TqFK2IEA2ru4oLxEptvPJsErIMQMRbpd7fBLxFJca1k4mgmiwiTBQTRtbqYWk
         sr5adh+l7y2NVuDKSz3Qi6Xa4BreJm9Vu9p5ZMet9z2t9JAr0hSF+a1D/oU94PMYhO4l
         ftP6dDTl8MESB7pZf4J4KzCZ582yc8DjYb8iE6ML0hoUV1OMKDV7YjWNhgpoTJ4NO9XW
         ihD3ZGfZXqXsFhVjkeqjpTAUViSiMbyyXYTYpZswcm8HNdexmHI2YYLUuPXGaaKh8CR2
         tpjQ==
X-Gm-Message-State: AFq9FYILdaj8afvqGXgQhk7S86Oi0TXLq+tqmHBeVHihlrJZ6DhIJF06
	Wf6fIH2p2ENSQ9Ryt99ypKMJETt6tJofYJfk4wM5b3ZJfkdEEX52z656svi/aud5vFnmChFc3kT
	fQJ0p3NPaa7s0
X-Gm-Gg: AYBFou3f77GVKv2Mi7D4E7qXOlqBQxVITwY7XQ7SiSD7VtV6djYvmYlOJxe/5SWaHne
	X3fRjGP9esM0a5NpXLgKnF48VgfMaS9mzOAtemNPaklndSxm/6roJgQBEJOys3JcgBz/sIfHmbs
	0RYE3f8bOCr9S7GKz11QiiOco1TLHGuE7HI3gbgWSuB6hKL4Zu8cVrO9pmS6habDcCurB1xowP6
	uiHNCafg3bu/rFNhVASQzqgLZ26vIbPLiZECoRbQS1Pxs4E1iT9WOJIbG11RiZ8iIkEOYTr9WR9
	OwG6gnLAlkOmYX12VSSKiDA/UCfvbxYC8I3cUTjZv4W+OJ///Cjmz7fdkFEWM7c2v2LD+bxgtCm
	UvE12J9cv51fZKYFbxV3z3Q66qb+vqeLwKYZ2cDp4Pix7WY6RFG5DcLkjTk6PUB4ZGcKsTXPL4f
	QTniHKMnlq8WzVkc+9y6xQEJPkpiwMlKcVQvXbstqvno1a0RRmPfoQIE5e+bhYIRb45o8nozWyY
	y/Jp0tvgkY3Ey4P6w==
X-Received: by 2002:a05:6000:491c:b0:488:8546:d0b2 with SMTP id ffacd0b85a97d-48dbacf06ccmr2124854f8f.51.1791537039476;
        Fri, 09 Oct 2026 02:10:39 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9463499sm2693592f8f.3.2026.10.09.02.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:10:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-reviews@lists.linux.dev, Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: xilinx: fix NULL pointer dereference in
 xvcu_clk_hw_unregister_leaf()
In-Reply-To: <sashiko-outbox-164950@kernel.org>
References: <20261009061805.3172589-1-vulab@iscas.ac.cn>
 <sashiko-outbox-164950@kernel.org>
Date: Fri, 09 Oct 2026 11:10:38 +0200
Message-ID: <1jfqyfp7ch.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ven. 09 oct. 2026 at 06:33, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] clk: xilinx: Use-After-Free due to incorrect child/parent unregi=
ster order
> - [High] clk: xilinx: UAF race during removal due to mixed devm/manual cl=
eanup
> --
>
> commit 7f74ba5d4aed358cc163ed1eb7e56a50f1f385b0
> Author: Haotian Zhang <vulab@iscas.ac.cn>
>
> clk: xilinx: fix NULL pointer dereference in xvcu_clk_hw_unregister_leaf()
>
> This commit addresses a NULL pointer dereference when a divider has no pa=
rent
> by checking that the mux is non-NULL before calling clk_hw_unregister_mux=
().
> It also removes dead code that erroneously checked the divider instead of=
 the
> mux.
>
>> diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu=
.c
>> index ccd9d7c0b1809..58a9762ef20a9 100644
>> --- a/drivers/clk/xilinx/xlnx_vcu.c
>> +++ b/drivers/clk/xilinx/xlnx_vcu.c
>> @@ -516,9 +516,8 @@ static void xvcu_clk_hw_unregister_leaf(struct clk_h=
w *hw)
>>  		return;
>>=20=20
>>  	mux =3D clk_hw_get_parent(divider);
>> -	clk_hw_unregister_mux(mux);

should deregister the divider here

>> -	if (!divider)
>> -		return;
>> +	if (mux)
>> +		clk_hw_unregister_mux(mux);
>>=20=20
>>  	clk_hw_unregister_divider(divider);

this last line should be removed

>
> [Severity: High]
> Does this unregister the parent mux before the child divider, leading to a
> use-after-free?

Yes, the function clearly has a copy paste error than you should address pr=
operly.

>
> Calling clk_hw_unregister_mux() first reparents the divider to the orphan
> list, but leaves divider->core->parents[0].hw pointing to the mux struct =
before
> the memory is freed by the mux unregistration.
>
> If a concurrent thread registers a new clock, the clock framework invokes
> clk_core_reparent_orphans_nolock() to try resolving orphans. It iterates =
the
> orphan list, finds the divider, and calls clk_core_fill_parent_index(), w=
hich
> reads the dangling entry->hw pointer and dereferences it:
>
> drivers/clk/clk.c:clk_core_fill_parent_index() {
>     ...
> 	if (entry->hw) {
> 		parent =3D entry->hw->core;
>     ...
> }
>
> Should the teardown strictly follow leaf-to-root order (gate -> divider -=
> mux)
> to prevent orphaned children from dereferencing freed parent pointers dur=
ing
> concurrent reparenting?
>
>
> [Severity: High]
> Does this manual cleanup race with the devres-managed OF provider removal?
>
> Because xvcu_register_clock_provider() registers the OF clock provider us=
ing
> devm_of_clk_add_hw_provider(), the OF provider isn't removed from the glo=
bal
> clock provider list until the devres cleanup phase, which executes after
> xvcu_remove() returns.
>
> By manually freeing the hardware structures here during xvcu_remove(), the
> active OF provider is left with dangling pointers in its internal hws arr=
ay.
> If a concurrent consumer invokes clk_get() during this window,
> of_clk_hw_onecell_get() could yield a freed clk_hw pointer, resulting in a
> use-after-free in the clock framework.
>
>>  }
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009061805.31=
72589-1-vulab@iscas.ac.cn?part=3D1

--=20
Jerome
