Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C3D3C1F50
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 19:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625571; cv=none; b=UXrB1P8oD90uy6y8oa0CSGehudf3I2kyOPlxtUUc/E27+b6SK7gSskQgFFZiZALRwL/pCYl0i/pU1QKO5Cqv62y4WQUyVcaTUUxV4jB0uX/03saq/H211zYQv72baw/OY/LCsLAoJg/JYk3fxPwUEkrn6Su32OCUnwiioiskc3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625571; c=relaxed/simple;
	bh=uJ0ImeRyztV7x7OfHAvwUvDYG6RtnwerG7JbMmIpl48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWltoHDIqasx05me982UUwbmcZYWjAlUW4NeJC4mYKSU2AsxkFbTQs9YURF5i4n0BwSB/orM594sLIPRtt3LE5cHzkF1t+B4CsPbd6dLtDBRlwL6Xe7CooQQg+zkyxdkKykYF7Ow3H4ZEip5g7RxHTBs6y+LEC+fWjH0V9r+MOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQ5t79D/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQ5t79D/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589B21F00A3D
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 19:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783625570;
	bh=itjAd6Yu2/1jr1PqBGbi5CDPntn/QjOciL4IWtLxdZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nQ5t79D/dF9D4I9vNXHZ3W3lmj+iTYnKG5h27W7hL8MCXp5iecHai+hqMR3+rCita
	 BzHsa2fgHlPOk5umIDn+ZPyzVgG4x5Pv8VaHywG68m+h3kmwDKzOXHQL+BxuVE/HGo
	 xNUo922WgyyOJG+/EbHppBFdeOwHx9GF3O1wVmsJNJkh34T5FS6wwc+r7HUZv2XZaa
	 dpcahCQj1vtFRxHk1bq9LHIEvd4T19gt68IntGsyGojet9mSrDwN7c5VG/MyTbiTFJ
	 L7YcJMR3sZVtjRxfqDxje9/jJS32vv0pLqzOJCZLlZc0ZuEt195cdhSehTs+ODBHpC
	 UYGsZrDelc9sA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b01910b499so181558e87.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 12:32:50 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw77Ddqg/QSYRJUlz6Zsw6tbDQogZhZpDl06Vw1nErixBtc4sh+
	DIvrN1mlS1Kz3yKWvWs6Rb5ODG76rWiDzk/UQ0UxDYEAz8C283zqHYIwUYQb6q6RL9bazpbR2vI
	4C/Xu+f5rnn2cjNQ20jyxgX09weUYTXg=
X-Received: by 2002:a05:6512:61d8:10b0:5b0:15ed:e1a with SMTP id
 2adb3069b0e04-5b01c63a114mr64809e87.26.1783625569146; Thu, 09 Jul 2026
 12:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
 <20260709-ixp4xx-little-endian-v1-1-e9622d0ba9e4@kernel.org> <20260708224834.138FC1F00A3D@smtp.kernel.org>
In-Reply-To: <20260708224834.138FC1F00A3D@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 21:32:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLmUwxEdEw23H0sk6YsBCVDPLtY_SA=SeBRcxf+jTO=4tQ@mail.gmail.com>
X-Gm-Features: AUfX_mwhYf00QarAzMarBQQ3Wni43KkqpeoWuM9RX7O1CGi0RRu2IeSAq3qhlsw
Message-ID: <CAD++jLmUwxEdEw23H0sk6YsBCVDPLtY_SA=SeBRcxf+jTO=4tQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: decompressor: always set endianess on xscale
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 12:48=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> This isn't a bug introduced by this patch, but does this XScale-specific
> cache flush sequence execute unconditionally on all CPUs in a multiplatfo=
rm
> build?
>
> arch/arm/boot/compressed/head-xscale.S:__XScale_start()
>     ...
>     mcr p15, 0, r0, c7, c10, 4  @ drain WB
>     mcr p15, 0, r0, c7, c7, 0   @ flush I & D caches
>     ...
>
> When booting a multiplatform kernel configured with both CONFIG_CPU_XSCAL=
E and
> CONFIG_CPU_ARM720T on an ARM720T CPU (such as CLPS711x), could this cause=
 a
> fatal undefined instruction exception during early boot?
>
> Since these CP15 cache flush instructions are undefined on the ARM720T
> architecture and execute before the exception vectors are set up, does th=
is
> lead to an unconditional system crash?

Hm.

I did originally patch it like this:

+               mrc p15, 0, r0, c1, c0, 0
+#ifdef CONFIG_CPU_BIG_ENDIAN
+               orr     r0, r0, #(1 << 7)       @ enable big endian mode
+#else
+               bic     r0, r0, #0x80
+#endif
+               mcr     p15, 0, r0, c1, c0, 0
+ 0:           mrc     p15, 0, r0, c1, c0, 0
+               tst       r0, #0x80
+               bne     0b
+               sub     pc, pc, #4              @ flush instruction pipelin=
e

which works fine as well.

Shall we go for this version instead if it will be nicer on other CPUs?

It has the upside of just fiddling with a single bit.

Yours,
Linus Walleij
