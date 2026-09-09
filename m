Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10A3530E1D
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951087; cv=none; b=nNfYvDq81yLA+S/njAgANQalFyWzYSaIDw6brxtaHV2xK9E2RagCr2/u6RLhR0Ypktc/FCBYJxLCAFnLAR2rQv3KvMucnmfMMzWJg/51UiEX2caU9QNtvbw/Vf1+DhIp0yRcv9eCZQuLInc1KU7Xs/l7ehcCSr8YlR0CoctLAoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951087; c=relaxed/simple;
	bh=ggVeGyHoHOLO3BPYW9Kqa83ZqzWEp+eSywDeGUiCBqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxBz5URE/WvY/6vVdQJMIycvBVY5gLAYNU5ua1MQmNRNKFMyENZHAOX/Cp4FBcAcvZhud+W3x01CBNa0kNc9OG9EmAY2GY6UsuhGGx+OPj6x93nZXfsx7LLRHUnxkRMikBgqaDF6VLBwmxAMyYQCLxvFtKubH4aWNg90mtoSLwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1qTvONF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1qTvONF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CAC1F00A3D
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 10:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788951086;
	bh=ggVeGyHoHOLO3BPYW9Kqa83ZqzWEp+eSywDeGUiCBqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Y1qTvONFpGt5+9JfJucpSMMYEZyV4/dWQg0Y8fUb/vEOLE/Hmp94MNftPtBS5XLD5
	 dStu4npC6JAxjAxJiStIdRaH0tWag2cMch6is8FIPLkGfaUIrNsuVa+JotxXdvuqJy
	 YAwzysCJ4sRQ95jp18Gjgszw5hv+UAfKdJBI6K3SlwFs25GMLueeaymxrGaq9mEJMK
	 SGXAgB1rrLxHLvlzPBTKxngthjI8sAQC8G906mPf/2lhr3cq66+spR7hPHrdTFSUEX
	 P+AJlzeZBgs4aBhK5Sb/ORANRt88a8oluVra2Kz+7KDc04N6P8bqtIO8+c47MONszg
	 xkGJTv9T0YIhw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so30258e87.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 03:51:26 -0700 (PDT)
X-Gm-Message-State: AFuF++kqaQJSGlW1Kkd8ooaauFJjiWtMxBSfNb2IMllldw/3DfTemFlR
	rt/t4o7be5mlqytkPwtWZmDW0+3TnouVFPlQCcZvJGiH5YDwXsEMK1idtKCa3jhzLLcPEZOYheJ
	rb77qOTEKDMN7SUOP+wR9Malo0NpMVwU=
X-Received: by 2002:a05:6512:2c98:b0:5b6:183b:d1fc with SMTP id
 2adb3069b0e04-5b898108197mr91864e87.35.1788951085037; Wed, 09 Sep 2026
 03:51:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-ks8995-to-ksz8-v10-0-7379239eb65f@kernel.org>
 <20260908-ks8995-to-ksz8-v10-3-7379239eb65f@kernel.org> <20260909093927.591C51F00ADB@smtp.kernel.org>
In-Reply-To: <20260909093927.591C51F00ADB@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 9 Sep 2026 12:51:13 +0200
X-Gmail-Original-Message-ID: <CAD++jLnLH_3fNgisCnVL+rXHTh=C6TE7_Yo1dwSNHvHa22puTA@mail.gmail.com>
X-Gm-Features: AcwNN1UCtDQiSV4B9_iXpmNe1TOSKYKpBOhwF1piLI_4f-QKlLOLQ80rFyfA7kA
Message-ID: <CAD++jLnLH_3fNgisCnVL+rXHTh=C6TE7_Yo1dwSNHvHa22puTA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 3/4] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 11:39=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: Medium]
> Could this polling loop timeout and abort the switch probe when checking =
the
> CPU port?

No, this is a non-issue. The code has been tested on real hardware.

Yours,
Linus Walleij
