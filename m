Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064B5485CC4
	for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 22:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789944594; cv=none; b=qMjNHgA1+DP9/rdfXJcIXTss856cZBQV4EJuaS8T0PLASqeh2cufc0LGgVQiF2M+Qoktwjn5qY/Vqog0Ik5gBuyJ/Qw/d35jAK0207XTI1YYsJjVIZ/Gx4Vwn2yWt7K/lHGdnoL40DEqLI3J0hLZulXIQif7WychIo8+Upw/opI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789944594; c=relaxed/simple;
	bh=qIzwQDwEVtfeYujVdFaue191abf1ipUeQuuyy8QbLic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGUI6FjZhS6h/kA6Ge8/esrxdAwqT/6vID6SmwWw2/pY/4JPmQF5bcnVz/b1QG573NNltO44gxFcTx3WsurpSgB28nD4bIj5atlAYpILrXO6K9mhuLbSyWX+S8x2FCC/ehnmC9jk3eQ36lcYefGFwiXH6vlvz+O+7SZubCJyYgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BT9Jrgju; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BT9Jrgju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12961F0089C
	for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 22:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789944592;
	bh=qIzwQDwEVtfeYujVdFaue191abf1ipUeQuuyy8QbLic=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BT9JrgjuaaYbMo5FPAZM5FG3Jf14r1oC3B/Y2qI3QGCJ+8tOddi/tdJPwKwwgzCOF
	 hEu1fKrGFS1O+gtj5o4bksQJiHWpNGNivEoBFF7yRrOn3co288Pu7CNju30GsL/mHZ
	 qK3c7LwqHRZNgNN1BSP7GD31QkjNwFGtxViJb2mptbzSeakJie9IZ0TJTeIieLZ5+t
	 pVwaa5jwhLDOPK56SSZ2oWZ2wjeszPBsDBuwX0gVd3m3TJMWQJ5dcy+fmEKq2CDb39
	 dYwQrFWfNyS6Frc0Ebz3N6Dsor0FzGmxYwjJObQpyM0p8F8OPlEpJc4a8FS3pad1qe
	 hkT+tAbWS0aKg==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff15fadfso9687131fa.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 15:49:52 -0700 (PDT)
X-Gm-Message-State: AFuF++kZcPZ4h1EWyg3TobuzdojlhEez5mN8Daxs7iOokC88dFXfpVMN
	r6c/0m/KERCCWNwrEHGSGRWIt9B82Jl/d9JgBs/ILLFIt/mOD6A4gJbncpGVHHtRcS+HtdX4HJU
	HSUF95f+kRRTXK3yFcVdYsHkoV3kk46A=
X-Received: by 2002:a05:6512:ad0:b0:5b7:6665:1028 with SMTP id
 2adb3069b0e04-5b8c1446a04mr2634731e87.9.1789944591662; Sun, 20 Sep 2026
 15:49:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918-ab8500-charger-dt-v2-0-5f17c332a2a7@kernel.org>
 <20260918-ab8500-charger-dt-v2-2-5f17c332a2a7@kernel.org> <20260918170734.2D5861F00898@smtp.kernel.org>
In-Reply-To: <20260918170734.2D5861F00898@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:49:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLntM9EwSd0f+HYFg7N+a1C9Be=F+bTjnDLCfYCN9vaQJg@mail.gmail.com>
X-Gm-Features: AcwNN1XQl1vcQewnO4NYSDjycd4RfYRBcHZSCpgf0f-kM_-nm9izaTyQivTqP0c
Message-ID: <CAD++jLntM9EwSd0f+HYFg7N+a1C9Be=F+bTjnDLCfYCN9vaQJg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: ux500: Use AB8505 charger compatible
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Fri, Sep 18, 2026 at 7:07=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> Will this cause the ab8500_charger driver probe to fail on AB8505 platfor=
ms?
>
> The device tree node relies on the "stericsson,ab8500-charger" fallback
> compatible, but removes several interrupts. When the driver probes, it
> unconditionally searches for all 14 interrupts defined in ab8500_charger_=
irq:

This is fixed in an orthogonal patch series. No worry.

Yours,
Linus Walleij
