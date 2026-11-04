Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759829;
	b=O95ApUV52lTpwoArv4CM9f//27lGim+T1Xfl8J9ELYPBhosnwDWaBi5phtNGqzGjSXEk
	 on5wJvVWMPDzH9Eq2XA3dSYbKwb59yaOd7Vnq6qn3KzRU0OdvGXVUWGRQt4kVSL9dPnQH
	 07kjnsJjgcXDq1uDlsUAzoqa69rTtrsTmknD2/aYCvlOVuifoVrS/GZwxwiCtyWTLTJFy
	 GOqPY4eYM/3XSmghSKc7h92ddNXDfgHio8ZnhWlhMVsydrSdPMwwlOSEqTHSpxmpP2tG6
	 vyAdyS/jDs27G20br1Zthq9woDAG+IQc5SO96+od1ziJHZJHvg1TCLH7Bvz3nLgSYUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=XLnoIpzSxDFdhKtQb49/oEceTAIjw4HsHtGoP3scKEs=;
	b=3i7gZiSxREuA4niHSIUIcukyQ+e0xLmVaZRfql8SETrXtGyUt3WJRHfM42WbtD1VKf4s
	 11yl+nvPQkQvB5Cty1zHou6fvv1MfFbmGHtzo5YCdNPz7xpTNSaQoTja0opAohHmz4xyB
	 jqemXa4vyJdAvnwIdI6f3nmz7k4L5QKnxJFGuWSUAVH2B9JHq4mlV0zgyKklbXeo7Aq3o
	 9brSIMtcyg+GoEZYDR8amhkVd8pkKHo4FU0zG8CGk6gK5p5TZOabP/Lr7UKXzpILT/TBT
	 M8pty9lp8mPc7vbH/tAp7YKbIxW9ixCHcXmRtrR8X8lOTuzpSJp25m/eNURc8C6DMCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bM0VJpwp;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3B7606A328
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 02:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E3B7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bM0VJpwp
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so224423a91.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 18:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793759829; x=1794364629; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XLnoIpzSxDFdhKtQb49/oEceTAIjw4HsHtGoP3scKEs=;
        b=bM0VJpwp7Ze3uceqh+VhHphsjXKmuD2SOP9jdOH8alH12lAgL9fIJF1hk8HUB6pxaB
         YYVWY6BMlAoMAnE77qZBE2yOe9hpfo1o93zcJ8BPiUQKgbHLQZMu07BqQKX62MpTAp5v
         R7ZDj7I40ETlIKilem2iekFfC/3y2YSl2lmhFbHRj63X8VbU0tpT4eljL0Z8V2s1Qaqs
         juv0BWaoJHeJNPk5IZDGrzCD2Ta74rUniniOUJctgdfaXI6Or1Dp81oPuwlEkkmW7Zy6
         bUt8VcFafQp20bT6LUbO2Ywz5RNActq3yNu7zLfYGi0ThS8CSqsfLklBJtgCkxhM06QW
         2OZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759829; x=1794364629;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLnoIpzSxDFdhKtQb49/oEceTAIjw4HsHtGoP3scKEs=;
        b=foZyVc7CmNo9yfdoZMzWtdGy5xeLU1PdxCoVU1se/xlJsxF36nhXzmldwHt6EnxzHx
         r4e+LryRqmjrIP1ZM+h0F/yNVCGniabT1t//Y/F3VxZtNdA7GLK0Dnmny4vaPHgDjtM7
         wCxa9SBBNqwDK/+OBkD46WPxZ9vnHr4P4aKH9RoyCyz249uTTvLHuNHcC5TpLY1d1nAE
         IXZ3vJiVl61gmitErs/gz0ayTOspHNjk4Lkf+eqwa1bV1E/FoULWPZcBQqJ9tZhPc0QS
         E2ZZupg8JWNSghW0CxghfbSyjTDbmNbWrGY4c9IOFkQfiAXBR8lJOGZlrQnkTsnK7fNh
         Y+kA==
X-Gm-Message-State: APuU4Z9UPXUDxDtvASK3a/mrEZnrJRRqn8MlOCO05GulIK4CQmNEmQ3Q
	q+mfxhnx1t0zs1z3CBbn6TDeUblHtKFO91W345ZNVEDtsFhhNm6F7zfIOgFhxw==
