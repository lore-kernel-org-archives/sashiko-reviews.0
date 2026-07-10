Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C64369985
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 17:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783704201; cv=none; b=PmP/Xfa30bzncJmFV69+U0y+k9xEkZHZhVtWQpBqh0+1ro2cLyDq14m+JE0JMBjM+00XC0nbQPkpWM+yRd40ZDzF93nu2KQnYsWpNEuAAkT1o5twLMQZ4NbgNL6d/CrKZGYKl5Vc71PkKsi7G35oNQ51AmDBhq6efNWlee3GJns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783704201; c=relaxed/simple;
	bh=HPJpattlVsDdRbwLjSNSuhzReWzzEtHwjZF7eIfoz+U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=NGMTVRpCq6yJAmYTSOckkb7jCSlC+3d5Z3YJ3MdIblklY/cGbY77TbgD2sO2HA6sI8eGGSHibMQXzXxOKC/Q5fW3TgInfTMhS1ufQHYMIvs0mudMLRzySOzrsdO74yIGt7TFtbHglAqTIGdTAj7vY4CDFpZIMZyQ5B5pUK0b85k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/vxy4dl; arc=none smtp.client-ip=74.125.225.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/vxy4dl"
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-493e63f4ef6so3109155e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 10:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783704198; x=1784308998; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mbH/pNo5nBIg0m12T3uLhjHL/lK5EzsPyhTCOwhjdSU=;
        b=U/vxy4dlG++yu68T8TXsy2sGpiVtXKq5LQNIqrQ0OzGFL0gjergNOvjAFTt79wWLDi
         6N3EQQsbCTKWssYTgt0ttma7k5jirM6bcj4/p2WuKm64i0WosubQUpd88AGD5G/wykwK
         Npu21aVXnFdzm19w+yjGYEXI9M/TSKFSg21n38iwt7N8FbtyOqfQ6DfqjWusaQKn5sNt
         nvgLPPVN5SxLClBr1MVFQHjL0yLbHDZy4A33MTt30Rj4xPM4b906So+CA9I/W0saIA41
         YRyV9ewYUMHs09soak52W+4ZUUkvuuHjCZvem41Ay9H1G8LvxEnzj0WcwN8XYqbu47RD
         +PCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783704198; x=1784308998;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbH/pNo5nBIg0m12T3uLhjHL/lK5EzsPyhTCOwhjdSU=;
        b=N5Yvvl4G46UbzzB6SRt2SMElPPQwfCPH0voUcwIwViBMT4nydh0tInve9homviCkXH
         37KaC/5mBQ+Z7MvHkt1gOGKaUWXfaupxRedo1RCtlnrv1hp1BMa/EhDQH2QjvQYnsXFl
         ujg0eWsALQgOaNJTMuzZaq+FLOef6FIO6FAqzhLnxJ0NmMRyfS7Vb065BfiAJR2Usfp+
         Ju0oqm6a+f1ac1dxKaNcwvqnBvEtsqplxOlnGAWbq4fPLKy6wmwT/ndQQYXX+VYMbF/E
         3yXCuqvOJlBRROe2bDo7SY1giy3nTHRwei3UAr4/gDhmdbtTfa6XmU2cvC9s6AEb3xfI
         5MXQ==
X-Forwarded-Encrypted: i=1; AHgh+RpaTE9+nYfaSFGJEBhm9H6Gh1I095PNiudulCCfNb0+pXaqFU+JgZoZaiVT8MtwmcJNxTNjEOqAZbxeWlSXBxM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0R53V0J0A+uj8tX+1mcA9j57WJRHgwJYv1rud5EfWD8JZgjMh
	VhU1+MqYcoqENPYsaBu3BTBQNn79DEbFovFOtSL2vqY4TF/kWtHQUb3V
X-Gm-Gg: AfdE7cltFlXDODOa5YlI8VkP6B10fukTF4F5LVF3YsNfq3CXS9rYV8K4S4NcgaFj+fk
	jW/IpgOYEnz/hB/nR4SNr7AWFPyzlKY77v3AX0DAGREv6nULQdIBV2CcH4hayWD/E9OJDIQ+ijw
	09bp6iRDCLh5n6htkoz2NcLb/iZkCVPgZ+w//TsM2za5wegTR2JNn6+ObYK5hr7nPT6sYeMuvOm
	ecxO6h13tbvfvlBfALRvuSChdmakbMVKIuuMeBVzINLqHZ/j0xDBFvdbI7WBluWarRnGAaSs8Iw
	QJexHHU/mkVk1ZoMFtthRZs35aSYaXXtZPfGUCaf1uNUOV3ewVzd95gusMAivDICTZEUfOq65uz
	NWBVmvbRyh6Q0RBQWvtPvF2ANlFaMSAV3neUvMZ4hcwtK1lDz9Yz5I65UP4ShaRCKEn9j8ygEfJ
	RaOEhxQH54LoxYTWC8vsinv6r44Ugfb48uWgAH4yh24053iV4FUSFbdy6ZdV86L6aIxUsn+F7o7
	HkRoF0uuu44UTeuq77pzpVq3TDUsumU9ipa0UIzYHbHB66kg/GEmD8=
