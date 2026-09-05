Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3E038B14C
	for <sashiko-reviews@lists.linux.dev>; Sat,  5 Sep 2026 05:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587784; cv=none; b=rwqDDDUduCODrmw2w03jJszjMNxu00B2xb9NO0Ad6r6gGhW9qNKgvKHu8RsSg1GSn4WLrtT5yDrkDtQyD26X4dzs7I5j7qlz8Q3O7nrWGCZl4WNZ0bHuwiec5nWSpkxCA+IvNOmO+tWYcvu+G3HJpEzJfiSkDVGAVqMjrcquy54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587784; c=relaxed/simple;
	bh=5J0/tLoJ0hPoJDtGlDy225FbMONZPc+PxaNejPvpmgc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=c0z2576LsYz2ZD/viBLJigsuXTFczIvQrvVBBMBeQ39pMAvqQEBbBPhHboFrZXy5CYtGBWnkCXbEAv9yVkWHwmWYhFzOnt4bmpXVzYsDRkhdf2Z4yd62J/nPHA2eoHIAYiGcpVhtwWYEyRbc/tcfA8OgbeK7j7GOhdbtZz6AHvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjkA8SIq; arc=none smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjkA8SIq"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-499aaf0a723so6019485e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 22:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788587781; x=1789192581; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DErHoq9A+qfWlaDw5ATm8uO9TlTcQmGS0EfdQCaIaZs=;
        b=LjkA8SIqgi+B3ZCbU+NWl7JXH6k1nPEAfutPdcCx+d0Re4MkUJ/mPz0AbOmzxOqnJz
         1evI+4pKFfPxRc6CbJk8/TeS0aKPEx73/EJ5AxLb5Wunk9kPRXBZa6+oR7PF/CaVAyO4
         ssMLTOovUqBoYzD7jx2Mzl2nwcobkwXiBCwJ94gZNvZsXw6QA9/OZPr0fKkFYtIbxpBy
         9a1acS1XV2u/rmHEl42gNvx7yJHgd6hFNfDeFCXDjPrzsxszlf2FKTeBZ8ArIaSHXaDS
         UyZdnadfS0C0IE767LGgdUiingEUB2jwRwXmCmLYcSoxce/p6XjcBbzr528ljQmUOb4j
         0kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788587781; x=1789192581;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DErHoq9A+qfWlaDw5ATm8uO9TlTcQmGS0EfdQCaIaZs=;
        b=DO1nwi1oDBVlZi4vmTzSQcmC8+S1YleiQi8CskUDMTpyDfrvbZ41+86gqpdkMQ67uN
         vTBeS35B9OYCC5Bmp4PJlMIpMdVR+89GSfNMygQFtECQKaZqn81sl8QBjZQkrvQp4wvi
         DlYCIkte/xHoWVtOG61OJWa3tXe8NN42LUKSTiDEOB84ynZZl1iMJy2v7PCwur5QbWxM
         Neg/xuSX6XFx89E2wexYL4hVfmUUwTa9a9rvgew7uYVTPaTRJgww22W3svlk9anvRlFh
         r6KGzc/ZizpKttKOeeyvAWjFg1AuxjisjKs7vI6R/s1+paNGTWfm12MnyHNvkiDdsAEC
         od4g==
X-Gm-Message-State: AFuF++kQHD0vFP7F7x0jw0qwsSsqYnCNBkQDDpEcGHd+7fEgiIUcBTA4
	FxDJ6KQb/KW750GWqHlsFpPc1XGinDTIdipI/A/0mckLu6V6IYdhEGgLDGJtbEkw
X-Gm-Gg: AYBFou0mqvfcdyz4tECYFlZD4OgpxK/kyxxEorJ/mVosdI0b6DwLbVW+PZBt1+jCfkv
	KxFLxvuQlG31hPZZoHGVsrASP1wPRwUxVUTE18ICswqwKRSIf1vPYH/stx0BCrs1RVzBzBcwx7M
	mOUUZbQt9tdUo55+wXNczyghbBPpxHGh54kW0i7Ng01+vrGJh4BIzPJpmLb0Rb07vQT4Qyrc4bL
	yUuz+apFCTF+WCiiWhaiwKHbyBVDNj/Sk2V4bLd63eg8MTP/HyZyq7C4jzJPblxAg5TAgu9OpeE
	sjiukM9vhc/yEsr7cmQO7ul1pEaEjfgnpmPqxLjm0awm/udXIrZQlrjj+zPKauL7/ehbMPFjXhQ
	zz6aSPaWMe9nx6ZgTo69//FZ+Rg5Dqf3IZe/RE9mNBGM5JG4atRC23jyy2Jwr3CqdGJqH/5ZICB
	ASFSGyM7PwLXhe+NAFZe71p74NJWIWjqTQxSce9vcYVocEwUJ0UbKUSZRDqOjj16eCOv9nmjWP0
	aI++A+A+KATJlIQXHX4e549vZ6D3xLMly5XdWKShBBjitOFXv7ANEXkZjb1myHc+oC4T7kVK5WZ
	GHTT3tyYa8kxVYtKPb7K0t8rQc0=
