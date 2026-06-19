Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C596833D4FB
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 21:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781903993; cv=none; b=PD0clpgIyeueIx0TzWkjiJeedWVEnLio7UZXo5ddbudVNRF0/3ZVHGB5tH0UDu2zA6fK2mzf5Rr2r8onEFko+pTFj51nBn+cSqmkGOk+cKre0lcjQGuOVLaf/n48tNMFU4Oex3tLWG0bzlcvJwg8yTRbtuz8qwBvQuHQadfurm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781903993; c=relaxed/simple;
	bh=Z1v7oK08s9cX9ai3rtGVy+hD16fiw/Yo5ZmR3yMmw6U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=D5ZevaFtVT4Eo5jgJIpnKOvZ76Kw0Pv02xSc7Y6Q5FUDTHbVplkPQjraZIcictksXsRdLlOXRWniW3wPfav3W0TYj4FX7odfnu4BcxlL4SDhdx1l4xBOElkrCuMnZqVoOLcfartdeJ1kfSQOFooKIC/b7OLC5hsFl+y6CXkyFk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coumUBfv; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coumUBfv"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso33610975e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 14:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781903990; x=1782508790; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPe7xhOch75yXx5Pu0qv+8+PGvLXn4ZjaQ2xwLoyw08=;
        b=coumUBfvo6S0O9LbOeZgAxC/33RInZnEN1kcBqb6KLa2x8RC41tSyr9dOBW6LcP60m
         RL6EnpV0s3n5b7YoFcsZ6Yof7ZbpS75Y63vC6YDKb3+IX4wpO3YOLC9YnKUapKg8JQle
         a2fOX6f9PVi9/R/vTi4E/46YrTfOIHUE8il1zWScopBKtu5Hv8EIBSTghI8dpKD1iOGq
         gNJz1iwK09nMMfPEd4B1OzE6ePC9u26+aKfT/7fqJYiNjCXdZtE/wfS88CAXam//lKWg
         zGRfI+mK9fFfEnXgdVqky3dOrfQR3nnS1jZXrk3pdcqOBsTz30pwVlY1HHmubYeJXoZg
         JzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781903990; x=1782508790;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aPe7xhOch75yXx5Pu0qv+8+PGvLXn4ZjaQ2xwLoyw08=;
        b=ErhoLC9E4JiiHjcgi/+rwiMO7yxuWfmE0GDFwLqYXlzlzm/NkW4sS6T0JfM+8HNk0J
         cEFyNat99Y96mhMbFUfaMJkhejVbLziXgrmiwEyb/IWFl9sT/1+/VJnu67oXfihRWbJk
         MV1gIGbeq7are0BQTuM+XU1UijIHp9IGDCu3dMluVgZ/YYbhyK9YGvcUhipjUJKUi4R5
         /kBrn08wAhKxhY7iGS3ZnMTjUAOhNPYYgL8mL448urop2dBi/9CdJtwpD0bc9OoHa1cX
         T58NBieWm3CVQ+jG/dlnm+/NAJC6VT7Um0Jc8syfzbMRnHhq1M/iZmV7iSMbtxR+S32n
         E14g==
X-Gm-Message-State: AOJu0Yx/A9WEOM1vmE1Qn9RT76KClen8F+WnD7QQqHsMeQfQWSisSNa8
	drCvyJWJ5X+ar7Voi7F9+21wqWljCjsSSp6b8rS+MubGo6B/rHibhROMPhZV0Liy
