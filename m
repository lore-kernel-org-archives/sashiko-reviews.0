Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E663A0B38
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331115; cv=pass; b=J/MCbToajnwMeci8sWRHKgozT/4pRR3ZkRfSer4Ao9l2CgrLhUOaJzS9iSHhXVrZ/RmYBVe+F9oyyxPAgpna9icJgX9AEnQYpkgP8i+6fwc6VoxsJHkJCq8BduafWwf9M+9hfoGM5UH1ksRtzZcYe57kN6vMcbf+5dOIreMUs/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331115; c=relaxed/simple;
	bh=1y/VyBqChORatgg7mbBlbrll73whp3RgKHcndf4sJ4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NoD/daxb+sxN3QGWYGy2dwQR+EggneNQICq8wzbEFECJW8rLgVGGYIR/5bGSsUBwHaHvWUgw7O3DI9JLhMqZjWmp0hRZxIfnNtMsXslgi3y3uXEgAtvrZEOo4UEaQhpf0phx/KzEAEY1eT7Gp16/FOjuD9N2GmYOc7f3Am5h6YU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szK0gWw4; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szK0gWw4"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-666275a685eso3819430d50.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 02:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783331110; cv=none;
        d=google.com; s=arc-20260327;
        b=jYAJNBU1Cwsa7MENHvBZV7H8NaYcgs+bqdXLEplI/xgzmVIJVbfoX8HUizHhalaFS5
         UboqjSnAyHKF/OtvksoJx9xk5fu5TFiWngp9RIj2pIXNOuUSFc5U6cspBcARjAfeMJSf
         FxPU1fmQ6qWVxcDnIhkDBzcISphQrlHAVOUA3NUUXkJbwmefS98Co+0YZY27D6nmd9Q2
         06Ldgr9D05HhQ2qXKLaUisMvYFuEveziLpfweopSA6TfT4+b5FMEhYYJ13DNRUOUlcDH
         XS/KZfiLEJ5XYH9XQSfx2MCHSo1WxBpiKAlegX5EuRT/T7UoOt4gxxOexB74woZaMtUk
         n43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1H5aWjkuNw5NurkeFzN9mtbKO2yqm1ouDy30sVuvqjg=;
        fh=l4STnmXMbZ7+SgLMaMr2biBIFpXPSwAQ6S5KWSNWQnA=;
        b=WoXXk4uHnMKQJ5OxP2/5JqW+3mX1QtCgvrOiQ0MjlXCjmayd94F8Cw6MuklOOeKAKO
         by51JRcMNpAOc6sBq+xJGwHaXaQSam8syxYOGgilbsTfmq7XhLvqnwdftx6aBZMvTO8a
         nQ5xmB+oSXbiBmnPSIsRmziShQc/ojHaAP8m21AuGYigRJDKB1p67LQ+Ll4NHEgugZq2
         mPx4II2URsce8E1jMyJxJ1k05tRZV+RMiqZk7oo5i3eCm/jGHO99/GhJKhtqVmNPzEqx
         wpgUE2is3/SQkaZgvpQuYEP0tNbI/2yaQt/6FQqaaEqweeFUmH0CSYWTzlmv3oVkfZs4
         bdOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783331110; x=1783935910; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1H5aWjkuNw5NurkeFzN9mtbKO2yqm1ouDy30sVuvqjg=;
        b=szK0gWw47yy6jWOrUlyomoczLgFlcmvyi9rHgsVQh/qO5szqeEQiSZ0ptTBIqEzkaH
         ekbnvEhRutzxaTirpQsMfJ2SC+fJMIkavPqIT23nUIE+kLNRvSsFRewUS+wQGbzBNevz
         YYCkc5qH1s1TM/2o+MaRifxZ9ZAGE15Zd9JEE+VmLrapCQDJCaZGJvLzO6mjptACbVLf
         xCQFyZB9go8uqBM99wS1ylFl0rcZ/3gcNxMFhfFd1IWeF8cwYkJBfA5kUoxoVOkrFW+d
         xSG5CLsg0/mG7IISrSYM88RE9r20jluaYt6fjMPiI0yn0FS4sAOUfE4FPbneVvmzh8FD
         mEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331110; x=1783935910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1H5aWjkuNw5NurkeFzN9mtbKO2yqm1ouDy30sVuvqjg=;
        b=n/ZLFyzZLy+IfrpOAm0c4p30JM+UxhUaneRKgwnDOlZEmwH0FHaseOZ0oYaKUgRU+H
         TCJw6rjwf6yKt7g+BFvfSLGIB8dyusbs9adoLFW0JWRaCpErvW0N9lioykavJehL2IfY
         pJSIAT6cQjiRTvQH0aNjO2VUVmBd0UF2xHTcbE7EbsF8YngzwSZfKZ2t6066QEpObnhi
         nfQQzkS1Wf45dGtfpnO5ri2BT4v0ZwHtu3JJXhFoLInw7g+RbbLMwMJzKFykJenIdqaV
         0w88xq+2rRd2gav78p/Y3TKGYhc2caA4I0CcLtuxZILdIWlxMCsDaYq4wXwdMcQ/3y7P
         AhXA==
