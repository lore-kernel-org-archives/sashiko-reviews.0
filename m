Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2CD390608
	for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784476230; cv=none; b=lmyxUKxRHvLlQ8ZecK7fU6uADXPgBmMGz1lNg4yCrCayIvcLmxmT2Q88M5lqNTg7CTn1LyjWPIKTMxWFORz1nMpbAOVzedsdl8gENHhC+1IpTTClXUmAND9v08b0pIFML3w7yfgp/KrJacmw9JIV9WBdzvT9UTH1qUzD2A7i1lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784476230; c=relaxed/simple;
	bh=7aSOI5EYULtzA++ySrn8SAJOMzpGwkicqJmliqx3tpU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LSpkMfZbj9Jrok01LTQw8ffkzAjM0kmmm2NLltdkZuIlz6oxubKOX/h4DFbbBXh2Y7N0BkBrHgbRydLzr9cauDmFt1AsbXvZNisjro53ldSuOhTuGpRqKUTcMC76cFHaYn7yM3Xp40NLv9Bzz2DV+htTDS5Vws5l0ms5Bonq5fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxMxpd1t; arc=none smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxMxpd1t"
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49553b57612so1711895e9.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 08:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784476228; x=1785081028; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z4/BDi01G4d6omML5te3TMEqNCT4a4sL8UbQKe44Jho=;
        b=mxMxpd1t4HTrsuNDRWNp0zrt1TifhKgW2nlfwDYsYwFDjhAsn8SE1wCx8z9n1gks5/
         ql6a6QdHdkCJJzz5GXTxVcrdQoZdGloUKBzcgb8b1BSRYT3HBpSlgNAdA062Mezdk2TM
         0FWntBh66nC71AQIZsJd1974VBbgbIBshdKKmWhAZnn0rvwkNNc464qxTekg4IK6cZSt
         IG5sJucsa4HPEyu/gN5eaf57hChN7JrkUUTJI1rz5Vonaz4BRygZ56EcRiIR3V/B635A
         Gbt0NRQHbtl91ljW5ZAX+qyXtx6zpmdy5/mpvm6Zai46WD2m8V8+V7aZ17H63z5QuFbC
         DwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784476228; x=1785081028;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4/BDi01G4d6omML5te3TMEqNCT4a4sL8UbQKe44Jho=;
        b=giHbsaRlVB6Fu1KTv8VpgTgWp+3SumDG+LKwIYwMEWMOb0vVXpnoz3Ki3HjP2Y2v9o
         p6IQRcU2tNd1GAzn3+P7B2bI/UfNk5Fh4PuPesBIBLuz0uIEsMbqcsnhOZHOd43XQ8cM
         YDMRzjl4hMIADusPJImhtoyPU9emvEZ2fbN337USpzAVNYhRCNF80Z/NRrYwCCD6vVDj
         j1Cw2fiYsPRGOmRQR6MMUUOoHFIyAdqctwgLXcB1qhJLH7QfAlc4YQe/CCFnPW9SR12R
         uJIVB56H2zan8jxBwuxXTzeC2ubLEzVvtcNpgSzLCPEbFv1m3+Yp1LQ9QKxiPqVRjlNC
         8FOQ==
X-Gm-Message-State: AOJu0YwTlCVyHPwGkF42G5UPVfgopBphGcB5VsxNQxEVg6Gtsvl5x1Yu
	XeuRdCANA+UneurH0yC1Mw5uChBswHP8JSkodmO1QxiihkYKT8JpX4d3CfFe+ZCe