X-Gm-Gg: AfdE7cnjDa36L6zjbA+KSZ/abCPkuoI2WJOhBuBeEggRE8P5ZrWql0AdqOpssYQNrJ1
	ck+8B0V2siwO5gQR4gzpxOWAwNeAAkgmcvZXS4c5hkwQ5LmkBwecQAAg7csBFgWQOdG3zXfsFnH
	GhWnA04noAwGs4znow3oftYfdQRdfAdJYTzZlM/d7EgYIsjnHnr+HwFL5zoDqUWkQab45yB0p5A
	lfUWcD81FUHxBFwVAXkVSJvDThlOZEAO/byHJa3GP9bKO1K95Wqgz4GiqHWS+zydo+Ohfb7CAcr
	HO1dPZZq3jcr1+/d9NKQZUKUKbf1fsG/AwfAWxbOu3t0nOMrahPGbyWWWPgpTzST0xRgaAdSZfQ
	m8GBSfNl44xofKZ/aPwcvanHutb0anNLM3nbIcazdAz55kLgc2308Su3FvxQsVuwovw5payE6tc
	SKuBka1mwCg3yhWNf8tVbM3FqSzpS2fSTApfptmK9MC935h8ULRjncDt0SMQ0XXY0Ox77VQGdmC
	jjk7fOq0f6orEw1qS2f8hLzBW+fRiMpW/bEyByqfSMgfgfWIRUwNa0=
X-Received: by 2002:a05:600c:5252:b0:490:bd1d:4732 with SMTP id 5b1f17b1804b1-4923f579333mr93310165e9.23.1781903990201;
        Fri, 19 Jun 2026 14:19:50 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff821aasm97351255e9.12.2026.06.19.14.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 14:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Jun 2026 23:19:49 +0200
Message-Id: <DJDC8VWEQND5.F1DEG4W53SB7@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 07/17] bpf: Track verifier context
 diagnostic events
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260619205934.1312876-1-memxor@gmail.com>
 <20260619205934.1312876-8-memxor@gmail.com>
 <20260619211353.0B4201F000E9@smtp.kernel.org>
In-Reply-To: <20260619211353.0B4201F000E9@smtp.kernel.org>

On Fri Jun 19, 2026 at 11:13 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Hardcoded depth for IRQ contexts breaks nested diagnostic hist=
ory anchoring.
> --
>
> commit 86418a115dc1ef24cac1a623674bfd700c69c32e
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Track verifier context diagnostic events
>
> Record verifier context transitions in the diagnostic history to anchor
> causal paths for lock, IRQ, RCU, and preempt regions. The depth of the
> context is used to ensure nested regions correctly anchor at the outermos=
t
> active region.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 93941deb2cd8c..e584dec04b34d 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
> [ ... ]
>> @@ -1473,6 +1475,7 @@ static int acquire_irq_state(struct bpf_verifier_e=
nv *env, int insn_idx)
>>  	s->id =3D ++env->id_gen;
>>
>>  	state->active_irq_id =3D s->id;
>> +	bpf_diag_record_context(env, insn_idx, BPF_DIAG_CONTEXT_IRQ, true, 1);
>
> [Severity: Medium]
> The commit message mentions using context depth to anchor nested regions =
at
> the outer active region. Since BPF allows nested IRQ disables (for exampl=
e,
> via multiple bpf_local_irq_save calls), does hardcoding the depth to 1 he=
re
> break that behavior?
>
> If a program nests IRQ contexts, multiple enter events will be recorded w=
ith
> a depth of 1. When bpf_diag_history_context_start_idx() searches backward=
s
> for an event with a depth of 1, won't it stop at the innermost IRQ enter
> event rather than the outermost one?
>

Good catch in both replies; will fix in v3.

>>  	return s->id;
>>  }
>
> [ ... ]
>> @@ -1552,6 +1561,9 @@ static int release_irq_state(struct bpf_verifier_s=
tate *state, int id)
>>  		if (state->refs[i].id =3D=3D id) {
>>  			release_reference_state(state, i);
>>  			state->active_irq_id =3D prev_id;
>> +			bpf_diag_record_context(env, env->insn_idx,
>> +						BPF_DIAG_CONTEXT_IRQ, false,
>> +						state->active_irq_id ? 1 : 0);
>
> [Severity: Medium]
> Similarly, won't this hardcode the exit depth to 1 if there are still out=
er
> nested IRQ contexts active? Should this calculate the actual number of
> nested IRQ contexts instead?
>
>>  			return 0;
>>  		} else {
>>  			prev_id =3D state->refs[i].id;

