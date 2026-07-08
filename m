Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A05202963
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 23:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783551865; cv=none; b=UQrxbJFn4XXPUpiXQAkLIz0rI+7S8k5a3jX9qBFurFtTbqksGyFnaxHKL3tyQ9ZhSr5kFta+UzGBfZyOLjJNbrVeOAETQWpPgqUOpYCayhsjtJX78g7zWyWrJcof1HbXseEMlMMAp2hO5sDdxFE/+Pgnez7ucuaeJrA8eTyoDtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783551865; c=relaxed/simple;
	bh=CkNmuXkrm9AphV+/HDd6pBopBJF4hZCxb/bQkVXOVeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TX31ERH35XtBBg8ovxJaRlm2A+PqDJ7fk9Y07R2kVEn3mxt5jUI5Bte59YnqYQfRF4BBoDXRhv3RlBxekHX3uzy330bYEAdUooHCinxAXcNSh3YpO1932Vv7oRLdbJre7coqfAhwzl3EXkoIDCAB4is3M7fWnMrLQTdfZweKpJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EziJL83Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EziJL83Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C301F000E9
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 23:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783551864;
	bh=8tvZnKf1EOonCwnHP7yo3nXIfcSxA0v9m4Yyik+z4Cs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EziJL83ZwjmOdH8rKIzYYM5xWx9AV+mN72k+16zfJeE43A7vJtAVIkRwOAI3InNLK
	 l+awAsneO7Hg5CjwUjrTYLLIBKNuJfZDdtEJNVzeV0DO2LlGPUAoyCMT5OnRZWK1LW
	 G+DcWWuWsQs5LwnHvtR0USI+NtX2aPd4PQEDSCiqc/dU6cMn3FpW57zbqbHAw/dTCp
	 JYs/iOkGRG8qRmk1DDl3x4T50gFckp3NORnrBW3uhkf18ywyxrRwyBb8OIEB9szXU7
	 avIidXBfSf5ptm7P5KUCojcxsmNtPE8cCQ8GZm4EzZFMABlncEtY3P5hT9dkBf0hTo
	 zJrMuaDn0ZWSQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso1242463e87.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 16:04:24 -0700 (PDT)
X-Gm-Message-State: AOJu0YxQl/Iil8eRvp7LsHaUV8Byxt/mu8ZJhiXhGHxtQobx5BaUaZI5
	kAxi7A1RFAc8LRwP4oMvvqlW8d2E6/XCqioG3js3GfI45P4FgNHqyP0hco/YaQRCyzA7Jf0ZMuS
	L189hzXn9HqBaqPhsN5FHAzPP53tM+Nw=
X-Received: by 2002:a05:6512:8353:b0:5b0:161f:8fc6 with SMTP id
 2adb3069b0e04-5b0161f913emr95235e87.40.1783551862865; Wed, 08 Jul 2026
 16:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
 <20260709-ixp4xx-little-endian-v1-2-e9622d0ba9e4@kernel.org> <20260708223722.439381F000E9@smtp.kernel.org>
In-Reply-To: <20260708223722.439381F000E9@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 01:04:10 +0200
X-Gmail-Original-Message-ID: <CAD++jLkf2uOsE3zS_nYFixtaQ4ACW7JqBcUFJoh8bJqhQcBK3Q@mail.gmail.com>
X-Gm-Features: AUfX_mxt60m0a1t2Co4EqpdX4ktVI3XjLJEizNvOZ2LEV4BhQgAs1wllcBye1nI
Message-ID: <CAD++jLkf2uOsE3zS_nYFixtaQ4ACW7JqBcUFJoh8bJqhQcBK3Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: ixp4xx: Relax endianness
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 12:37=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> Does removing this big-endian restriction break the IXP4XX flash driver o=
n
> little-endian builds?
>
> The physmap-ixp4xx.c driver documents a hard requirement for the byte swa=
p
> option on LE systems:
>
> drivers/mtd/maps/physmap-ixp4xx.c:flash_read16()
>  * This means that on LE systems each 16 bit word must be swapped. Note t=
hat
>  * this requires CONFIG_MTD_CFI_BE_BYTE_SWAP to be enabled to 'unswap' th=
e CFI
>  * data and other flash commands which are always in D7-D0.
>
> However, the MTD_PHYSMAP_IXP4XX configuration conditionally selects the s=
wap
> only for big-endian builds:
>
> drivers/mtd/maps/Kconfig:MTD_PHYSMAP_IXP4XX
>         select MTD_CFI_BE_BYTE_SWAP if CPU_BIG_ENDIAN
>
> Because of this conditional, LE builds fail to select the requisite byte =
swap.
> Without the byte swap, the CFI backend defaults to host endian and the dr=
iver
> sends mangled commands to the flash, causing it to fail to probe.

I have tested it and it works, so no.

Yours,
Linus Walleij
