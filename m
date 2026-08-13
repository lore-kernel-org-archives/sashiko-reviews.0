Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805C135E94E
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 04:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786595958; cv=pass; b=kleVXSsoWLso1TnZ+uVF0np+RnMBKO73ZgIgHymx6e6b5pJc5zZnPlagGVY91g8IpScVE97jd9a+yKuZacoAtMhDoTYMryZ9soIrXUi9ZTWbxggzY4/eY5FKwHkIyxqip/wJK+zLNnR9w8erTv78wZuPd6hUe701pOF5WEzVELM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786595958; c=relaxed/simple;
	bh=Ofy1wJzt3/70xLfJfjodsfIDueywj0cIlAEBEaS/uAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8pwoygOFwAoRC2OJQ82cEGaqwCnPvrZRWxS9SuFGHgKUDnZgZe7jqyoD4EVlnrWtHa01rQ7+Rm+cSVM+J4qv5k16Ae/jE4LUHFU3Qx1nZ0nTwWX4Na+469SZw2HQD0CDbyINltnQrc3Zrwxh8Wdu1i+9Nv+VaEGNMYdlhg2sr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6yrUVfo; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6yrUVfo"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so1495388b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 21:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786595957; cv=none;
        d=google.com; s=arc-20260327;
        b=LzTHux/UhZzT76EZ311z6OmsJwygaRG4F2NCdefn1n/z4xkmDy7JvMcGPlP6OMWxQh
         wzmBuD9OVfPeFScdrtzyxqaNHDn+/3OV5X723XEGIu0uOW2/WS5kWwQhT9Rk5ufHQI++
         XWq0OfyYK5/9nXZjN5m933VIBLXqt21vU32N83fP6qidUmWUQbgUlbVNR9VWn24Pekq+
         m6jC/6hOI4xChgA1CVfwVR8JrBwXvkx8jujQzOu3e6FBP6AbaqX0Qp7NF6Q9Y5IqWlBP
         1eOR8/dx5WZBF2AhlgEmjHqVR95nS/WbOwTqQ1OjTc9m7HXfZjy9Q01yEWAmjLspAu6s
         CcGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XYpEx9HkEnMrxTTj9VAReLXkOthyicSAduUByBP+u38=;
        fh=WJ81iVv7VVNN3XcmqLwfLU/KtKhWcyunKbGcwKiNOFI=;
        b=mmPkTlmG/6VuttGIeF3oJDE6fXEEqUK5ORqD9FxGFLxGwsRIn/xMaTY+cEHfi/lY/Z
         W2+u6APuHEv3h8uobb0oYxvUzqnpuSsIzHfbMg1ZdlsBLZWu3Sj+HhSFdNH23wWK3d7m
         gKGrDRbg3V88xDhqKSrQ3pdT9I7M1Sdz2LHgSEprfMyTCoG2r8vN2VI3RDCpaH9AwdvR
         3ZF27r61s3tgvmktBwU6si9FPgcHuU/oTEFEMTTMXXvJ3QFmey9Wve4BZloFCWcqCvcO
         Ehfm3pYg5l/1PNvGwuJM4M332NJpoGhXBu12gg3BW8xlTDNCmGRi+ZhNRcQqiD0o2HJ2
         Ed0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786595957; x=1787200757; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XYpEx9HkEnMrxTTj9VAReLXkOthyicSAduUByBP+u38=;
        b=j6yrUVfouUkCaSvyif9r/1RapdqF/8kdGJpttKixtJi3aKvBoI+QC6CSKRZXlFU4C0
         8DI7NvqILumm2wD6ebNBgMkztlj7XdT1N4mIH3C91oDs/2lRjyPikKtR3VpEUTQM/IHV
         aBveiQvaph5tj5j+Ls6+5jErx3dxGJxI2APnZObcpA1ApMliFtUzR4kjqBMxM9VVrvAi
         ySoaotuvjXQaVFoQE68Chf0Ppb1Me2/YzVXe7ubZz1h6r3NWm5C10F2KahtpAsfGxNZF
         INd7gkf/ZZzkGr2ND1TYYBc0xweWPYqa7UXbBmRZZ/Z1Ls5KCoY3Kb0GaE/TPZf6xMVA
         BYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786595957; x=1787200757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYpEx9HkEnMrxTTj9VAReLXkOthyicSAduUByBP+u38=;
        b=WdJIvNydlrTnYhc+z90fD8mMsJLwwIYyGcrdcZUxu2Qt57sIhlDHMz9uUqhZgniOnw
         ttuaVip2JuSAERrDsxyNZUtpN65fg58YNPFTBxlTCO0K5SxtsoF0SiibD+LIjnLn+OUw
         sY5+FRypHWTBnAUW96Pg+pJUYuU81/FNXSX33uVC8gN17dODmglJ1TqYnjXSR95dNqtp
         G3GHTQ3nP5GfuQL/fFM05tRscrbxjjXuydjlO9sB+DvS7Z4j5bW1mSbo4BcDwGX6TdA7
         4hzJd+cEr7f2U2BXQ6/sWYxYrHG2Eh6+/M10B8u5fVebX8ktS1+BvFdmYdqSdCFicC6d
         TUow==
