Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3E824A076
	for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 02:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785031323; cv=none; b=mVfRMvzWqrJDH9PNaTKZ/UmtzEq5orr1W2Ft5AVVX11eN3TqecfuTcWxCznIbyjogGs2hOOxOiKmVcy4bmpPXdA65ZnJG2TWiQcUMQG3DpHEsIZ1gvBvX+Z5LX/gRm7/mPSlQxlZ5gO56c1MSrL+EpTyddXHa1GibMhUbcKOBu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785031323; c=relaxed/simple;
	bh=LzTG6H3sflel7BZtGJ95D3gkKtDDlMTm1VHq+AiAU/k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MtwY0G/5embvTC1fZLe25ory2cyK/cnURRNDSqdbaezDe/P2WHm/VgbNDYRc7uKgToM/6f5y0Z4uFdmRpsj0O/niFcLhRqJDe8elyPuBq4Mpg5zHGVANnrC7Mnm4lsPBBNo+BXroNh3rL3NlkPCsJ4KFsYh7vdz7W+Zh62hjthI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4uKk2J7; arc=none smtp.client-ip=74.125.225.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4uKk2J7"
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-47f9c6bc99eso546339f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 19:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785031320; x=1785636120; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Icq5OMx0iLqWZS2dmdktmdTaUjitNjJ7m6dxMi93PFw=;
        b=J4uKk2J73KjKCLvzrJqKBVcZquM4qROInznlaVaeKZ+AiHvOvUhVef05dS+Lq2EyaE
         PeND3Q+Pn/kz4UQnoVILTrpAab3SfpyqgKn2yucP8eM8lzq6DGYUlamn29VNyQBFoSv7
         WJgYj/73DeTI4qDNyyYoIVW2rv8kFhRVvtP0gQmkvohZz5Ib7Mh3JdDCBR/iQ8i/HICR
         sA3N91b1sZACcP8z32VjWCGXRjEFsz1W1cCIpUURWu4hvDgWgm7NnvLxVJBBdRuNa+ox
         hj1BnrMC+Krqyj5Ldr3SINC++VSjTGww9CQ3F71YfVxr/I2PecmS7699i+d1+6IHRU8R
         u5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785031320; x=1785636120;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Icq5OMx0iLqWZS2dmdktmdTaUjitNjJ7m6dxMi93PFw=;
        b=n3lwvkgxKdUtShzNNGCfQ7lydoN7BPDX7kQbYVRVm6QRwVhW4NrBOcW2AedFPZFAwh
         Mrp3qgli/N43dPwFLxtV31PGNK7HhuYONsNhWFgSrHYApLIRLRMHBjr7LrvKkOjlwEOh
         Qb8IgUxpJ0dd1OKmMbi7dogWzR/D1Pv9OZoXGAi1bhL5mSQm2WFRyCLCEkJwVOJLnFUD
         luSLC47Sf9BfESO7t+J5GL6YvxaBhiBda0XGeS8gmwNyWFLnaqs+fy43F8EVyrGMeTwA
         sRDYOrjiDxo2Qb4TJ6rIQm1tDHmNrLoqamwQ22AT43gu4E8W+pbRKJ+eFy5I46DPAEba
         yutQ==
X-Gm-Message-State: AOJu0Yw+j+d/jt/fthlbk4EAH5A+hqXMWYYXgydZBEnQq9onrzFlW/J9
	Und4aykMY6H/otyuHpB3kLQvQKOQwOMo/t7mIC7Gx+gDbMrpheBzEE1PoJn27YiF
X-Gm-Gg: AR+sD13XDmcYRDwHJwwLNCcDyFu9qTs5AfPtwG31hT3z1twHjM+JfMDX/5hWch8X0TX
	eNt6ma8Brm8V9YmWNbvCbLJCnzjOauySnevBpAV2QKb9n/TP7L1O84ZutbAq5nJONAVRb5QtU64
	KrqyMxZHer8jCRAwEb6zoiLmbfyUVwNTofTMfSIP3Zkj9VPX2tcDKNbe/Rxl44CqmJ8rYyuERfz
	lfXD2wJPuE3Mn9NC4xJ1i607nj6pSkNK57HGJGsjHwNnlf+f5DvPkGol6PIfmC77s09Zvmfbwbe
	Ed03MPorE745RTQzR4XFoUoinsS0Typ/mmgPqIpDtkD8xdtclj/chydZIg9RS99OdtWeBRxM9Tz
	ZTHRkP+cr4BBL9q7vQ2TWOhQT2NfR9rBLAxn2+8h6jWGMn4qn+us1/qCrKXa07RjBuobawYB/JD
	s4DIoMTSG25IqxBIzhSw2H8lbDOhTqBb+pxXaSjsq1sTavN43u4rUJG7rxE3+5cPtBgBygoZcqn
	wBk9eCs5XHjiHug8ivvXIQOeuz1S6mmHp+wP0dy5UCA
