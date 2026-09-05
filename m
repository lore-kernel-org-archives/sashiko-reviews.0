Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B323533D6
	for <sashiko-reviews@lists.linux.dev>; Sat,  5 Sep 2026 07:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788593527; cv=none; b=C3PjdDfaxX/NTh7mENyUzuWiyXTYoLtVBnAiwDR2fb1jtTxZ3/64Uv8qXiF60jSzxHh5Y72iHdl8fPdic/D2+hfsouR0zLQSkbhGP4oUuy8ad6UBRpeF6ax1f9LAhIOc6S304gwC3W//VmzSkh1zC9Q3tKyYOr2T5Z4Eua5sCHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788593527; c=relaxed/simple;
	bh=ou2fEbhVb1iPX4oTqnFSegex9wa6QnGgcVFEAR52CRI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WZiSSmJpXEm/p4GNsQzn3NVA3blmxC1zUDqBdlhktyzW6qdooC1tC0Pb7LjCkvDrCbmwAXWpcpeYXMqwVOFLL79RZpF+Qkbg1DIxvPeNxBgtBmi3lhzqXbb63yoejDTJL76kQi+flzaTZZQ0qRfsVH8p+Q9T13Xsma3cUfLoJik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ag7RGa7U; arc=none smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ag7RGa7U"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-49b0dd21eb8so3866355e9.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 05 Sep 2026 00:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788593524; x=1789198324; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uf35E09dO4nIBoB7Nn5xsD7EOBYwYd1JDja5BkITBhM=;
        b=ag7RGa7UlA6zTxVeEzSrmAgLU8cwhFf9ekn12EazDC1hLUqGdffpLxmy39qNJpNCST
         4FyoxQ/y0/sfF/f3o2o/BSEbz1APNx8/t8c6mWk0lhyN1D0hsM2bVF60EozCD8qMecBq
         iqngiX00o479qLjO9ABdEe+fJX1GMLkS+p3LY004OC2QMHhh36gOiYPCzqhii5+dUSKG
         rNemCGbuJc1n73JulLwnbBc8SV+bsvm3JEH6L/09tQiKjIYneWi+4rUgZuJZYldoL1UI
         lCS3MfDsVjh+88O2LLtaTsr7GOYhxwU+shuqPd//adoLyICWh2TZzFaEVVsaTN/El/Sm
         0DtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788593524; x=1789198324;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf35E09dO4nIBoB7Nn5xsD7EOBYwYd1JDja5BkITBhM=;
        b=IsXtjtvEfuWA68EMA0txtiubLRCrcQ2BlRpLInCvYT44ezWwnPrlTs6HSbTIvZysvM
         0okJGQ41TXn0lamG8XQg23eQQF+dyoEtf/Bw7aOKNzkAL4cn9v9LkEUOPBl1my8Q7RTu
         w+o4j5/xHPE1XDwz3vPvUr4t4cNPXoPiHr9V1NaJXXDkgOtX3GYy8kRoenmKo3S5X75p
         xXpwkJ5AXHLnvi//zePbhdk6VGgz2/Z0q7GJuSbnyrBrWEQrXPuWaVjchax0ULLKyIDH
         S/UF3R+ZzscYsPrMNZbqVZhAoId74IfovsYgMo8j+BrzotRPiwTTmudircXyY1z+OZO7
         EyPQ==
X-Gm-Message-State: AFuF++kg9YntxCEjmvL8wueCGAK8KDiXOykaPehfOpUMkE8tjnBW8Of/
	z1bNoWadd+RrUVcLwEl4Ge35ZfPS/LspRO3BopUraIpYzUtqgn2X5Xc1hNNh1y4N