X-Received: by 2002:a05:6000:1a8f:b0:47d:eee2:e19f with SMTP id ffacd0b85a97d-47df0797a95mr16683223f8f.33.1783704198257;
        Fri, 10 Jul 2026 10:23:18 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm62113136f8f.27.2026.07.10.10.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 19:23:17 +0200
Message-Id: <DJV2D826YVRY.WSTQ4Z6CFX1I@gmail.com>
Subject: Re: [PATCH bpf v1 1/2] bpf: Fix tracing of kfuncs with implicit
 args
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 <sashiko-reviews@lists.linux.dev>
Cc: <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260710005902.2234832-1-ihor.solodrai@linux.dev>
 <20260710012112.577F31F000E9@smtp.kernel.org>
 <ce047740-79fe-4fc5-a118-40252b169be8@linux.dev>
In-Reply-To: <ce047740-79fe-4fc5-a118-40252b169be8@linux.dev>

On Fri Jul 10, 2026 at 7:08 PM CEST, Ihor Solodrai wrote:
> On 7/9/26 6:21 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [High] Accessing `btf->kfunc_set_tab` without holding a module referen=
ce causes a use-after-free vulnerability.
>> --
>>
>> --- Patch [1]: [PATCH bpf v1 1/2] bpf: Fix tracing of kfuncs with implic=
it args ---
>> commit 13df91bf669b3a55c459c1663fbf726f9f52bc5c
>> Author: Ihor Solodrai <ihor.solodrai@linux.dev>
>>
>> bpf: Fix tracing of kfuncs with implicit args
>>
>> A kfunc marked with KF_IMPLICIT_ARGS flag takes implicit arguments
>> (such as bpf_prog_aux) that the verifier injects at load time.
>> resolve_btfids strips those from the kfunc's BTF-visible prototype and
>> keeps the real kernel ABI in a counterpart _impl prototype.
>>
>> Link: https://github.com/sched-ext/scx/issues/3687#issuecomment-49066941=
06
>>
>>> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
>>> index 64572f85edc83..20aeca6b4f95c 100644
>>> --- a/kernel/bpf/btf.c
>>> +++ b/kernel/bpf/btf.c
>> [ ... ]
>>> @@ -9114,6 +9114,26 @@ u32 *btf_kfunc_flags(const struct btf *btf, u32 =
kfunc_btf_id, const struct bpf_p
>>>  	return btf_kfunc_id_set_contains(btf, hook, kfunc_btf_id);
>>>  }
>>>
>>> +/*
>>> + * Return the union of a kfunc's flags across all hooks.
>>> + * Unlike btf_kfunc_flags(), not restricted to a calling
>>> + * program's hook. Used when attaching to a kfunc for tracing.
>>> + */
>>> +u32 btf_kfunc_accumulated_flags(const struct btf *btf, u32 kfunc_btf_i=
d)
>>> +{
>>> +	enum btf_kfunc_hook hook;
>>> +	u32 *hook_flags;
>>> +	u32 flags =3D 0;
>>> +
>>> +	for (hook =3D 0; hook < BTF_KFUNC_HOOK_MAX; hook++) {
>>> +		hook_flags =3D btf_kfunc_id_set_contains(btf, hook, kfunc_btf_id);
>>> +		if (hook_flags)
>>> +			flags |=3D *hook_flags;
>>> +	}
>>> +
>>> +	return flags;
>>> +}
>>> +
>>>  u32 *btf_kfunc_is_modify_return(const struct btf *btf, u32 kfunc_btf_i=
d,
>>>  				const struct bpf_prog *prog)
>>>  {
>>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>>> index 6515d4d3c0032..fde11a2f6869a 100644
>>> --- a/kernel/bpf/verifier.c
>>> +++ b/kernel/bpf/verifier.c
>> [ ... ]
>>> @@ -19121,8 +19146,8 @@ int bpf_check_attach_target(struct bpf_verifier=
_log *log,
>>>  		if (prog_extension &&
>>>  		    btf_check_type_match(log, prog, btf, t))
>>>  			return -EINVAL;
>>> -		t =3D btf_type_by_id(btf, t->type);
>>> -		if (!btf_type_is_func_proto(t))
>>> +		t =3D btf_attach_func_proto(log, btf, btf_id);
>>> +		if (!t || !btf_type_is_func_proto(t))
>>>  			return -EINVAL;
>>

Also, why not do it for BPF_TRACE_ITER case as well? I just feel keeping it
consistent may outweigh figuring out whether it's necessary in that case or=
 not,
etc.

Please supply a cover letter in the next version too since you're sending
multiple patches.

Thanks