X-Received: by 2002:a05:600c:4f56:b0:495:4c62:9d43 with SMTP id 5b1f17b1804b1-496b747487bmr39215725e9.34.1785031320118;
        Sat, 25 Jul 2026 19:02:00 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6dc25sm36021351f8f.33.2026.07.25.19.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 19:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Jul 2026 04:01:59 +0200
Message-Id: <DK84SJFF77GL.1VGZ5Q21VUPXC@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 1/9] bpf: Support __arena and
 __arena_nullable kfunc argument suffixes
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260726013105.3689867-1-memxor@gmail.com>
 <20260726013105.3689867-2-memxor@gmail.com>
 <20260726014755.2DA7D1F000E9@smtp.kernel.org>
In-Reply-To: <20260726014755.2DA7D1F000E9@smtp.kernel.org>

On Sun Jul 26, 2026 at 3:47 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The `__arena_nullable` kfunc argument design uses a 32-bit trunc=
ated value of 0 as a sentinel for NULL, which collides with valid memory al=
locations from `bpf_arena_alloc_pages()`.
> --
>
> --- Patch [1]: [PATCH bpf-next v2 1/9] bpf: Support __arena and __arena_n=
ullable kfunc argument suffixes ---
> commit fb759ca6f84030ccde9ee83f1e83634342bdae0d
> Author: Tejun Heo <tj@kernel.org>
>
> bpf: Support __arena and __arena_nullable kfunc argument suffixes
>
> This patch adds support for passing BPF arena pointers to kfuncs by intro=
ducing
> __arena and __arena_nullable argument suffixes. The verifier processes th=
ese
> suffixes and allows JITs to handle the translation (rebasing) at the call=
 site.
> __arena rebases unconditionally, while __arena_nullable preserves NULL by=
 skipping
> the rebase when the arena offset is zero.
>
>> diff --git a/Documentation/bpf/kfuncs.rst b/Documentation/bpf/kfuncs.rst
>> index c801a330aece0..9809680bee43e 100644
>> --- a/Documentation/bpf/kfuncs.rst
>> +++ b/Documentation/bpf/kfuncs.rst
> [ ... ]
>> @@ -250,6 +250,33 @@ Or::
>>                  ...
>>          }
>>
>> +2.3.7 __arena and __arena_nullable Annotations
>> +----------------------------------------------
>> +
>> +Both annotations indicate that the pointer argument points into the
>> +calling program's arena. The JIT rebases the value at the call site so
>> +the kfunc receives a directly dereferenceable kernel address, subject t=
o
>> +the access rules described in :ref:`BPF_kfunc_arena_access` (at most
>> +``GUARD_SZ / 2``, 32 KiB, past the pointer in a single unchecked access=
).
>> +
>> +With ``__arena`` the rebase is unconditional and the argument is never
>> +NULL: a value whose lower 32 bits are zero arrives as the arena base
>> +address (arena offset 0). The kfunc must not check the argument for NUL=
L.
>> +With ``__arena_nullable`` such a value arrives as NULL instead and the
>> +kfunc must check before dereferencing.
>
> [Severity: High]
> Does this __arena_nullable design cause a collision with valid allocation=
s?
>
> If an arena is mapped at a 4GB-aligned boundary, the user_vm_start addres=
s will
> have its lower 32 bits as 0. When bpf_arena_alloc_pages() returns the fir=
st
> free page at offset 0, the resulting user pointer also has its lower 32 b=
its
> equal to 0.
>
> If a BPF program passes this valid pointer to an __arena_nullable kfunc, =
won't
> the JIT see the 0 value in the lower 32 bits and incorrectly pass NULL to=
 the
> kfunc instead of the valid arena base address?

Yes, but it is intentional. Referencing the first page is equivalent to NUL=
L, or
start of the arena "address space".

>
>> +
>> +An example is given below::
> [ ... ]
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 641c3c62c1ecf..f3e6190f639e4 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
> [ ... ]
>> @@ -12056,6 +12066,35 @@ static int check_kfunc_args(struct bpf_verifier=
_env *env, struct bpf_call_arg_me
>>
>>  		t =3D btf_type_skip_modifiers(btf, args[i].type, NULL);
>>
>> +		if (is_kfunc_arg_arena(btf, &args[i]) || is_kfunc_arg_arena_nullable(=
btf, &args[i])) {
>
> [Severity: High]
> Should check_kfunc_args() or the arena allocator ensure that offset 0 is
> reserved?
>
> If offset 0 is not reserved, the verifier will allow programs to pass a v=
alid
> offset 0 allocation to __arena_nullable arguments. The JIT will then sile=
ntly
> translate this to NULL, causing unexpected behavior in the kfunc since it=
 will
> assume the optional argument was not provided.

It will always be left unmapped in practice.

>
>> +			if (verifier_bug_if(!btf_type_is_ptr(t), env,
>> +					    "kfunc %s arg#%d has __arena tag on non-pointer",
>> +					    func_name, i))
>> +				return -EFAULT;