X-Gm-Gg: AYBFou1tMR7v6cW0wZWBQvJIcBeeTKCXj/DlO2OfucAG0ef4YSBB8J6XZi2KdaaTUDQ
	5UBF/5ghvNjtbyrKRnFVVQkb73CeZj6Bg/oQ4PY7YR4RFGuXCr671j4zXWQZoBUmKNBAJfEQ5XF
	AhnVvrTwiEojBTu+ivH8Pqqb2NcQYGSmRxKWIKqU//65XdQLjIiuIkmkdaWCYQbMrPgzEsKnHn4
	zmrhFqweE/nNfQe2YWbla4IKlkW/uYyBwH6N27JklwLNrY8TKntoI8T0YByUqzJDFd0tYuedQgN
	THzwJOAWxINzkkdlhrIl1T4T6i6OO4E1mWEOXeaacAy9TmTIAX4pCmR1XDhvL6YTIcZoxMv4QkP
	HTn8mPRrL1GtI7H9FteRBi2WvaIhFDnb+pBOmC2NGKCs/eNAS1umbaQEUyiUULu2iS2j/LvQvv4
	cdjaMyoJeVBe5RupzBxn1VMGdIJto/qEWbnC5JJ83UfmIHelVw95JHecyOFFXk9KuR9lDOO2otA
	W2g/7hCVHVBn/vEkKYf21GGGb6TODMWiYC+WsXIPQVrG4AEdOAj2kdtW1fZKfBhI4Oohder3Raz
	kylIkIXT8201Ypf8hqyiF6ANe2fARhDmLM2dFSg6Xl8YCOFTwtLcO0gJq92CA2g1oY8WAsitK2r
	1I8QJirCPV9mzkg0voRVzhv2VX3CnG2Gp0A==
X-Received: by 2002:a17:90b:528c:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3ae897c8105mr12886992a91.21.1793759828747;
        Tue, 03 Nov 2026 18:37:08 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7dea24sm6701219a91.5.2026.11.03.18.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:37:07 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 02:37:07 +0000
Message-Id: <DMM2SGQ43OOJ.1QYUMNEVN2LIQ@gmail.com>
Cc: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 06/14] libbpf: Relocate pointers that are
 stored in arena
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Roman Gushchin" <roman.gushchin@linux.dev>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <DMM226XFK9P5.265MSTVAV5QPL@gmail.com>
 <EB1C0109-74FC-4DFC-A25D-DB11BD62EC97@linux.dev>
In-Reply-To: <EB1C0109-74FC-4DFC-A25D-DB11BD62EC97@linux.dev>

On Wed Nov 4, 2026 at 2:32 AM UTC, Roman Gushchin wrote:
>> On Nov 3, 2026, at 6:02=E2=80=AFPM, Alexei Starovoitov <alexei.starovoit=
ov@gmail.com> wrote:
>>=20
>> =EF=BB=BFOn Tue, Nov 03, 2026 at 05:44 PM sashiko-bot@kernel.org <sashik=
o-bot@kernel.org> wrote:
>>>> +    ptrs =3D libbpf_reallocarray(NULL, nrels, sizeof(*ptrs));
>>>> +    if (!ptrs)
>>>> +        return -ENOMEM;
>>>> +    obj->arena_ptrs =3D ptrs;
>>=20
>> [...]
>>=20
>>> 1. If multiple SEC_RELO sections target arena_data_shndx, the second ca=
ll
>>> overwrites obj->arena_ptrs (leaking the prior allocation) and allocates=
 only
>>> nrels entries, while obj->arena_ptr_cnt holds the sum across both calls=
. When
>>> bpf_object__create_maps() -> relocate_arena_ptrs() later runs:
>>=20
>> Not a bug. Only a hand-made ELF has two SHT_REL sections for one section=
.
>> clang emits one for .addr_space.1, and the static linker merges them by
>> name in linker_append_elf_relos().
>>=20
>>> 2. If an empty .rel.addr_space.1 section has sh_size =3D=3D 0 (nrels =
=3D=3D 0),
>>> libbpf_reallocarray(NULL, 0, sizeof(*ptrs)) calls realloc(NULL, 0), whi=
ch may
>>> return NULL and cause bpf_object__collect_arena_relos() to return -ENOM=
EM.
>>=20
>> No. Nothing emits an empty SHT_REL section.
>> glibc returns a pointer for realloc(NULL, 0). Where it's NULL the open o=
f
>> such a file fails, and that's fine.
>>=20
>> I'm replying to a bot hoping that Roman will teach it to learn from main=
tainers
>> and stop reporting such bugs in libbpf where input is trusted.
>
> Thanks, well appreciated!
> It=E2=80=99s going into that direction, now at least it should not raise =
it again in next versions.

Thank you!
