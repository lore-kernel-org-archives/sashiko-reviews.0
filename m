Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2A73EB818
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 16:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783614053; cv=pass; b=F7b7NNUJagcFblSwgXB3dEh4ktTKPH4fehsdnmA29v477tF4qgtJL09Uc6K7pgWNLuDmIVLb6hlJVWAcY49MDO94o28NUOcbmS3xzRlXQAxILat4u8cFVZ5IudBRvD7VeErRtXSjXb3+wtZAyLe67UnqkKsfdURicF88i1lg8Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783614053; c=relaxed/simple;
	bh=b1s0BnAvMgNE5OxGjbfRh91f/c2d1UF+Cy3Ci/YTlRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nlkeRUlS/ixHIzrfBEDrO8y+LsTOUG209njHVdzXmGQmvJILaNZPRSeNZJmXubQz+Xbgi5p1FmbY6nqc0DfRSrYUP7wOQvQUsV93ts3HirWGBgCeEck8tQQzL5urYRpWUvrCxzePug1w0dx3v3u/KY/gecoyfVxTqS98UGzVwvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qe/7fMHZ; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qe/7fMHZ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8484a0b998fso2258247b3a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 09:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783614051; cv=none;
        d=google.com; s=arc-20260327;
        b=UY/h1191TBow2f+WV9Di8OA4oujfeLL0CEiv3s1QiNXQU2r7MsuV6fVZsADtCgfCId
         yYhpK5+IsU+0I2plT4G1n2nRz8zaVnfXO3dSOWxuxeOwGhyBHSOaKJ9ngplT1rcrcKau
         ZtL8ucNJde/liMdJFnj4T4yRIfx3VyJPAz2A1txiNVsL4EhjCBpW09+ygHrU8ycBNPbN
         spxvnuL7DxPj/s41TqzpsWxDMsGS3PSfBdk1TeWiJcKPASc2ceiTud8MKJAX+zsWwoSt
         oWPBZyuqQjJpDcXLg/uMiBhn+Lk3NHI7wVvzcUexzxD1m/XCCc5GFakcHFO1LaM8Nmjz
         YENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b1s0BnAvMgNE5OxGjbfRh91f/c2d1UF+Cy3Ci/YTlRA=;
        fh=xouzGRnDryqk6atfxsNKGMSAkkgYUa3gp4YZH6HGQFo=;
        b=Abweq+T0NzW+hB4KCIsOwM7xvgWdGRQUP5bRsPDhF6x+GmQXsZm+EFkTo4tB9S3O8l
         ztV+tCj8CVLM+m2OrfsNKR9Q4rJtUZOMMimklqXwcnT0MNY+cNt+0SqYF3FfH7Hg7a+4
         Xav+YVRJXsynTJkMhr341Shv0W8MPOyAT8H7A5SvzNuxzqJVP88IyW4Q7muY1ulT+s89
         qORI/vXD5S4dYa1+B3Cr8Ib+S/djx1Mb0nEdqOU2rslfUSUFvdlxtRCFOte1x7h5qGYg
         4t0isX79iNW0/mRmU7W0es4o0VMzPynNCTwHLLIBLpU1kx11I8zUquKQ4EYq8+t/N4Qe
         poPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783614051; x=1784218851; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b1s0BnAvMgNE5OxGjbfRh91f/c2d1UF+Cy3Ci/YTlRA=;
        b=qe/7fMHZSKbys3H4asXDPuoDq6HV7fXviAhJRHPOZvuu5M/2orQ5pQKixyCJ6gN+fF
         lOFV/FC7ogzslAySGi6qM6Y3e9P75VwOeCOHETKGFMUUdEmBTeLlByx9huX6N8ftfbhI
         vohqhxmVh2N/spUvX3PuQBN8IqZ0PrsMxK/1eJzhbo+UjDQJOh7kFxe4PTXWvJdI0HHu
         UohrQqamaJrYHA6K4fwEzAMmuJ+bHvAeXZ+H+tk/hx8UQG/l2QggPpyjfBi8jO2VrOTO
         kPXySa3lXv2z6ADj/WID14ExkA4HGAW7nv6oiLeGMeO3NCMU3x9QjzG2m5uJCfkIbxkB
         XzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783614051; x=1784218851;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1s0BnAvMgNE5OxGjbfRh91f/c2d1UF+Cy3Ci/YTlRA=;
        b=cyw9IN4idrr/MpfLj0KjObZBR+2mpgb8DqnLTRELAOm0k9SUgyeXOsR2/5QuCLIK3M
         m1DPNhckN9N8+8PbU3QcSOX2szEhuDXEnsJ/PGIRQgcNZPUww2UDwCuKVb1eV1t0pUtC
         qVxncl1itt2x6t+WR+x6tue9H1v09nSXMT18O1vQfjlnAE0e9lXFwOw6TwLvc2SAWeoR
         StVQj6R381PkxTtyXkdPImkbW5GfvnZVN0mNm4boROUeK6U7ekLMRbbfMbw9IIIU/z6e
         kdVivIZQF8GtuPFdwpxDYRreYwwsWtLgl45PmaToQhErJ/7YCzdBm1wICiX4jqoeh4Wx
         Hszw==
