Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC722E3FE
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 00:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783383667; cv=none; b=ORNjs+Nkmk+hi9OOGL+rMOcYaspGs3i3jrvI4J4mN218+6EEQTMiwUQxeDM4S7rx2TcyB5gvrChNef1BZtf7BvFeijOrBdDYAwfdW680+KiT2E5WNNr/XlPTTe3ljVIbEV1Hhe8iUaBbKVjdr37tcgUfY25mb4oU1PwQU9McH0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783383667; c=relaxed/simple;
	bh=miE+Y3WH60BzchHqGCDajC/ToVfvReRugfPL1D/wSno=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=dqzA9CIERqH/tCKOo/4wUwILjvukngs48pQIdtUKC99CRfcwNCZGnVNYgRaBtAUjfGfgvoTRxr10FisVs7gQJW1pJQRG05OQZb1DOkOp6b2QoM+aBu129ziIM9UELeUiP2rDEy8n34sbSAluxUMzOpNG7mNQ6g6s9SSnWZppEWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=i2+P+qER; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="i2+P+qER"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8454160043aso3527764b3a.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 17:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1783383665; x=1783988465; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4KanqF3ysTPoeu0lvcWR2n04d9CNPHluxwpkP6XXJRY=;
        b=i2+P+qERpYOWb5a7aa3zB/75gyfhujlx02DIGLWMwRGfOUr1fvhOQ3gh1DbEh2aJJD
         IrwatvRls+xBaMonE2oN1tYxYrjL/5v575CxMqE9XqXEjo7UXLRxJc420Dzwi84Ibp4x
         jQDASsC3oLoYodi/U7i9PiKw6sUChUsPSkqed4vEkC5/u3zNsmJknsS02zTdn0uZpI1B
         20sZYpCtaF8YBH7Fn1BXC+qWhCjJveU5+dXHiVWRLO5RrveXzuujsX73geOognu0h/QK
         lCIzE+T82DgUI7ska/DhujoBxLCdNmuCkWRhujKN1UTlXFQsUMQM/YIBgq7D/FSpSroW
         JqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783383665; x=1783988465;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KanqF3ysTPoeu0lvcWR2n04d9CNPHluxwpkP6XXJRY=;
        b=FQ/V/rFMn4CDPnfWkcgI/YK+htrin3A9j08HRR8MX/coXRrQPfJrZ8iNTOgF6TrSUg
         wefgvFL5swvWVi73MivEQfdMDHh8Mr7/M2BY6IO5FgqToRKj+YUCjIHBi1UtjgglqXIW
         qo2Uvz3P3/qdquFG1TwazIQENpC+Py2XCsLR31/FH7Fy9v/QK/llzzSYD8FdFZ8yxSXA
         CBIotON/Kvdcu0q31KhlbiqmsxlOUCFHfhaEjJZtsqux5qMhFVgQiu3f/Wu4hcV9cd1x
         euqQ9/lHhCWdyeieCNzWP9rGnFbdkhhYcdnUEuU+0A3AowCP5zJHyu4f0gmfyEBlgNOl
         4YBA==
X-Gm-Message-State: AOJu0Yxnu0OYokNS9nxNvq6kmtKwm+kyU7B8SIFNKJyNwxv6yCdnPHpH
	rUHRT6wXGZvZ0eXiprbTvNkuOLhaiX2gCkaPVdK/xxLTNcdcdSkU7XgD41or0IUWef1WBrFoBkn
	a9s3D1qo=
X-Gm-Gg: AfdE7ckBwvRdVIoItxI4OeGJ/noOBtAEt/XS9P2DYfnYBkhL4Mv5D07niXF/4KdNNcm
	yHlZDSowUcoJ2WuQ/2BBjlOvQkuV+vV2X3gQdPZKa23ZCvKDBwJ6Urd9Vkt/QjbR1giz0/yKrfe
	yqsJHJxKv2KjFT+XKW7prLfsZLcaNUh6Gi5gDY6kr0MqdEcWEDjn1HpTes4zmuv/cnaCMwMUL0U
	bZFWZ8NLHmpktj2MmRy1/TFGZqL+TMsXcl6L1PTIoahpp9ute1X/FRVghbzJUuneWwrYU+cdV8K
	eDLbWy08FDq8LB5cDCV1Cj7JeJdaae7ZyUuwBrAw+LXRBtqGUgR4yIoWg81B07AhH4d492pP9E2
	3Y0zJfOIu7I53xND0f3nopGhBSKsv4gEFTPaL9ueYzbwwxQIa3FifWcvv0gdkLHP2N3q4sXumGJ
	wjSb4RzZ6tTv2L86sMz1trsnUblGD4Pt9O+/T+mcrpQg==
