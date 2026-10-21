Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577139;
	b=qeeytjPYOE3GAVGrxERZ5EsTcYrMl/Yy1TAMA12bx5F5ZJkbfTBR4EPZLahJ3cJBxMSj
	 RmSYZxbT+AqfXR9s0m3xUNGCB9M2zhvpKOHf3sK5tvHexMuMA3XkSpBBp+yecdXbw8ls7
	 TDnfg9SLoHwfIEa+CjSezJJPGfG/7vg39RHmI2SrDpIt8orOW3KDN5m/2IW2TvAEZIcDl
	 bEYsaRe8LpcAJpjhMzIBGWzOP5xJ3miiavgU6RykFQiqH+yogsDmwN76hamZ90s5Lw9rA
	 uWcb9BSQ219nT93yaIidHP2vF1p08iJUHCIepGmmlOFyXBu0RVwVaQAyBzvmdsB+Euw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577139;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=RF0qZYLxDSre+DZbeZnQ0IZv7m21cFrpxvATORER0qM=;
	b=fxHcX0Hrl5ph5+oVQsInhF6GEFgjdpo19kcxrmGecmXsqdFMglLqMVpKLrpg5tPp+wjR
	 O4zsdPGjgwsY/WxJ7jn5MK4I61yiITd6btf+u2lK1CfrPooUsjkLp3oqKT7VHhFB+kibF
	 7rRZYLeCD7aWdvvKaTFsoYnDLg70EVEmNkZ0ucRBGIePKGxdE6fgcNDkhF93xkGIOQxik
	 n9o+9TxSCrRgLMiq87tHr2g84fgESSBQ6y7zYSRr/JLbOLlCGTaoaXVBQO368VYpTlNn8
	 d99IcA+1Ir0JmcRF9pCvJVcDVULerbpn58Pocy4UpHvzfSNmWsozJu4VziUL9iY4mKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lTzQsh1k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B289C606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lTzQsh1k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4BC1F000CF
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792577138;
	bh=RF0qZYLxDSre+DZbeZnQ0IZv7m21cFrpxvATORER0qM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lTzQsh1kHXCFuX+y5jkfaJb2PYwzkSd4KvmhhI1ekqXmJSoUGKX+Q+zJ5LY3M449v
	 rj4NKrQ9KF7cfnjd/Z1m8g+7+dsPPxzkSTcHnVvRf0kjd+Xvpg4GrG/U8kBswG1SKS
	 GAzV/O09EzcUd+Gu6P1ERxMUmmtMIH7zeOy9GedAkPKVzcGBN+BQ7pK/vEbiGSux5W
	 5N94w/Us/lh8MwzjQy7pgMK1PL/yceYGfGNim/yQg1vNnb8VTQQuL9BOh2e7lz+zNR
	 hcNbC9Yxq/MyRfoEoEYghsbyg/eGh8AnlZ7kiVRF4hEelQ92XbtUm6B4cPmjgozsdE
	 YTd/xKctEYNgQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab35e31f6dso12793751fa.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 03:05:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwM9zc3bbX5dTREo233/So/NXeOTLa6qko/zxSjMPUoNugZvfQqOrjuSALcmhQ1EgFoS0KruAhtzEMAJ1idw6w=@lists.linux.dev
X-Gm-Message-State: AFq9FYJyd8xbEsmvJxokB1RslVS+OPhbLPT9BFMz6NyO9LZ5Pm41kxeK
	yQHWoIaV3UBgx+VxrCnUMCyWlmHHA4z3njbGDtUqsBEQ/T9+nShUlGKxJPxzSES+CrjpNU5fKSW
	5fjbGOgWv5WADv2weMZmvcNcCmxb2NTxYnKIcn0NhRg==
X-Received: by 2002:a05:651c:31c8:b0:3ac:4b79:573b with SMTP id
 38308e7fff4ca-3ac4b795a82mr798221fa.13.1792577136866; Wed, 21 Oct 2026
 03:05:36 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 06:05:33 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 06:05:33 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021095551.3283369-6-aambrozewicz@nvidia.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261020-gpiolib-chip-removal-v3-0-aambrozewicz@nvidia.com>
 <20261020-gpiolib-chip-removal-v3-6-aambrozewicz@nvidia.com>
 <sashiko-outbox-179021@kernel.org> <20261021095551.3283369-6-aambrozewicz@nvidia.com>
Date: Wed, 21 Oct 2026 06:05:33 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mduzetc38ZttGFEQqtOnyvD-PumZ7=m5FOEF75eGpq55Q@mail.gmail.com>
X-Gm-Features: AclHuK-c62CC1jnmwGO1-TdnPZcp20ujz7YeGKQLtN4R3iNiFa4w_v-HUz41X-c
Message-ID: <CAMRc=Mduzetc38ZttGFEQqtOnyvD-PumZ7=m5FOEF75eGpq55Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] gpiolib: let the character device free its IRQs
 first on chip removal
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 11:55:54 +0200, Adrian Ambrozewicz
<aambrozewicz@nvidia.com> said:
> On Tue, Oct 20, 2026 at 01:23:24PM +0000, sashiko-bot@kernel.org wrote:
>> With character device IRQs now freed in the notifier callback after
>> rcu_assign_pointer(gdev->chip, NULL), can an in-flight dual-edge interrupt
>> handler queue a spurious rising-edge event to userspace?
>
> Yes. With the IRQ thread delayed in a test kernel, a reader blocked in
> read() gets a falling edge as a rising one when the chip is removed
> meanwhile, with both uAPI v1 and v2. Without this patch any failed read
> does the same, for example on an expander that is going away, and so
> does the HTE thread.
>
>> Should edge_irq_thread() and lineevent_irq_thread() also check for a
>> negative return from gpiod_get_value_cansleep() and drop the event?
>
> For v4 I plan a patch before this one that drops the event when the
> read fails, in all three threads, as debounce_work_func() does.
>

As annoying as sashiko reports are, I think they will result in better code in
the end. Thanks for addressing these issues.

Bartosz
