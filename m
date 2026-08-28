Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F263AAF6D
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 22:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787956141; cv=none; b=DUNU9uAuSLMzgZ6jb8QvGsWlQByD18/ZKgDe9dK+CrGENYXGOoY1eDKGe9cv+PwBPX+axWuNopRijeOP+KxKejcP3iuFD0dPJYakNpq3ECO9ZvDU3L2R4igZNyt2Q2LNmaoFBLB0+SLAHcz1SZG9gzfv+kltiu56ToFL43gB4WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787956141; c=relaxed/simple;
	bh=zKSWaarfHk+sxiW45kRdXEk0Zuj1GaHMmg0cAWIMgYs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kICOE8BS1WHE7XwuiDA4g2TqumMwUQHOFCAcqzB0X0qahZeiBfNnlw1jC9or4tKnKGYeFz8IIP+jzscsfHn5Zd0BqlpxKgDISqZ9RrRGLqGt/4NIt9xYEb7LJa9ynqldbskQWcRbSxJ1PuutYMfiFMe08mMHvaC5y1mAz0YwgaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjF34PJ8; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjF34PJ8"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-482e1bf3f18so116142f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 15:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787956138; x=1788560938; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t4mmsE0vwNZ+9eHiF/Qqnz01ajNJwzmK5X2K1V28jao=;
        b=FjF34PJ8qLomCOejWvkr13h0E4XozT50+fKXABIFw0bJntunCEGI2vu3ALMgtNAI6l
         w+jC6xRovwfzomSR/ccrxzDm1OWXcBDvl+Q/QvdmBxthIeJhUvDhzqs/tAn7e/+6iZ9j
         qhfVyuyhb1hrkvQLIZyRnikrHgTmAtVFqMeKu9JSPrxCKEpugm6moEIacrwJDMc+mOci
         UvomCUOOrOXHwJlbsA1BgA6S45eOJCADeXbjeZy31Yal8fGt3oTNG5OO5gQy0yHy651f
         7Hw5XLsYw6A5H/w+/dr07I/A5ytfdO15sSMfCS6VQ+EzfStWO6ULasWVo4M2XqcGP+vD
         xcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787956138; x=1788560938;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t4mmsE0vwNZ+9eHiF/Qqnz01ajNJwzmK5X2K1V28jao=;
        b=p/+MDvRwYQNgde1s2fyXalBXpNgTpzAJCT5QtW70t1dXaFE72x39/Wi+99YdVXTiXD
         PoW1eHyRviqyVZUhdYXcUDj7xapKxv9yV4nmr58BOnh0Li1CmY0/lST0zIvyixEN7WQs
         dxrx25lmZsfavMghG3we4xn46sInuAZtsQdhWLGwyZ9iz2up1Z1WHjF0CTPf6nXUEWwc
         74R60Bz/cZZ/05UaDYp0ZDYkh8OWYP9JpyKTgtrcngBb6364iNp4E7fX8tkr2ZyzOHEG
         CzhNOoubsqPOPqWE3Tp0FPxZzzV2qAN8oi8sTNvxyikiJF40mTc0iIBWGnAPAFzpYf8e
         P0KA==
X-Forwarded-Encrypted: i=1; AHgh+Roe1c2LVuTbvloIUWINxsvab1Arf4Z8yH3DTvf798g/eu30SrwlnkzqC/7uQHFI2kfZR+MN+oeB0vtPu8OUUVA=@lists.linux.dev
X-Gm-Message-State: AFuF++kDKtTjzx45sV1xD7EBS4jnZzqJqArrg3t5ndQWI0+gbTR9NIpG
	IT9tY2X/R7LtcHDQ9aTvxb4xr80rBAGs116iU8rLYth8/x8pBnCYLI2L
