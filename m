Received: from mail-wr2-f0.google.com (mail-wr2-f0.google.com [74.125.225.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD5D35AC07
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 17:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705213; cv=none; b=ZolxjdbggRS9zzuL5My0JYf1PIlPFOkpyXLI36UEq1ADgalerP+izEsesHCnOZR2c43WWGmV5KKB6OsE6z21E6frhixkqLpPmELAiQmsDyyByyRhjg68HLpJrOgHO3Hvn7gqBP7trsJOdYl0wiObQPahIAoC6NMem9Jfu0GKRR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705213; c=relaxed/simple;
	bh=XPEclRDiV6omwaNGtbkvqNxg8v1YbFaAyQAFObbhTHM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=i0C+NapfzGqQl5PqwFTV1J8VIISa+xq/A0daZNWIScQyurWYc12NRPcz1RN/quQHP5C6Ul57VvgTLR+rEdAc2I1DzSG+9VkBf+b6m9va5RvySiXd6wl3ov5N9Bea+X2O5rHSUvs93gFxfSv7lv/hrXYIiq/a3qOVSS3Q4BeKX/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJEUKfQH; arc=none smtp.client-ip=74.125.225.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJEUKfQH"
Received: by mail-wr2-f0.google.com with SMTP id ffacd0b85a97d-4744516a312so148124f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 10:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783705210; x=1784310010; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/5RW30ZGJk1qNi/VtLris2HIPVm+vUZFh/AIp9+9TfI=;
        b=hJEUKfQHOxRVLhiGrE9WFgQsKQYnEtlBADGGSNcbtDe4WtMHvrMR6s/swkLebSFnDl
         azqpg8icqCinGoQfbDPX2xAEO0sdUAYtZwJYBkVlUVj3a6lEKNNSqJR5AIIkAb8LUYSG
         jaVRhegQjhfIpJRoU553nbCTxMoNaeRxug4ugsUv0YEsWhcjeTKAXnUZcijhLJCshRiV
         dZcavt6RrCz5SYO2LP/Xw5O+MKnpWle8dCblc41UcR76wM5wG//OtgQgbKmsRYNmcFab
         j9/7hIMzKJiknejvPDOhDxg3Y1DaUTZ+nktxcjHdXHs/apfTDq6L89WzvCMCgWoe2J9z
         wWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783705210; x=1784310010;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5RW30ZGJk1qNi/VtLris2HIPVm+vUZFh/AIp9+9TfI=;
        b=FG1vCcXU4Uk6Imwb697Qdt0FhdzX1pjNDNgQ4vItgU+IILJN7zpL91kJl7rt2syfwM
         hYmSA26bQOCdtw9X6TL698+HJigVuu4DJfon75bPibcwvp0WVHyOhnWytPug9GH0Rzr8
         gsawf/zrQZyawjsC6a0kDDLF45+V3Cjl7TQsAGh1RhO8TizGCiK3CMdwkYJw897hHpmD
         JsP44DaBsKYj430eRDZF3xkn4AnGwkK7WLj87AGLMPATCnp1iGczo2CiBovsxj+NpEio
         DUoEPVt9/Dg4rRz2RwUpXJv4pUkXDUN8s8n5vNBYtJihPbUkM3X3ZALo2MyRheu520a4
         aTFA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6JYbOSqekaEiqFM2etWyxo2uYssNmLhk8AR0V43wC+4HH5KLbSAvO7hMKm6BBsYZPnVqGPVOZ3NzCQp7nbC8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTNCvHrSYmo9aHmPiksMAJbyW1xVxFMn2hIC3z1NBzJchT4/MS
	m80LuxZrmrq0wDfJw5rhsXmVq4Hj5oStvUw3esdLzJ5Ww6+0/49rrqOz
X-Gm-Gg: AfdE7ck1bm4M2AQ6AOzvnMZDzfXFzwCeS1F1bkmjuQrybQfq1qTg5FAb4qhwZegiGnw
	ittmrdeJnB2uuEnpCHzDI2FadVxkstkhFCFiJDBjWNQq8ufmVgQOcJvODQw4KCkC/8OdCkOPlWm
	tl2G+ge5eCnj6gojjTv0vFLDC4emb3XdbsKiG71XmTZTfGAAliPYCLtybOkPpjgcCb4s5aw0gm4
	uS/tZ/vnY/azENb4h2Lh4GJH/a31t58cG1DLvrLwESg1T1h+ndoAvoDdLa+ebYKQ78BdqDkbmmw
	UY7XMcQ5o0JL0fIKyYto8RPH50iulNW9G+MZ0LsXUV+XAdMGk2+PcM50nXY5/umf5PTdevL5CgL
	cLYcToFlu+w4+Yl5UC+biLN2xFq1b56xaTkdi1Oql0xa+QK47duxc+X65E+5MntecCWAXj0gVJF
	PhM9C0Vzx4rLoGiDa8Vz0i2wvh1tq6QQdNj1FuZQKcxvMu3OnxILdZ4uqRKt/YwOGM0vzoUfyvu
	ZuzfFKC/vN0Rlts5SCIv9hRItyFQ6EXLeio3LXNuiqgqorjrdiZVDvq5v/roHgHOA==
X-Received: by 2002:a05:600c:4ec8:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-493f2b445dbmr41872275e9.16.1783705210491;
        Fri, 10 Jul 2026 10:40:10 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d5055sm153090725e9.5.2026.07.10.10.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:40:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 19:40:09 +0200
Message-Id: <DJV2Q54OF8BU.1H6KXCS93P3N6@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf v1 1/2] bpf: Fix tracing of kfuncs with implicit
 args
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260710005902.2234832-1-ihor.solodrai@linux.dev>
 <20260710012112.577F31F000E9@smtp.kernel.org>
 <ce047740-79fe-4fc5-a118-40252b169be8@linux.dev>
 <DJV2D826YVRY.WSTQ4Z6CFX1I@gmail.com>
 <7a5bb678-4fab-44c8-98b5-272124e08847@linux.dev>
In-Reply-To: <7a5bb678-4fab-44c8-98b5-272124e08847@linux.dev>

On Fri Jul 10, 2026 at 7:34 PM CEST, Ihor Solodrai wrote:
> On 7/10/26 10:23 AM, Kumar Kartikeya Dwivedi wrote:
>> On Fri Jul 10, 2026 at 7:08 PM CEST, Ihor Solodrai wrote:
>>> On 7/9/26 6:21 PM, sashiko-bot@kernel.org wrote:
>>>> Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
>>>> - [High] Accessing `btf->kfunc_set_tab` without holding a module refer=
ence causes a use-after-free vulnerability.
>>>> --
>>>>
>>>> --- Patch [1]: [PATCH bpf v1 1/2] bpf: Fix tracing of kfuncs with impl=
icit args ---
>>>> commit 13df91bf669b3a55c459c1663fbf726f9f52bc5c
>>>> Author: Ihor Solodrai <ihor.solodrai@linux.dev>
>>>>
>>>> bpf: Fix tracing of kfuncs with implicit args
>>>>
>>>> A kfunc marked with KF_IMPLICIT_ARGS flag takes implicit arguments
>>>> (such as bpf_prog_aux) that the verifier injects at load time.
>>>> resolve_btfids strips those from the kfunc's BTF-visible prototype and
>>>> keeps the real kernel ABI in a counterpart _impl prototype.
>>>>
>>>> Link: https://github.com/sched-ext/scx/issues/3687#issuecomment-490669=
4106
>>>>
>>>>> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
>>>>> index 64572f85edc83..20aeca6b4f95c 100644
>>>>> --- a/kernel/bpf/btf.c
>>>>> +++ b/kernel/bpf/btf.c
>>>> [ ... ]
>>>>> @@ -9114,6 +9114,26 @@ u32 *btf_kfunc_flags(const struct btf *btf, u3=
2 kfunc_btf_id, const struct bpf_p
>>>>>  	return btf_kfunc_id_set_contains(btf, hook, kfunc_btf_id);
>>>>>  }
>>>>>
>>>>> +/*
>>>>> + * Return the union of a kfunc's flags across all hooks.
>>>>> + * Unlike btf_kfunc_flags(), not restricted to a calling
>>>>> + * program's hook. Used when attaching to a kfunc for tracing.
>>>>> + */
>>>>> +u32 btf_kfunc_accumulated_flags(const struct btf *btf, u32 kfunc_btf=
_id)
>>>>> +{
>>>>> +	enum btf_kfunc_hook hook;
>>>>> +	u32 *hook_flags;
>>>>> +	u32 flags =3D 0;
>>>>> +
>>>>> +	for (hook =3D 0; hook < BTF_KFUNC_HOOK_MAX; hook++) {
>>>>> +		hook_flags =3D btf_kfunc_id_set_contains(btf, hook, kfunc_btf_id);
>>>>> +		if (hook_flags)
>>>>> +			flags |=3D *hook_flags;
>>>>> +	}
>>>>> +
>>>>> +	return flags;
>>>>> +}
>>>>> +
>>>>>  u32 *btf_kfunc_is_modify_return(const struct btf *btf, u32 kfunc_btf=
_id,
>>>>>  				const struct bpf_prog *prog)
>>>>>  {
>>>>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>>>>> index 6515d4d3c0032..fde11a2f6869a 100644
>>>>> --- a/kernel/bpf/verifier.c
>>>>> +++ b/kernel/bpf/verifier.c
>>>> [ ... ]
>>>>> @@ -19121,8 +19146,8 @@ int bpf_check_attach_target(struct bpf_verifi=
er_log *log,
>>>>>  		if (prog_extension &&
>>>>>  		    btf_check_type_match(log, prog, btf, t))
>>>>>  			return -EINVAL;
>>>>> -		t =3D btf_type_by_id(btf, t->type);
>>>>> -		if (!btf_type_is_func_proto(t))
>>>>> +		t =3D btf_attach_func_proto(log, btf, btf_id);
>>>>> +		if (!t || !btf_type_is_func_proto(t))
>>>>>  			return -EINVAL;
>>>>
>>
>> Also, why not do it for BPF_TRACE_ITER case as well? I just feel keeping=
 it
>> consistent may outweigh figuring out whether it's necessary in that case=
 or not,
>> etc.
>
>
> I mentioned this in the patch description:
>
>   The BPF_TRACE_ITER case distills a registered iterator's
>   prototype, and bpf_struct_ops_desc_init() distills the
>   function-pointer members of a struct_ops type. Neither is
>   a kfunc, and so can't have implicit arguments.
>

Yeah, I saw that, but abstracting that inside the function and not having t=
o
think from the caller about those details would be better. That said, I don=
't
have any strong preference, it is obviously correct as it is.

>
>>
>> Please supply a cover letter in the next version too since you're sendin=
g
>> multiple patches.
>
> I used the first patch's message as a cover letter, since it's
> just a fix + selftest pair.
>
> The series could be split further into refactoring changes, but I thought
> it'll be easier to backport if the fix is in a single self-contained patc=
h.
>
> I think we want the fix to get into 7.2, and backport it to 7.1.
>
> If it's ok to carry separate refactoring patches there, then I'll split.
> Kartikeya, wdyt?
>

You can still keep the patches as is, but just add a cover letter, it will =
not
affect backporting. The cover letter is just to summarize the series and th=
e fix
in the merge commit. Also, my understanding is that with the Fixes: tag, it
should automatically be picked up for stable kernels.