X-Received: by 2002:a05:600c:8b09:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cf823f57fmr202579595e9.10.1788587780908;
        Fri, 04 Sep 2026 22:56:20 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm227465215e9.1.2026.09.04.22.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 22:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 07:56:20 +0200
Message-Id: <DL75GB02N34V.3IAIUPZPJO4YW@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf v1 1/2] bpf: Reject non-scalar bpf_loop iteration
 counts
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260905014735.1452988-1-memxor@gmail.com>
 <20260905014735.1452988-2-memxor@gmail.com>
 <20260905015702.5ED241F00A3D@smtp.kernel.org>
In-Reply-To: <20260905015702.5ED241F00A3D@smtp.kernel.org>

On Sat Sep 5, 2026 at 3:57 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Missing negative bounds checks for enum array indices in memcg B=
PF kfuncs (bpf_mem_cgroup_memory_events and bpf_mem_cgroup_vm_events).
> --
>
> commit 3f8d69cede626ae022617ccb30f54b8f41f90edd
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Reject non-scalar bpf_loop iteration counts
>
> This commit fixes a verifier warning and subsequent panic triggered when
> pointer values are passed to the bpf_loop() nr_loops argument. It
> introduces ARG_SCALAR to ensure generic helper argument validation
> rejects pointers before loop inlining and precision processing.
>
> Link: https://lore.kernel.org/bpf/6a9ad24c.b5d4176b.238c3e.0001.GAE@googl=
e.com/
>
>> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
>> index 3a7eb2185c354..591dfab3e706c 100644
>> --- a/include/linux/bpf.h
>> +++ b/include/linux/bpf.h
>> @@ -894,6 +894,7 @@ enum bpf_arg_type {
>>
>>  	ARG_PTR_TO_CTX,		/* pointer to context */
>>  	ARG_ANYTHING,		/* any (initialized) argument is ok */
>> +	ARG_SCALAR,		/* scalar argument */
>
> [Severity: High]
> This isn't a bug introduced by this patch, but while reviewing the additi=
on
> of ARG_SCALAR and how the verifier handles scalar arguments, a pre-existi=
ng
> missing bounds check was noticed in the memory cgroup kfuncs.
>
> Could negative enum values passed by untrusted BPF programs cause an
> out-of-bounds read in the memcg BPF kfuncs?
>
> Looking at mm/bpf_memcontrol.c:bpf_mem_cgroup_memory_events():
>
> 	if (unlikely(event >=3D MEMCG_NR_MEMORY_EVENTS))
> 		return (unsigned long)-1;
>
> 	return atomic_long_read(&memcg->memory_events[event]);
>
> And similarly in mm/bpf_memcontrol.c:bpf_mem_cgroup_vm_events(), which
> exposes validation logic from mm/memcontrol.c:memcg_vm_event_item_valid()=
:
>
> 	if (idx >=3D NR_VM_EVENT_ITEMS)
> 		return false;
>
> 	return !BAD_STAT_IDX(memcg_events_index(idx));
>
> Because the BPF verifier enforces scalar types but does not validate enum
> ranges, a BPF program can pass a negative integer as the event parameter.
> The bounds checks use signed comparisons without a lower bound (< 0) chec=
k,
> so negative values will bypass the validation (e.g., -1 >=3D 4 evaluates =
to
> false).
>

My understanding is that since enum values are non-neggative, the enum type=
 is
treated unsigned by default. But I think it might make sense to just cast
explicitly since Sashiko keeps repeating this concern and it is probably cl=
earer
for a reader (I forgot enum values would be unsigned when all enum constant=
s are
non-negative myself).

> Can this lead to an out-of-bounds array access on kernel memory when the
> negative value is used as an index into memcg->memory_events?

