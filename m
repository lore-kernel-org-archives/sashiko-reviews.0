Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887035;
	b=Uxaybmu9KJBDV4KXPNiF2YzODSgC7xu9JBUw069et/KitmK0tGZEwd29y0ezG0wT+/ZP
	 8B7sAI9hyQ4KV5jQw5e7x68NwNHUxGbNUaPEpIRDcs7qERQYnWaOR0kVQq5n/ZQ7QBx2v
	 p9T2sm9Q+1A8jKo7pbOhdyp/+mS+/Kp8HA28993t+QQKpiPHnOulgzdz/FF6AcJBVWAXL
	 /23pum/Q6WHXWI4835gR8ZuLsFGI5UNuElxaYCVYpRI4fzfRh0Q9dAvrbZVKezBJA77Bi
	 35SLNt2qVY7GvpW/PePcBLoi/xdUftzJp2MhGh3XfwoVAIImruwmA0/KpGHoXFowYyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887035;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=RK4dc4YCRHwSCZtA+8Zl7EfQsJnisbbwkk0apZKAcaI=;
	b=JadFnVEAjNE7SbxI1HUhrLlFrhqe4URNQFXSd7U/x/Ar/epvxOa3BLJ6BdjHX217PAqd
	 Q2Tknd7IACwofitlBC2AnWWm9qS5XQgDPmPd5x7U3fPfEdFNrsY+lE6Q5q6NuBO+92sTn
	 j4wSlD3/8OfaRjvstPWxgULgf+HPkHumhekeLYs5s4QhueS0PEWqhofrMxxpOguKm9jiA
	 6g7HM4eogiAfHRe7O5rKmwNDFBsAHHpBTI77SGLCwm4srUeueuFIC8GyOj8fvXrR0H7tb
	 omeqXc8te7N0v0CxUtH41i/N691dFvc0ww1lrAkvNMTMLDMZFgbNUi7BJYVCiyCv6cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nPiXu4rd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBAA606D80B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nPiXu4rd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94E91F00A17
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 13:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887034;
	bh=RK4dc4YCRHwSCZtA+8Zl7EfQsJnisbbwkk0apZKAcaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nPiXu4rdcIaxnCT1kDc3WFNhjUJ914oMbMOSR9dNUt7nHeo5BHl8cGT4w//hGP5UT
	 H0dAWrW6bBIDFMNGan1wEZ3YofTg+JkuDN3sJDT42Yl1qxsSifesrUNWPwpGP3b8/l
	 tlCdbyM1rWKiqctZj2UNHoVG+pkxqQlPTF5damoM08MeyncoS2PTbxOjz4wXEWCm9y
	 e7lfXimgGrCwSWASs5FoHp3ShZmfpYR4Q5+IhMeEXOL3FhoPHUZFgLjP1JBQplEIAS
	 lt1/qXthqGPIa2CRKvh7lsoezyzhqyQZPTxtQ7FOAP1xnJsUERowjD8yl34eH+iq5v
	 KQNkxKuIkjKgw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so2406314e87.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 05:57:14 -0800 (PST)
X-Gm-Message-State: APuU4Z+pso/ipYyM7AeuYAFQOAnqmdsN4RyxaMBAVg8E+eDNhE2ZoYlT
	gIQ0eQJ13RACp+63aKd5KtpGGgam4VYiZV6Lh9mf7+ey346B64AJTqSWvUcaL7wvnCF9bbZORXK
	L58hCMyoAFacRNdEdxnxy6y1DjtTLzO4=
X-Received: by 2002:a05:6512:10c8:b0:5bc:bbd0:7a7f with SMTP id
 2adb3069b0e04-5bfd958c3e3mr6574322e87.67.1793887033749; Thu, 05 Nov 2026
 05:57:13 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
 <20261105-genexis-xg6846-smp-v7-3-rc1-v5-3-7477b2b4675d@kernel.org> <sashiko-outbox-199178@kernel.org>
In-Reply-To: <sashiko-outbox-199178@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 14:57:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLkuZRe4wVmuaTPd8BTbQtEWtgKMGbLF9uJ-_r5GGVA9MQ@mail.gmail.com>
X-Gm-Features: AclHuK90saU8RstxulF2bcrp10n_1pFAJWV1nl7Ujab6d-Py7Vs7CAFrDoYVlHc
Message-ID: <CAD++jLkuZRe4wVmuaTPd8BTbQtEWtgKMGbLF9uJ-_r5GGVA9MQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:55=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> - [High] ARM: dts: broadcom: xg6846b partial no-map removal breaks lowmem=
 setup

Hi parrot-Sashiko.

I have already stated why this is a non-issue.

Yours,
Linus Walleij