X-Gm-Gg: AR+sD13tKClOc3yf21BF0TzAEYoc3lkK7mdGZfdXVwR4WhIkJ5kbgPELMEmRWrMwed9
	lJUwH4VB4K7P8/qCi8NUW6Lliu+Fezy8G8t4SmaDpqInFi/lA2cgy4O7wZd1QKtRZ0q+jup+K2Z
	lXaHJGXyVnRIR4abT6tp+STAYs1H7CHQWX9EUqAV2VuVG12dpc/VnrKOTCXBImW0CJbwqP62njM
	0zCWFBfbwpR4amPmvUiLXj+Grojy3ZXEyuQUmSrhDpxc1a1DSiSQIzBDYc+u0ed3X49itZDdrm3
	0XTYbqBfMKEWJ1Kj4ZRFlXBviLrXAmKHiSL/40Oey7q4lXMkMKbZ7MNcktmpafUzfc04dDr31Z4
	CYiwMtSTDNpOPU5ivJya7O9Zvy30YLOnlmk2jlLlb0CGwSAYL3lw/jw/JSTNum6E1NDOGy/lQwc
	zEGFKC4n7s9JaS67PcDI3yD8KPbLkiuII+p+DJseTWXIkMZx+QmAXlneM6akknmjU8Y0v1XR8AR
	K3HiHCeNoIBLA9dEvzALnB6ah/Ex1xtHlgjmF+lCLiK01+JI4IDZveMf9ADQEJuRzK1QQfaoMoo
	AZjEk0Ku90b813oejx3fDmV/TO8=
X-Received: by 2002:a05:600c:529b:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49cca2b77afmr43421205e9.1.1787956138058;
        Fri, 28 Aug 2026 15:28:58 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91728319sm89138465e9.12.2026.08.28.15.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 15:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 29 Aug 2026 00:28:57 +0200
Message-Id: <DL0XJY6WNQO4.121HF3BIU9E4L@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf 1/2] bpf: Fix NULL-ptr-deref when dumping a key-less
 BTF hash map
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>,
 <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260828093142.179856-1-jiayuan.chen@linux.dev>
 <20260828095416.50FE61F000E9@smtp.kernel.org>
 <8b3e7f24-795d-458b-a24e-fe154b0cf03d@linux.dev>
In-Reply-To: <8b3e7f24-795d-458b-a24e-fe154b0cf03d@linux.dev>

On Fri Aug 28, 2026 at 12:51 PM CEST, Jiayuan Chen wrote:
>
> on 8/28/26 5:54 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>>
>> Pre-existing issues:
>> - [High] btf_modifier_show dereferences NULL when a modifier resolves to=
 a void type.
>> --
>>
>> commit 36dc7c26f56375bd142801da1fcbc83e4a765c35
>> Author: Jiayuan Chen <jiayuan.chen@linux.dev>
>>
>> bpf: Fix NULL-ptr-deref when dumping a key-less BTF hash map
>>
>> This patch fixes a NULL pointer dereference in btf_type_show() that occu=
rs
>> when dumping a key-less BTF hash map. It restores previous behavior by
>> rejecting key-less BTF in hash map check callbacks, and adds a NULL chec=
k
>> for void types in btf_type_show() to gracefully handle any other paths.
>>
>> Reported-by: syzbot+37b56485bbbf90ad8489@syzkaller.appspotmail.com
>> Closes: https://lore.kernel.org/all/6a8f4e88.27659fcc.2ceef7.0008.GAE@go=
ogle.com/T/
>> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>>
>>> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
>>> index da36d4b9d31ab..c32265dc4ae7e 100644
>>> --- a/kernel/bpf/btf.c
>>> +++ b/kernel/bpf/btf.c
>>> @@ -8229,6 +8229,10 @@ static void btf_type_show(const struct btf *btf,=
 u32 type_id, void *obj,
>>>   	memset(&show->state, 0, sizeof(show->state));
>>>   	memset(&show->obj, 0, sizeof(show->obj));
>>>
>>> +	/* A void type (e.g. type_id 0) has no show op, don't deref NULL. */
>>> +	if (!t || !btf_type_ops(t))
>>> +		return;
>>> +
>>>   	btf_type_ops(t)->show(btf, t, type_id, obj, 0, show);
>>>   }
>> [Severity: High]
>> This is a pre-existing issue, but does this fix need to be extended to
>> btf_modifier_show() as well?
>>
>> If a user with BPF tracing privileges invokes the bpf_snprintf_btf() hel=
per
>> with a btf_id of a modifier that points to void (e.g., const void),
>> btf_type_show() will see the modifier type and pass this check since
>> modifier_ops is not NULL.
>
>
> Right, good catch. Passing a "const void" type_id to bpf_snprintf_btf()
> resolves to
>
> void in btf_modifier_show() and hits the same NULL deref, which the
> check here does not cover.
>
> Shoud I add the fix in this patchset since they are all about "show"
> semantics?

It would make sense to include a fix in v2 together with this, but in case =
of
bpf_snprintf_btf(), we should still print something for such type id, right=
?