X-Gm-Gg: AfdE7cmvO0Kpyci/xnPy8BenV2plEjLxAraRT4SAGZwZjCspF0b5RodQzKiKWDA8X+Y
	iPHDSBb//XTLX05r0BChmgqY8nbqqk4pdhqddeuseXuD9ppU9tC22ZzB5D+JyKRZC1IOk2BIWDf
	D8WDkfRtUVVLGauuZIzRDSGQe4a0olC1qenCGVaEDO08S/op7Zog3qz/uqRkEpS8MExixiIfoIV
	/gaUxo2DCfzw6YT7h/6PIrMGDFe6CvPNQNJQZmPxkPG2n04ikYT4nlYvDq/+EpcRfE/+Gq61Zej
	SgD4hJhuW6kgAAaDZbHZ41/dqxG2vQEIi5Lv9D3mgx88mqlQLB/VikdklrbZwZAkJka9ljIVM+C
	3+7bTEPsczPnb25nJfskuL8yzqgslThnopKaZSo+1yHXh8Q179CGPlvaB3nDZVVV5bPAPEsnBcO
	l97a1wj3bDG9J0SNOrYqO/TsEsQ0dJkGLEWhLvxhuZQeDU4mvGucWER94aJeRTzrPPjKfIkshkA
	hGxI8B4NLLGDgfsZdFjF4zYIhtEzqxWxedhoZuteL6d
X-Received: by 2002:a05:600c:190b:b0:493:c77c:108a with SMTP id 5b1f17b1804b1-4954aa1a10amr110737575e9.36.1784476227713;
        Sun, 19 Jul 2026 08:50:27 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2aa698sm191898255e9.4.2026.07.19.08.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:50:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 17:50:25 +0200
Message-Id: <DK2O112CXTEQ.1DTPFZ5ZF4B66@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 2/5] bpf: Preserve unique-field state across
 nested structs
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260719153634.2908692-1-memxor@gmail.com>
 <20260719153634.2908692-3-memxor@gmail.com>
 <20260719154924.5C3C31F000E9@smtp.kernel.org>
In-Reply-To: <20260719154924.5C3C31F000E9@smtp.kernel.org>

On Sun Jul 19, 2026 at 5:49 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Multiple BPF_REFCOUNT fields in a BTF struct bypass the seen_mas=
k uniqueness check because is_unique =3D false, allowing them to trigger a =
reachable WARN_ON_ONCE() in btf_parse_fields().
> --
>
> --- Patch [2]: [PATCH bpf-next v2 2/5] bpf: Preserve unique-field state a=
cross nested structs ---
> commit f8de1a7879c048283531a81778eac42891723a9d
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Preserve unique-field state across nested structs
>
> btf_find_struct_field() initializes a fresh seen mask for every recursive
> descent. This commit passes a shared seen mask pointer through the entire
> field traversal to ensure unique special fields in different levels of th=
e
> same aggregate properly see one another.
>
>> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
>> index e7d4e9ba24e26..c577f00e9d885 100644
>> --- a/kernel/bpf/btf.c
>> +++ b/kernel/bpf/btf.c
>
> [ ... ]
>
>> @@ -3947,10 +3947,12 @@ static int btf_find_field(const struct btf *btf,=
 const struct btf_type *t,
>>  			  u32 field_mask, struct btf_field_info *info,
>>  			  int info_cnt)
>>  {
>> +	u32 seen_mask =3D 0;
>> +
>>  	if (__btf_type_is_struct(t))
>> -		return btf_find_struct_field(btf, t, field_mask, info, info_cnt, 0);
>> +		return btf_find_struct_field(btf, t, field_mask, info, info_cnt, 0, &=
seen_mask);
>
> [Severity: High]
> This is a pre-existing issue, but since this patch improves the uniquenes=
s
> tracking via seen_mask, should BPF_REFCOUNT also be treated as a unique f=
ield?
>
> In btf_get_field_type(), BPF_REFCOUNT is currently defined with
> is_unique =3D false:
>
>     { BPF_REFCOUNT, "bpf_refcount", false },
>
> Because it bypasses the uniqueness validation, a user could load a BTF st=
ruct
> containing multiple bpf_refcount fields. If this happens, does it eventua=
lly
> reach btf_parse_fields() and intentionally trigger the WARN_ON_ONCE there=
?
>
>     case BPF_REFCOUNT:
>         WARN_ON_ONCE(rec->refcount_off >=3D 0);
>         /* Cache offset for faster lookup at runtime */
>         rec->refcount_off =3D rec->fields[i].offset;
>         break;
>
> Could a crafted user BTF cause a kernel panic here if panic_on_warn is
> enabled?

Yes, but exactly what next commit fixes.
