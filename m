Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2B1456E19
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 09:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883159; cv=none; b=I3mM/TjjMVmGDiH4SujKekGxAIUeQJfZU8dvhblxCOxfrMV8mvsfiIoymO83LJQkeJwkcAZW/HXv5+UWuhRzuIFBC63qrUEMNzJ1Y05QR9r6PjxklLmGA4rXvdh5z7hUfcVQLfd4RmzqIIczjS6bUYUg3/gTQAuxAO93y0LuA4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883159; c=relaxed/simple;
	bh=lpTNZ/5jZGki/n4wGfQyOA231tiB5+Awdnv2PPXkquU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=b41CqyCPnTup45KdN/UnVRDUfbzCr7rrmXfdbdKeZP87Aqqdq+oXq9LEu8464ECrJYXdoKgOxX5Oo5Fg0G98N6Y6DrZ+rjlh4mnN8RFhQX9QnnkoJ7oQgMEBMbEIVJj2PMxltHN20innFDuXqRjeBdp4JhUXcwMzpEnllgK7La8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKXKNx+o; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKXKNx+o"
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-828c0b569f6so1053482a34.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 02:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883155; x=1792487955; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nlzQWYQabUcLbPNV/9bl1l174WsOPecqqUyCYJyygP8=;
        b=MKXKNx+ok964u2j7SO9HCXLqlcx4YvfuldVsZalG+HqiZBPLkJqlgNho+jHchrerSj
         EFPhzGF+QVGZlWY6o8aT51MpWNuyJLXMIcuQqr9Hjviz1pvaadzQkExB4fAiRAaG5UEI
         uv4nys4tzKvmIwtLoqdxMhQo71pmzvmQ5iB35G1um8/fZv+PlFtkJQ9QURtJ1Bu5hhO8
         2pQ7CyuiKe5JNdNK59o4B+yaR6jPdDLdNWyQtJCqf/m4qwhLSJ0crAtn2gHAWSDvTQCg
         nHefbCS7ExRa6xyIL9Lm3bQgj9IQFdjoP4xF6cvV0ghXsK6Jfs5TxXphIfSZ5c7MGl1M
         qU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883155; x=1792487955;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nlzQWYQabUcLbPNV/9bl1l174WsOPecqqUyCYJyygP8=;
        b=O7zqwiLxbAjluH4/xC3vXiL7q4iVXpjxErGPzLpdJxkaV0pEyDQV2E3vAHhcIX3lgH
         bCEZ3efLwhOg39sf+vLXjhgSIdomrrbqW1bjtv8oxoeFXbKVNsK1Y0n8deowzrtMBTkZ
         dy8zhs3IvsX71qZPGpwRlfX34PjyH7IUwOtxibCGHMP/eBeH/VmcIDmNrb7mRpvZTjkw
         4dWR1DoO5LcMPwrPQc8I4QB4VyaoMf2KPkdRbVyfz1P+H8o/aCjbn227DMYQCUhnCQWP
         g1GY8AnBfKMsrDbfhP91XqYJx4/u4Nz082ryhzQs9HgRrDFlgaEQD9gitSDJo/V/o34k
         y6mA==
X-Gm-Message-State: AFq9FYKPgfj5nT+frTkTfbWyGZXnoaZ+omLEeD/S7WgdehcbUS9SPm/m
	PEplIwv+NAaRytQ4vWxjAxUeJMBEL+YqsO3L9CXORc/0IOpvDSge1LMclKFNXyTBzes=
