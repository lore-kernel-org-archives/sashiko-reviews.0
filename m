Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBEF47DF85
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 17:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245936; cv=none; b=fEGXXeO1qTDyjnUFEAZMyi0OJNuuof6mPqxI8aNs1KvMtG9LHffvbFmtE6Vd0NCpSYXhuKbEBXg6RGvnhadbzOYSNHVDeR+xBn5OJNir+0zqJIJxCn9IotT134C1aILUVBHaNwcY5qZy1OBLUI8Xxel6CMba2AAfIFtjTLhcmsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245936; c=relaxed/simple;
	bh=7uAWFTbuwW0A8EhkgTKVElp7s55weZrURiMGD1PGiAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u37sOs3P4ie4ZrWM9v64+7Uv095oDbgmolrVo9lNmOLzvZ6CgsBl/1PWIBoh42MgMncQh33Dff4CDFBhdtb/s3tnaN6H9dQM5FS/fQld3jrovxMJcN76tCX3Yd4p5OsOFNtmVCJHdEUsjro3ckfiDePNuNBDeiMpGqQEyfDb5J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVT28wmc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVT28wmc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2A21F00A3E
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 17:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787245935;
	bh=7uAWFTbuwW0A8EhkgTKVElp7s55weZrURiMGD1PGiAo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MVT28wmcM9wM5hWl8iFzMzVlTh38P3O1MOanmZiTAtOfOvBx+19gPMrThcQdOlHZq
	 ekbmnktvtOXmH5aFBGJzDaA1okmoOxhUlgb52iKWvGx7emxwhj+eXuS8Vs0o0nSPm7
	 nX0me01iZhXyqe72Ke6uJiAH4Kk0ef5wRQmeqrNBxJjrw/sajIbh+B303LPCQZAUQh
	 3mCii7hO3yEqRBesn1qOiYz6cINLdV7LzqgupWtRRZn9rZEWJGSJpddSWIphbI31/0
	 CTTI0+L7xbfZl3TBCXXBblA9Ob8TtAE0XODFYq2Caobj7XD0RynifGjxFCQ9tkUK+1
	 AwXMoA6lKSjRQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aec201b582so88042e87.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 10:12:15 -0700 (PDT)
X-Gm-Message-State: AFuF++nuk7cmd4SK/7UEEtcQGq0F3MQH5YJObhO2Dmxq93eJGpxKPMwO
	yRpPP7k60AJkHveijKlJyT814uqqArPXKiHr5lPDOlTOHV5xh2f2C5wVQDunsnAiLsF1ytImLH4
	V6wK+i/BowDs59Dq2GM89xsyZlSOh9u8=
X-Received: by 2002:a05:6512:3d04:b0:5b2:a483:a369 with SMTP id
 2adb3069b0e04-5b478bdf42emr4443824e87.21.1787245934265; Thu, 20 Aug 2026
 10:12:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1787209558.git.misha.zavertkin@mail.ru> <adce57b3797cae6f6a3486eb1d21c33be61f14dc.1787209558.git.misha.zavertkin@mail.ru>
 <20260820073920.909F71F000E9@smtp.kernel.org>
In-Reply-To: <20260820073920.909F71F000E9@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 19:12:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLkAqUyRPCbmgaP40skfkBkUNQ43WASUGNZ1XNyD2ixAEQ@mail.gmail.com>
X-Gm-Features: AcwNN1WuBUlfd3QbEGmtGfKCwQOg-yDIGx572NjpXjwL0Wf0ya4wIhX58QcD-Ec
Message-ID: <CAD++jLkAqUyRPCbmgaP40skfkBkUNQ43WASUGNZ1XNyD2ixAEQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: realtek-otto: add pinctrl support
To: sashiko-reviews@lists.linux.dev
Cc: misha.zavertkin@mail.ru, devicetree@vger.kernel.org, conor+dt@kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 9:39=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> - [Critical] Unconditionally enabling GPIO_GENERIC_PINCTRL_BACKEND breaks
> GPIO direction configuration on SoCs that do not yet have a pinctrl drive=
r.
(...)
> Does setting GPIO_GENERIC_PINCTRL_BACKEND unconditionally break GPIO
> direction configuration on SoCs lacking a pinctrl driver?

I have adressed this with a separate patch:
https://lore.kernel.org/linux-gpio/20260820-fix-gpio-mmio-pinctrl-v1-1-62c2=
d7dd4903@kernel.org/

Sashiko identified the bug but was completely clueless about the solution,
as it seems to just think everything shoulf be fixed in the drivers instead
of just fixing it for everyone in the frameworks, sigh roll eyes.

Yours,
Linus Walleij