X-Gm-Message-State: AOJu0YxZNbdt4EZsTVD4weJ0zH4YkwTYhym6M/TTBA3v6rjeSY0MBjzQ
	EC0Of1HdKY40Hvg5/gHk5gBcfQxieAsVqq6rkm04Rgs5ZzyXW5V6aHE0HmNDi+V+rk2Jt3uIPG1
	tLRwpq4Xoqlt8JJaAHEIwmdKw9FpDklItvg==
X-Gm-Gg: AfdE7clfijnLFmLlyENTQ8hMCxN60XbySj1JLvVaG6gVuq2oUpL2wll4cigOFv7yUUv
	rqk0pZKfgaKgBt15wy5pobsHoM2WS7ijl3sE8OC6KvdytW5HpPK81rK6O8F3lP8CqL3bmkggH8q
	oUX8/kN7JvHpmKMhnOb3rQDDJHt0DfEUmRuLYBl0iXD7Rwy+Xiyiu/UW6vkLQf2VsrjyzOzvv0g
	szsrvk2ItE8ByAblRabXW/ahGb9xNiwc5CeblDeFd0g/vYoDx03Y8u71bfGiPvVmnX8x/V72g==
X-Received: by 2002:a05:690e:1408:b0:664:e8ac:21cd with SMTP id
 956f58d0204a3-66652e50610mr9454023d50.25.1783331109980; Mon, 06 Jul 2026
 02:45:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260705140100.1543486-1-tmaimon77@gmail.com> <20260705140100.1543486-3-tmaimon77@gmail.com>
 <20260705140617.A71F11F000E9@smtp.kernel.org>
In-Reply-To: <20260705140617.A71F11F000E9@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 6 Jul 2026 12:44:58 +0300
X-Gm-Features: AVVi8CeAp4CE3AWU4FV6AWJHL_1TkqiIDqOBExjjPuk3wMGkf3cx2S3XYhDqvP4
Message-ID: <CAP6Zq1jT-bfHvw65EsDKdqMCLVK1Yw3dd0NaxpOCw3zx+hVMTA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] docs: watchdog: npcm: Add reset status description
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, 5 Jul 2026 at 17:06, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The watchdog driver abuses standard Watchdog UAPI constants to r=
eport non-watchdog platform reset causes, violating the userspace ABI contr=
act.
> --
>
> commit 72fd6c8b87d96376853f3dcd5ef1597495cf9817
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> docs: watchdog: npcm: Add reset status description
>
> Add documentation describing how the NPCM watchdog driver reports reset
> causes through bootstatus on NPCM750 and NPCM845 systems.
>
> > diff --git a/Documentation/watchdog/npcm_wdt.rst b/Documentation/watchd=
og/npcm_wdt.rst
> > new file mode 100644
> > index 0000000000000..cdc45ade9e0d9
> > --- /dev/null
> > +++ b/Documentation/watchdog/npcm_wdt.rst
>
> [ ... ]
>
> > +.. list-table:: Reset-cause mapping
> > +   :header-rows: 1
> > +
> > +   * - Platform
> > +     - Reset indication
> > +     - Bootstatus flag
> > +     - Reported meaning
> > +   * - NPCM750 and NPCM845
> > +     - ``PORST``
> > +     - ``WDIOF_OVERHEAT``
> > +     - power-on reset
> > +   * - NPCM750 and NPCM845
> > +     - ``CORST``
> > +     - ``WDIOF_FANFAULT``
> > +     - core reset
>
> [Severity: High]
> Is it correct to map generic Watchdog UAPI thermal and fan failure flags =
to
> standard platform reset indications?
>
Yes, it is something that was already discussed with the WD
maintainer; This is why it is mentioned in the rst document
> The generic Watchdog API defines strict semantics for its status flags.
> For instance, WDIOF_OVERHEAT means a reset due to CPU overheat, and
> WDIOF_FANFAULT means a fan failed. By mapping standard SoC reset causes l=
ike
> Power-On Reset (PORST) to WDIOF_OVERHEAT and Core Reset (CORST) to
> WDIOF_FANFAULT, might this break the userspace ABI contract?
>
> During a normal cold boot, reading the SoC latch would unconditionally ex=
pose
> this to userspace via the WDIOC_GETBOOTSTATUS ioctl or sysfs. Standard
> userspace monitoring daemons (like systemd or wdctl) reading bootstatus
> might erroneously conclude the system suffered a thermal event or fan fai=
lure,
> potentially triggering unintended emergency actions or false alarms.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705140100.15=
43486-1-tmaimon77@gmail.com?part=3D2

Thanks,

Tomer