X-Received: by 2002:a05:6a00:27ab:b0:83a:3135:edbd with SMTP id d2e1a72fcca58-84826d122cdmr2602693b3a.7.1783383665277;
        Mon, 06 Jul 2026 17:21:05 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b36448e7sm147757a12.23.2026.07.06.17.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 17:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 20:21:03 -0400
Message-Id: <DJRWQWKLMY87.5ING2IA83CYG@etsalapatis.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: veristat: Minimize map size
 during verification
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: <sashiko-reviews@lists.linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260706225052.35543-1-emil@etsalapatis.com>
 <20260706230339.A8A981F000E9@smtp.kernel.org>
In-Reply-To: <20260706230339.A8A981F000E9@smtp.kernel.org>

On Mon Jul 6, 2026 at 7:03 PM EDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Setting `max_entries` to 1 for `BPF_MAP_TYPE_RHASH` maps cause=
s map creation to fail if `map_extra` > 1.
> --
>
> --- Patch [1]: [PATCH bpf-next] selftests/bpf: veristat: Minimize map siz=
e during verification ---
> commit a11623d3f77bb05764867d10c3ff357f2a8a1403
> Author: Emil Tsalapatis <emil@etsalapatis.com>
>
> selftests/bpf: veristat: Minimize map size during verification
>
> The veristat tool loads objects and maps into the kernel to verify them.
> This patch expands veristat to resize maps whose max_entries are not
> relevant to verification to as low as possible to avoid -ENOMEM errors
> on smaller test machines.
>
>> diff --git a/tools/testing/selftests/bpf/veristat.c b/tools/testing/self=
tests/bpf/veristat.c
>> index a7db6f04f7e14..8d374e1406532 100644
>> --- a/tools/testing/selftests/bpf/veristat.c
>> +++ b/tools/testing/selftests/bpf/veristat.c
> [ ... ]
>> @@ -1248,6 +1263,37 @@ static void fixup_obj_maps(struct bpf_object *obj=
)
>> =20
>>  		/* fix up map size, if necessary */
>>  		switch (bpf_map__type(map)) {
>> +		/*
>> +		 * if the verifier doesn't use max_entries
>> +		 * then set to 1 to avoid -ENOMEM
>> +		 */
>> +		case BPF_MAP_TYPE_HASH:
>> +		case BPF_MAP_TYPE_PERCPU_HASH:
>> +		case BPF_MAP_TYPE_LRU_HASH:
>> +		case BPF_MAP_TYPE_LRU_PERCPU_HASH:
>> +		case BPF_MAP_TYPE_HASH_OF_MAPS:
>> +		case BPF_MAP_TYPE_RHASH:
>> +		case BPF_MAP_TYPE_SOCKHASH:
>> +		case BPF_MAP_TYPE_DEVMAP_HASH:
>> +		case BPF_MAP_TYPE_LPM_TRIE:
>> +		case BPF_MAP_TYPE_QUEUE:
>> +		case BPF_MAP_TYPE_STACK:
>> +		case BPF_MAP_TYPE_BLOOM_FILTER:
>> +		case BPF_MAP_TYPE_STACK_TRACE:
>> +			bpf_map__set_max_entries(map, 1);
>> +			break;
>
> [Severity: Medium]
> Will setting max_entries to 1 cause map creation to fail for
> BPF_MAP_TYPE_RHASH maps that have map_extra set to greater than 1?
>
> The kernel's rhtab_map_alloc_check() enforces that map_extra must be less
> than or equal to max_entries. If a BPF program legitimately uses an RHASH
> map with a map_extra preallocation hint greater than 1, this unconditiona=
l
> minimization will cause an -EINVAL load failure, making veristat erroneou=
sly
> report a verification failure.
>
> Does veristat also need to adjust map_extra when reducing max_entries for
> RHASH maps?

The concern is valid, the fix imo is not. Rhashtable is resizable in the
first place, so we shouldn't be trying to reduce its maximum entries.
Same holds for LPM_TRIE and for arena (my worry was we do a memcg
reservation upfront but that's not the case). We can just remove all
three from the list to fix this issue and simplify the patch.
