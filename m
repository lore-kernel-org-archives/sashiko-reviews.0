Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397977;
	b=t8bQ5lHIIdkZFQhJVvBjBOhxrox169ckrRlm+ce/M7+aJ3vVWl1+55MYWgZj6QJluNtu
	 +v4byzo8y6LsmCHw1cZP6iUdzfJc0AwJuVjSgRBxSEdfyEjcuyhf56IZ6C9Ov8PyDMXFA
	 pJwbHBENa1w6krrylg10NGfLXMBjsTf5nYvIGIdTHlF2zmCD7nszYwJL8YcwJy35jX2kZ
	 Gzt06heYJh9mI92UAQG+4cIvlqnZ3vZ8vWO4U7ClWa8hWLYChqLO9NQaUuJkd7SjoyeOB
	 EGapFYab31A9GBu4eUXdqWhgo5CBfCnYpjqKlMEsbCGFaIdQQ15Z6O/gFGCZjh+tIoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397977;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=MpHh2GYNJRtOhiRbv+gl4MVWrtLcyIbDIAcJ3i7bHZo=;
	b=3W7UxZHAJ1fhAyAUWoDMwM6DcMuWzszFm25kHGj6oJWageNNfGw5lATM3e/DlNAbimTw
	 kE/IScbNE2nIv8paXVND0Kc7BXS6UiSk/6oR1Zx1aD2zzwWfn13pqWdl6XMrXfrEiaO40
	 HVaNEQ7AauXIPg4tjOJlNp4KfjLudjO3q1+c0fN5AC6sTWkH0LC+l5qL82UFRSJva2cSW
	 wNMD47G9U9uehOj4ozx8Akd4ISCey30p2SRwy5LP7sjqQb4shoI0wc2n6y7dR87+M3ucv
	 UVjdaIwVxOO41Avvlm5gWrfrNEa0PZTzpFtI/opHNdFOssHXtIm2oxDfKspOucXUM1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nEO/Sns4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C870C606A32A
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEO/Sns4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634741F00A06
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 11:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794397977;
	bh=MpHh2GYNJRtOhiRbv+gl4MVWrtLcyIbDIAcJ3i7bHZo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nEO/Sns4SgkX25DJRlGI4E7B61nZ+38OvpTIjlYgqCAzSEtzxMfTToh4zV/TvfOuP
	 7dsDlsKRAdcPNKg4jd0cF3HXsnai+5EiujODNzc2dBWQ0f7vzT2n5F9ejZsg0NxUnn
	 Ef1S4W/FVDaciFpTmvqKOsRgPFf45/jQru8+wr+YcEkI1GranxNVbBNpx0qKaoeuIK
	 JuLgV2iPhhYfRhlwTJlC6awPCByHfJlofyKile4lFdlM7OERj9QGoXtKDq+Fy94/Tq
	 OlZ3gqACcY4TKf/WgF9k1AKKK2jToOWgQyrl+JCHvMxIntRRdzftVuD0ltTZ/Jw3kQ
	 F00jsHD2BHVjg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so23995081fa.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 03:52:57 -0800 (PST)
X-Gm-Message-State: APuU4Z8bhKQXH9jpgWIAsrHNm2rQZWLSCn1/VQbw3PGI7RPHJ+qpAkWm
	FO+pjJrgN34ZbjC4D5Di96PSRq6aUKkwU/4yK0FBIEjn0OwnbLBVwGc7FOUBqZXRNG0EyHY+/CL
	eKioK00otaEtOp0VmkTxQlwSRadevSmA=
X-Received: by 2002:a05:651c:41c6:b0:3ab:43ca:1daa with SMTP id
 38308e7fff4ca-3ae125cd671mr4824141fa.3.1794397976185; Wed, 11 Nov 2026
 03:52:56 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
 <20261111-xg6846b-bcmbca-xrdp-reset-v4-1-17035a5e8ad2@kernel.org> <sashiko-outbox-208856@kernel.org>
In-Reply-To: <sashiko-outbox-208856@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Nov 2026 12:52:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLkZXwXhHhvjQvbc4AT6Zt8mBVL0yujKoZOU+MsLvFFOng@mail.gmail.com>
X-Gm-Features: AclHuK8sYNT8b4r7s3hjp4u_srEnhvmeaQbZaxImLpGAFvZ6UoeInuaEUc5FNMg
Message-ID: <CAD++jLkZXwXhHhvjQvbc4AT6Zt8mBVL0yujKoZOU+MsLvFFOng@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: soc: Describe the BCM6846 Power
 Management Bus
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 12:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: Medium]
> As reported by Philipp Zabel on RFC [1], should #clock-cells,
> #power-domain-cells, #reset-cells, #thermal-sensor-cells, and the
> reference clock be placed directly on the brcm,bcm6846-pmb node instead
> of requiring four address-less child nodes?

As was pointed out at device tree review these are different discrete devic=
es
and it does not properly model the hardware to bring them all into one node=
,
they also use resoures from each other so this will look super-messy if the
same node is requesting a host of resources from itsef.

IOW look at the later submissions and it's clear that this doesn't work.

Yours,
Linus Walleij