X-Gm-Gg: AYBFou3XmXQgTl2oOiSOcxy4H5wbqCW4ZzZZlmAFzC67aBklXJvQnRiZiQp5xV29Wyk
	9Tkx+/g56zpMBkOYIyxMfLwextsrdmd9NUcdJvYq1mZjuCWdWw5tRKNjcc8YzSh49iGk03JnY6X
	SiE1YYaOXdm3pBXa+qJ1jJWuqm3don9VSat1Nkc7UKNeDvu34zddaLbxH1bHfP4rT/AOBXTh0kD
	ci6FmEs9ecWKQdzHTJNSFVqNLOODCF+XRnPSIbYLls5fjM5JLbAKoXNILNCXE2ToFNmcniHE9C2
	s6UmD1FMObbTlVmAKIbrP4swtqnPulFM2u0ySyyNCH9yRt/qS1LBU/ZAKnX1qKamo8/MeInAYC/
	lQaUW4T/JF1ogTfWpjsjm68D8Fv0qMuRmTgFzHlRA3x9MKIhGQILLWKPo75rFZN9HXHF40Zjoj2
	CMcGpcDGEnTeLg7Y196dtoO76Vm9VXA87zGYKBbaTjMNkEdjABBCe2H/osmjN9rQoxOyByz9QCW
	Y6evPwyc7jLUIIewJI9CnftgNY0EWsJBZca71uZxKOE9C66nIDV4xQwjUg+X54MhVok7woq2HRz
	Skg1BJy7xuHb9jAR1mLS0xGzPYc=
X-Received: by 2002:a05:600c:6748:b0:49c:fc6c:bdfa with SMTP id 5b1f17b1804b1-49cfc6cbfa2mr78895535e9.17.1788593524391;
        Sat, 05 Sep 2026 00:32:04 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm216139135e9.4.2026.09.05.00.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 00:32:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 09:32:03 +0200
Message-Id: <DL77HLIRV4VF.A1KEEFA7OJXW@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf v1 7/8] bpf: Assign lock identity to callback map
 values
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260905070003.3193366-1-memxor@gmail.com>
 <20260905070003.3193366-8-memxor@gmail.com>
 <20260905072143.975EB1F00A3D@smtp.kernel.org>
In-Reply-To: <20260905072143.975EB1F00A3D@smtp.kernel.org>

On Sat Sep 5, 2026 at 9:21 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Lock identity aliasing across distinct inner map instances due t=
o flawed static identity check.
>
> Pre-existing issues:
> - [High] A BPF program can cause an AA deadlock by acquiring `bpf_res_spi=
n_lock` twice on the same single-element array map element, bypassing verif=
ier lock tracking.
> --
>
> commit 996188899c474047a5a9bb68f80d0d3c3e5a5b6a
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Assign lock identity to callback map values
>
> This commit assigns a fresh verifier ID to lockable map values in
> callback frame constructors to prevent lock aliasing. It specifically
> preserves ID zero for single-element array maps to support stable
> allocation aliases.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 1c3039f3fc323..b08501734ddfa 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -447,6 +447,11 @@ static bool reg_may_point_to_spin_lock(const struct=
 bpf_reg_state *reg)
>>  	return btf_record_has_field(reg_btf_record(reg), BPF_SPIN_LOCK | BPF_R=
ES_SPIN_LOCK);
>>  }
>>
>> +static bool map_value_has_static_identity(const struct bpf_map *map)
>> +{
>> +	return map->map_type =3D=3D BPF_MAP_TYPE_ARRAY && map->max_entries =3D=
=3D 1;
>> +}
>
> [Severity: High]
> Does this check fail to distinguish inner_map_meta from an actual
> single-element array map?
>
> When a BPF program retrieves two distinct inner maps from an outer map
> (where the inner maps are single-element array maps), and calls
> bpf_for_each_map_elem on both, the verifier tracks both using the same
> inner_map_meta.
>
> Because inner_map_meta has max_entries =3D=3D 1 and map_type =3D=3D
> BPF_MAP_TYPE_ARRAY, will map_value_has_static_identity() return true and
> incorrectly assign id =3D 0 to both callbacks' element pointers?
>
> Could this allow a program to acquire a lock on an element from the first
> inner map and unlock it on the element from the second inner map, corrupt=
ing
> the spinlock state?

This one is real, will fix.

>
> [Severity: High]
> This is a pre-existing issue, but does preserving ID 0 for single-element
> array maps leave an AA deadlock vulnerability in bpf_res_spin_lock tracki=
ng?
>
> If a program acquires a bpf_res_spin_lock using a direct map value pointe=
r
> via LD_IMM64, check_ld_imm() assigns id =3D 0. If the program then acquir=
es
> the same lock again using a pointer obtained via bpf_map_lookup_elem(),
> check_helper_call() unconditionally assigns a fresh ID to the lookup resu=
lt.
>
> Will find_lock_state() inside process_spin_lock() see the different IDs a=
nd
> fail to recognize the lock is already held, causing a system hang on the
> second acquisition?
>

This one is not.

> [ ... ]

