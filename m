Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4258391E49
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 07:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780558956; cv=none; b=SKQALDCBaF888QWamHU/qcFApXeZkUEiWMBhgYlGwkqZvgaCqmLLDjEZy8xjsvqhEWSn/j7cPFATxwC9Jcb1uZIW2yIlQZ8R8cuFWnqOXCudPHjF2pHjSDBpldOWzyEksS8pDRXBFLaGKzHM7FMuHh6gZRXJLLqAjkV62WowHu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780558956; c=relaxed/simple;
	bh=43JHRMPrE8RExZMDKaJc5/rpSNlgegvQLCpdc2buwiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aekDKcBYpdap6jUkzI4Ap2unfnywU1BoWRXRtTur39sMvSfHOyWQT/K9JE9OK7pKXrnNwqT1xd+UtAg0BhFN6tQf7jjg6unsZWCc4a5aVQKSkB2AJGw/a4IWV2YnUtguSA7XApnYXiBAr0vMe9eecTVAT9TnpnlqEk1E232WEt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARlnr6Qg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARlnr6Qg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8483D1F0089A
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 07:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780558955;
	bh=43JHRMPrE8RExZMDKaJc5/rpSNlgegvQLCpdc2buwiY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ARlnr6QgxV0f24N7f+XibJR5NUGfSP5Et5uHIOXcTTB434jnPSf7qDIm93yW9x4A6
	 hnp8zJj2WPekGIH5U/DlFUaPl6zqpSKwt/R4dRr6J87ZYKIWN5QhuNcmBjMnYi5N4q
	 dfyTqPPGGtiVMZr/VfYA1NAl7dKGyx5/AvFowlgnS8u+kDSW8DvvsUJtqnqlTejS1M
	 UcwVfytr7NZJ3KV6RDaGq18umQt2Uvg99qEChojK9bTC37Gi6UOqaW8Zm1aMhnD6IS
	 GUg7qI8dPSs8IBvsge9lbZkvj2ZQOTrbQ8mEuhxEEiJptVAOil9evPUV33RWzTtwlR
	 bqV7JBI1rE8KA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39677c80386so3744511fa.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 00:42:35 -0700 (PDT)
X-Gm-Message-State: AOJu0YwIaWjA9xYHYEGkOfBww+b2yY57/D24uAiuiB2z4pwk55yxLW+2
	6p9lCwXLCiSovZcx92Dkvdvk/V+EGGse8k1yd+cITqqc/EARqYnkS5k5I4K/ucdv7YDsa6dJXCs
	A0Yg0MZf0HoofN2fBOsr2wVE1g3xMq3I=
X-Received: by 2002:a05:6512:33c5:b0:5aa:6a2b:d456 with SMTP id
 2adb3069b0e04-5aa7c0fed0bmr2286914e87.27.1780558954293; Thu, 04 Jun 2026
 00:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-ks8995-to-ksz8-v4-1-e15149ef21e7@kernel.org> <20260603231122.905771F00893@smtp.kernel.org>
In-Reply-To: <20260603231122.905771F00893@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 4 Jun 2026 09:42:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLkV4yb+e8+q+SfMFn6xh9+-6cdcHQ4yH_eBEj1LFMYNoA@mail.gmail.com>
X-Gm-Features: AVVi8CddqEUNmdHCizuLNlST0WT8-kHrjy8EucFRF_4NySw4BhHCEs0-6rW5PHs
Message-ID: <CAD++jLkV4yb+e8+q+SfMFn6xh9+-6cdcHQ4yH_eBEj1LFMYNoA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/5] net: dsa: microchip: Add fallback Micrel compatibles
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 1:11=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The Kconfig dependency `depends on !NET_DSA_MICROCHIP_KSZ_SPI` f=
ails to prevent both drivers from being compiled as modules simultaneously,=
 leaving the probe race unresolved.
> - [High] Enforcing blanket mutual exclusion entirely disables the KS8995 =
driver when KSZ_SPI is enabled, breaking support for legacy `micrel,ks8995`=
 (KS8995MA) hardware.

We discussed this before.

Putting !NET_DSA_MICROCHIP_KSZ_SPI on the NET_DSA_KS8995
is the right thing to do, trying to put it on both sides would create
a circular dependency.

Sashiko needs to learn Kconfig properly, not that humans are good
at it either...

Linus Walleij