X-Gm-Gg: AYBFou2xocPjXKIwVLu7I5DHVdZoFRW9uzieRAjaKmedlNnuPasdmBmFLAOm3EH7uz9
	wIX+G29eRxKgKxKYq8LgOP2r7t7JXJOCB9RwkaWmbamqdUESaxFDoKCTYhYXYlq6f7++5hA1yyZ
	r4+eP5UUv43tVRHxdgneicYIlxg/+O3MtnUOqv+nZIAO7rdk8gz0OzS51tLl6KhjhGoekRELNqA
	bLqrrONPJpH502FG4RO45Zory/7Jnbj6ClAWnNk8Usm2Agfzc/bd2/qFHhcgJryINqkSAuN3sdN
	ZTMe6qLyATfAYNQ35iB/ABVaz/XYQuEO5QnZmUQXP+P4a1/CWY5oca1t8wFzjZfwIDRgHWgxQCh
	hX7Jfk17GZRJpVilHvo93kdWy/onDvOnlvOypOk8dkH7tcL6jOUqv874JyJDkdmYwEuPy4+7hOV
	rfGJxzw3s0OcWqHa+UzyTKuF4E5G24T20Wps9ql435W3Av7N9WsGICJ+bDmkSHrgqEbSpwfNAuP
	AO87nDYarlRAbi1UHmF2CR2ZdBeE/CW6rXyyccCgTKTHPdh2GQM9Bz3gx1iplnzkPa8Hi5ploEU
	WIP6
X-Received: by 2002:a05:6808:1992:b0:4d6:9335:d534 with SMTP id 5614622812f47-50c5bd17840mr10719614b6e.65.1791883154987;
        Tue, 13 Oct 2026 02:19:14 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1c120ae6sm13672218b6e.17.2026.10.13.02.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:19:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 11:19:12 +0200
Message-Id: <DM3LKBZS8VU0.1HNORI7HA6FFS@gmail.com>
Subject: Re: [PATCH bpf-next v2 04/13] bpf: Recognize __nullable on pointer
 members of kernel structs
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20261013082012.1107446-1-memxor@gmail.com>
 <20261013082012.1107446-5-memxor@gmail.com>
 <sashiko-outbox-169283@kernel.org>
In-Reply-To: <sashiko-outbox-169283@kernel.org>

On Tue Oct 13, 2026 at 10:52 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf: MEM_PERCPU pointers are stripped of PTR_MAYBE_NULL flag cau=
sing Oops
> --
>
> commit 2e4273929b840decae1764fc52e2d82686a2b6c3
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Recognize __nullable on pointer members of kernel structs
>
> This patch updates btf_struct_walk() to report the __nullable BTF type ta=
g
> on pointer members as PTR_MAYBE_NULL. The verifier is also modified to ke=
ep
> the PTR_MAYBE_NULL flag on trusted and RCU pointers only, under the
> assumption that untrusted results are probed anyway.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 2f190abe34489..a9c47441fba91 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>
> [ ... ]
>
>> @@ -6721,6 +6721,13 @@ static int check_ptr_to_btf_access(struct bpf_ver=
ifier_env *env,
>>  		clear_trusted_flags(&flag);
>>  	}
>>
>> +	/*
>> +	 * A __nullable member only matters where NULL would otherwise be
>> +	 * assumed away, on trusted and RCU pointers; the rest are probed.
>> +	 */
>> +	if (!(flag & (PTR_TRUSTED | MEM_RCU)))
>> +		flag &=3D ~PTR_MAYBE_NULL;
>> +
>
> [Severity: High]
> Does this unintentionally strip the NULL-checking requirement from
> MEM_PERCPU pointers?
>
> Struct members annotated with __percpu __nullable will receive the
> MEM_PERCPU | PTR_MAYBE_NULL flags from btf_struct_walk(), but lack
> PTR_TRUSTED or MEM_RCU.
>
> Because the pointer loses PTR_MAYBE_NULL here, does the BPF verifier no
> longer force the BPF program to verify it against NULL before passing it =
to
> helpers like bpf_per_cpu_ptr() or bpf_this_cpu_ptr()?
>
> Since these helpers do not check for NULL internally, calling them with N=
ULL
> simply returns the base address of the CPU's per-CPU memory area. A
> subsequent NULL check by the BPF program would then pass, which might all=
ow
> it to dereference the base of the per-CPU area and corrupt memory.
>

Will just drop the stripping logic, I don't think it makes too much sense a=
nd
code is simpler without it.

>>  	if (atype =3D=3D BPF_READ && value_regno >=3D 0) {
>>  		ret =3D mark_btf_ld_reg(env, regs, value_regno, ret, reg->btf, btf_id=
, flag);
>>  		if (ret < 0)


