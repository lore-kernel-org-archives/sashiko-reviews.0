Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CC14AE13A
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 16:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353397; cv=none; b=Sdz8C8yjgD3GjO6VSAnLU2DOqMrTjscAb6H8EwfBhx0eymDNRUiUnIDFyJbp/ZOufxLaYg+da7pZvnjylgLiOq0QS7NsKHo/kQSAxNLfGLngU9qRKIk7h37XbEPbwkJcqoEHSRxhUICTdtTJdAQw04gzxN/zoE1/hRVAWAMidEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353397; c=relaxed/simple;
	bh=CSnR6SaHncmXObf4vmkQBy16CuGf6WWFDkg77Cbv8sQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0VNgNulJE687Fk8zx3Z3UcnUb1iX9E+dAjXiyb0xjBb/46PLfsukFVxYChY0SJLs4W+t9WRVYMraeXGo1CQHijJwqMv1HDo9xgo13wJyap3EzaCLB712NoI9MqhQycFoKdNhZdbi7nviSZ/afYpOCVJcKLkDX8lZwq1eipkTtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSG9xzQX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSG9xzQX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57791F00893
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 16:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790353395;
	bh=CSnR6SaHncmXObf4vmkQBy16CuGf6WWFDkg77Cbv8sQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WSG9xzQXdb3HCv7S2Qh/LMnRV37Pu03tOztoElQYoQkgDDnq2u/gVzJGf/MjFcn32
	 9LNh8uF0svx3zMOOrZZUtmFb5RbvpxQzfjAkyon2Nu6brpcs0r3EfH4lFlQ44fmOBm
	 nLSdXxdJ+jLA8iD4CtpH9+2ZRabdvk725TMJmkTP6SI3nALjrClrwAU8xsLegpcOVU
	 +6iVu2p+LYS5auhk4xpkYDWbyNW7h91dV3gcvhtpzLb6RVxq4EIkAd0VGHZ8xfDQbg
	 BQdR0f78pTOVRQnn2B6VXsKv7gN6mDS4GY7QgSsfBkby5a+6mmyFYLe1xMGagoGzgX
	 wgT0vZ4AdnTpA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e6ec4dc5so712677e87.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 09:23:15 -0700 (PDT)
X-Gm-Message-State: AFuF++l/BjVlAjVrVKraNHDR25gFPbmz/dPH3xb+MV4WPSlruJx9+eGN
	A5u20yLeES5o2YwPvpGyeRk5TWslba9VZ/lwIeHbGSI6T0iAyCO7Xepxkx1BpQyyZ5JfbHSIPmN
	FZu3qziY1c4pHMg3eDjyaaLq3qXGakpU=
X-Received: by 2002:a05:6512:620d:b0:5b8:9a2d:3a5 with SMTP id
 2adb3069b0e04-5b8df06a538mr2306320e87.11.1790353394728; Fri, 25 Sep 2026
 09:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925-ab8500-charger-dt-v3-0-f80b8d295e2d@kernel.org>
 <20260925-ab8500-charger-dt-v3-2-f80b8d295e2d@kernel.org> <20260925090811.818CC1F000FF@smtp.kernel.org>
In-Reply-To: <20260925090811.818CC1F000FF@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 18:23:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLnt3SWoR28MyGYm-6K8HwLrnsnmgEVEq-QTBc0h4hjytA@mail.gmail.com>
X-Gm-Features: AclHuK8Nad98zzMdUxUqMvQN_6xD6EMqBRNJWmpcUdxz4Bk-vDZnP8HQCOqqAu8
Message-ID: <CAD++jLnt3SWoR28MyGYm-6K8HwLrnsnmgEVEq-QTBc0h4hjytA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: ux500: Use AB8505 charger compatible
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:08=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> Will this cause the probe function to fail on the AB8505 platform?

Not your problem.

Bindings, DTS:es and drivers are orthogonal.

But there is a fix in a different patch series.

Yours,
Linus Walleij
