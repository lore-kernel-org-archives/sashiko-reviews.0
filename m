Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968D8345CC9
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563422; cv=none; b=eQTEn+Ueh3ZilBLFlwx8UrjbF+fnbtJmSy47aTXyU8tfbpO5bBY1bDp4utdxGkm0urWD4ZjFjNLU3VZNkGb2DfuTF6HjVesc4qwTOmyMOr0MCcwaa5gJdqLee2DtOOyku77o/CN+zNPRD/hfhSUmj6mXIS9TTEAuqYKgSIgnK5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563422; c=relaxed/simple;
	bh=yfgII+sCIcRbbmeIktHMAIA/OZAdW4r2FS8yaL0BoPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JrwtKLXzVLWt69r1EI4oYa5BdKSL+s5FAec4NEoj5UB38Ql0uVL0ckBXRImLGCYz3xqou0T8PBNe+RSgszjWhMeOi35slqEu1RppBNLox4sp+Q3+kn7NKyH+BNx/ZOHlA3eSuXMjHQhlzSrO1m2ncawgpDuTwN6qqA7fQS2r3A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9lX9Apo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9lX9Apo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FCA1F000FF
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789563421;
	bh=qYIGxo8uGGgefO6MCb1hXvqAACEqWwTpR35j+zepoA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=C9lX9ApoW3x/mmrMAkq3/KbRKjNOWW2SC6Zb+MJCLFmmSVWPYWzLI6ntTOnl4Sneu
	 jKlaxtBOcrOOS3fboSs7vxIvkhjAzxByc7Z56SU2OeyD62kyvb194sMPzXXjzlfW9Q
	 0TIAimB7uRufJF9Uk3yVZm0/uMeu2+iXx3xvuPfltCxWAxRV4vdsnzVxTX8xtxBa7m
	 kJh4timROIUP00HeBuraOmQdbTESE8azhG54uVMEAO/of2XPFjzGHemksu+cO0zJGb
	 fYsKwb9erNCegU7GCPkNV60plAIo+DJUozIIdrR81RZiCIptEEfUvd3VUssnNyG6jH
	 4dZexPxPCLKDA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so918206e87.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 05:57:01 -0700 (PDT)
X-Gm-Message-State: AFuF++lIbjfMEvzrUek4/G5NxgZRPDQ9ZGGoGQBWKpWaaOkefUpHU8y9
	FTmYj5hNLUgMSDmLnjKh81d/0osrrYEOLCPTMAFQEochd9CUr83eMJwg0chIoNW25oDORKDB9He
	lLWW8umerZ3fZQ+pgsR9TW8oFE+obPDg=
X-Received: by 2002:a05:6512:3a85:b0:5b6:19fe:a5a9 with SMTP id
 2adb3069b0e04-5b8b666ac19mr1584500e87.26.1789563419940; Wed, 16 Sep 2026
 05:56:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915-ab8500-charger-dt-v1-0-10b7b387e6a6@kernel.org>
 <20260915-ab8500-charger-dt-v1-1-10b7b387e6a6@kernel.org> <20260915215410.A4C991F000FF@smtp.kernel.org>
In-Reply-To: <20260915215410.A4C991F000FF@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 14:56:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLk+pm8KO8reB8C3G9Xy4nocK+jv2nkDCE66oc_KreKRvw@mail.gmail.com>
X-Gm-Features: AcwNN1VYrapLu2jxprX1a6ADdoF0wXaKBNTQw08V_p4BcX9Ekn4h3amOTDtGtVM
Message-ID: <CAD++jLk+pm8KO8reB8C3G9Xy4nocK+jv2nkDCE66oc_KreKRvw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: power: supply: ab8500: Allow AB8505 interrupts
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 11:54=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> >    interrupts:
> > +    minItems: 9
> >      maxItems: 14
> >
> >    interrupt-names:
>
> [Severity: High]
> Does this binding relaxation lead to a fatal probe failure when the
> 9-interrupt configuration is used?

This is typical Sashiko dumness.

The DT bindings obviously *must change* because the hardware
simply does not have these interrupts.

What certain operating system driver do or not do is *irrelevant*.

I feel we need to make a change to review-prompts to tout
Sashiko about the fact that Linux and DT bindings are
separate projects with separate objectives...

Yours,
Linus Walleij