X-Gm-Message-State: AOJu0YwiUxSzww2GT9skZQVuy4IDnaMCvYZyFrx0TK7crd5voqum4ieH
	WU210JFgA+F5IDdS6cNsJ3fqTWF3gMb7Gv0dLVcI86yCHochKNO0sitrXLspCNoBlkhsw10wTsQ
	/itpwxG3Di5DpsvrTB5towvScnBD/1/WWpqGf
X-Gm-Gg: AR+sD111EFekD0X1OQ4fuZPD6oDZ7JcawRkx7494lYxhq2LU/T96CZDTCwWrGWS/Dcn
	oFwaF30dZJwN0FxF6fMAuGiIaXsRpq1hIijz/qNHEVqfP+/dUDM/FdThDhnojAB+lKKeP1hTtlo
	L6jxcI/Xeua10QVEiEWvhAcyHeQEnWTBRSgpnFBdpp6LiVAoOU0sBXPmnw6nYPowa906RuMbuun
	+u+5dWABUNk6LcAHpXJcd6i3grItirPb76vD5dULTxjhuf3g+n13+/6Ojf/bZxWkJmuLv64SyhL
	Xuy/ZCajYXs9Ox8YU9O+DxaDqqDROHouZni6wkb56UC9QaIw1K7OBRS3luy5+CZ51tnxbwr+820
	WjyUckc+zYiWELMnapiJralhfqVOzpOm14PveeM8L+IXn7fgeEUdhjtOs
X-Received: by 2002:a05:6a00:2e09:b0:847:9ce5:d293 with SMTP id
 d2e1a72fcca58-84fc75d7052mr3029392b3a.24.1786595956685; Wed, 12 Aug 2026
 21:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812112023.42254-1-phucduc.bui@gmail.com> <20260812112023.42254-2-phucduc.bui@gmail.com>
 <20260812114044.4D4481F000E9@smtp.kernel.org>
In-Reply-To: <20260812114044.4D4481F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 13 Aug 2026 11:39:04 +0700
X-Gm-Features: AUfX_mxIGA074y1m10Z4uUGjKnNbeOvwgaN0R96bR9Dhl-K9zsWpmGzk0Vj6-cA
Message-ID: <CAABR9nE1r3-2eafWqfTv8kJg7G_urfC0hP36NgqeGt9QPf6NrA@mail.gmail.com>
Subject: Re: [PATCH 1/3] mmc: meson-gx: Handle errors from optional IRQ lookup
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> [Severity: High]
> Does this code pass an uninitialized variable to mmc_gpio_set_cd_irq()
> when the optional IRQ is not present?
>
> If platform_get_irq_optional() returns -ENXIO, the assignment to cd_irq
> is skipped. The uninitialized cd_irq variable is then passed to
> mmc_gpio_set_cd_irq().
>
> If the uninitialized stack value happens to be >=3D 0, mmc_gpio_set_cd_ir=
q()
> will accept it and overwrite the card-detect IRQ configuration with an
> invalid or random IRQ number.
>
> Could cd_irq be initialized to a negative value when it is declared?
>


Okay, you are right. However, mmc_gpio_set_cd_irq() already checks for
this case:
--------------------
if (!ctx || irq < 0)
        return;
--------------------

I=E2=80=99ll fix this by initializing cd_irq to -ENXIO:

------------------------------
int cd_irq =3D -ENXIO;
------------------------------
