Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D73618027
	for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 00:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780099987; cv=none; b=FgRjtGtGfo7+dexprOvINkQvRE4oznpXtCs8XlUBkxV3u4PC/TwTAoQ66RXGYtnALMkT81YBsNhvAwEDnax9F8K24RUMdeJoxBsQq5fWsqM+QelJO3YXYZS++nWdam6OvtjgTkepjmEpCyT555aR53/36H2AgISIw09i7DlH46U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780099987; c=relaxed/simple;
	bh=XAUz9a0Ev13ANpCwyiM/41BpLX2Hzwcg0J37u/ESs0c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=NIqSTzsVvBFCVujoZAwmrzDnNLmR8lgQkSDUe05fo37g82F7z9bxLKgWOK1u/zlHhAQkUHTPdaEjigNKPWs9NCODaLyIhduNMb3bBOzE9bzS2AyECvLzc+qX3mIf7WHrdBN/Yul0a7bB7s7X+Zc6m2zs4df7ODId2ttR84SVwDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5HART+O; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5HART+O"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e61d8d9a21so3387653a34.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 17:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780099984; x=1780704784; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZEFV3xqmXJ7mDew0+WqBqGT5npYefXJtsev5wJWkXs=;
        b=I5HART+Omzn/1q1GxfNXDDt1Cygh9D8szySfaHyZMvjoM/lG0adhj84VI1qSSFKlRk
         5PxrxYXM9uQobWgYBPoxdwWvsHrERHoA/RuUEG2tIdFnt75fEycODqQ9A8YK061HDKMw
         JdCYh1WisIXsrgpvWCDaTPKj/mbdcNoBNrFMKvFrn3/thzkKjWkDlhOGzjHS0WixwGKp
         jV2HcGdGv56CojcnrqssMYQDq6AAk2hge90XH8x3qoo8p7WXvIxV20/9dlwr0W/Qvj2p
         X5go4cgMR3Mb9N/XX53NmVyG5TiuVFVfCnh1NOE4klNmn36Be2g1eHbonF5ZbXUumbs5
         u0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780099984; x=1780704784;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uZEFV3xqmXJ7mDew0+WqBqGT5npYefXJtsev5wJWkXs=;
        b=YmpFa/DPIk3JoCnEQD+oDWdKYJx06EjQx+M/1jisqtBvOms6hV1NPT484vMJV91Jce
         +X/NWpIApCsrAl3evgVo5Ye2wb1ndWy2+xNaHdLm5jSeUV2JxqX4SZHLqTb9BJBDFmmK
         4wB1J+40hZ1pQ0r35iSYsC6n74I3yktAwCN2dkGFF2x+Q9StyJY+iAJQe/+WsXlgInhY
         MGNOEFBD81KSQO97RCuu3X1f/j2IEWQ2v5KgFTaq/B47u3X1DDGcwUjnF56e/+qw5OZn
         yKz6p60xkQUBSAYpakt5jAr4B3AANslKBvIw5odiK0bMO8Lzsn9dCbe2Bg+Vl6Am6mkY
         IIFQ==
X-Gm-Message-State: AOJu0YytKhZM32lNXBq7PNQVu+DrL4CnqWGpVCi8vWe5kufKwJFal4Rd
	hjEEuw3S71Haf4Ki5Bftebn0MNMU3fCn+AMkk+QzgnDnYPnqrgEY0Ikt2MAHog==
X-Gm-Gg: Acq92OGC6x7wsBPoQgOS2viCnsDmXFXXi71kQsIItHdotC63g2HFRZfF0+7P0XTgnf5
	UaU4RkTJOCio46bRm44VuCfXdzn4Kxx23zN/66GIyYM8ePBJAla4+GL1SUrekb6TO64Fazj0Gek
	3Cp6pdZFos/OrIyJllx8ti3Cd4rBBC3anvYcrpApSGwvLXXFlNrOGF4cHHA5/By1Y1iKaaM/DkI
	XuFfIjUJ0zr1XJT9bMPh5i6ISiQkTTHpCuKuKymedhrqCKtyGN9/wV+jZ0Xg9XjIsaiRha8m9TR
	c+R3nnDXmO+4Znf6cELOJ1ouPtiU7R2ySA/idHmDbrbvDFjAWtF1aMbunvSFgeOf1FFzQw8nsOS
	JvXbipd4d+qof39PWF8IC5kwmEv9JmoPZaf/GrNCeo+kPEQdGX//jei06Moe86dtjUiDdJK02cG
	PTw64j9rVc9dvztUSKMsInizNRLBgmZ+mb3Gr8xDdaxGy+hcWqIBDHKGZXyxz++8VhJfi19X8Ta
	+XRUt5cBdY10XR2JLdxnyXQQGT7
X-Received: by 2002:a05:6820:f03:b0:69d:9153:56ed with SMTP id 006d021491bc7-69e102a87d7mr847884eaf.3.1780099983883;
        Fri, 29 May 2026 17:13:03 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:51::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e067f30fcsm2098238eaf.6.2026.05.29.17.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 17:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 17:13:01 -0700
Message-Id: <DIVKS1X4Q76A.1Z3XA1HE3MI7F@gmail.com>
Subject: Re: [PATCH bpf-next 4/4] selftests/bpf: Add tests for arena
 slub-backed allocator
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: <bpf@vger.kernel.org>
X-Mailer: aerc
References: <20260529202438.16408-5-alexei.starovoitov@gmail.com>
 <20260529223907.B25251F00893@smtp.kernel.org>
In-Reply-To: <20260529223907.B25251F00893@smtp.kernel.org>

On Fri May 29, 2026 at 3:39 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The `arena_slab_freeptr_stale_pcs` selftest will reliably fail=
 on architectures with a page size larger than 4K (e.g., ARM64 with 64K pag=
es) due to hardcoded assumptions about SLUB slab page capacities.
> --
>
> commit 307042b1f4f8cca55cad67f2c12869bf67a9f7c2
> Author: Alexei Starovoitov <ast@kernel.org>
>
> selftests/bpf: Add tests for arena slub-backed allocator
>
> This commit adds end-to-end selftests covering the SLAB_BPF_ARENA path.
> It includes smoke tests for basic alloc/free kfuncs and exercises corrupt=
ed
> in-object freepointers to validate get_freepointer() clamping.
>
>> diff --git a/tools/testing/selftests/bpf/progs/arena_slab_freeptr_stale_=
pcs.c b/tools/testing/selftests/bpf/progs/arena_slab_freeptr_stale_pcs.c
>> new file mode 100644
>> index 0000000000000..4d23d75419d61
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/progs/arena_slab_freeptr_stale_pcs.c
>
> [ ... ]
>
>> +	victim =3D objs[TARGET_IDX];
>> +
>> +	/*
>> +	 * The 4096-byte bucket has one object per slab and a 4-object sheaf.
>> +	 * Free @victim while the sheaf is full, then turn its encoded NULL
>> +	 * freepointer into any non-NULL decoded value. The arena clamp keeps
>> +	 * non-NULL decoded values in the same slab and object-aligned, so thi=
s
>> +	 * becomes a freelist self-cycle back to @victim.
>> +	 */
>
> [Severity: Medium]
> Is this assumption valid on architectures with page sizes larger than 4K?
>
> On a system with 64KB pages, a 4096-byte bucket would hold multiple objec=
ts
> per slab page instead of just one.

It's fine. It's a stress test for the algorithm. It's gotta work
on at least one arch in CI.
But I'll switch to __PAGE_SIZE to avoid sashiko complains in v2.