X-Gm-Message-State: AOJu0YxWZ2kwUS/85Z1Q9sIKyEqpgO0TwLUYbxwVJ9uXxS67nRF6qRBq
	tv1ARN71m1GFwS7Oe/BjOL9qaRX0wWY02IlTX8L0V5z8/2s4fjkSO8EsYqphZ9OUD5KuIODnzhh
	Nj41VCp5VXrjgrw/oliSsNe4G82U2etGcsZqCPAL58MjubizgIP4EcR+xWsk=
X-Gm-Gg: AfdE7ckR24xZmaVrySfGcyjlXsuzHB46kr8XlC7NuBjtErmXix2gT+sfCpZzk2ei8TT
	nCgoeNg5/Inf6CQ/eL8Xjs1n6c0SbSaGV4Jfb3MsJFKOfMNlXEicmSnb4MGYGTSpynwkOWKP1nu
	kbXICoOso65UUrykfI+eyPvXQWTJsSuMwHgmXwH/uQsCJtvHQoTpLkc1XS+ipICptKFXxImAtAJ
	z7PhEq3tVjoB1xedDtK3QeGwNMoi//cxoWHCTVJ41YNu7f42k5LA0IAw67ODJR/v77e6hfX2sXe
	L97H175Nl+rM6CBcPgJPSXoHQC3xWGgoMCgAANDDL/BgfTQ2yb715KYOe7cQRkyP1NMQJ24lo80
	jEReoVQJh/68GhFnMqWO5wQsNEYK94+5X37pYHzrRyA==
X-Received: by 2002:a05:6a21:6916:b0:3bf:6c08:2849 with SMTP id
 adf61e73a8af0-3c0bd276a7bmr8870105637.56.1783614050510; Thu, 09 Jul 2026
 09:20:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709025316.999913-1-mattbobrowski@google.com>
 <20260709032007.9E4D61F000E9@smtp.kernel.org> <b0ebaa8e-108d-451f-a7b2-26810f3d9b03@iogearbox.net>
In-Reply-To: <b0ebaa8e-108d-451f-a7b2-26810f3d9b03@iogearbox.net>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 9 Jul 2026 09:20:38 -0700
X-Gm-Features: AVVi8CeDvo4YagrqbzvIVByMGYcnC9eAju-89onJQfNFauJDOGmdtCz5ukRH8dQ
Message-ID: <CAAVpQUAOQJEVeQwKZ35o=0jXVomyUEPNyu9MdK1cbeA-Sdx3jg@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: fix UAF in sock clone early bailouts
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: sashiko-reviews@lists.linux.dev, Matt Bobrowski <mattbobrowski@google.com>, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 4:55=E2=80=AFAM Daniel Borkmann <daniel@iogearbox.ne=
t> wrote:
>
> Hi Matt, hi Kuniyuki,
>
> On 7/9/26 5:20 AM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> >
> > Pre-existing issues:
> > - [High] BPF map corruption via shallow-copied sk_user_data and sk_reus=
eport_cb during sk_clone early bailouts.
> > - [High] Unbalanced decrement of global network timestamp static key du=
ring sk_clone early bailouts.
>
> Do either one of you also have a chance to look into these?

I'll post a fix.

Thank you, Daniel !
