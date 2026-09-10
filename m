Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A76B41442F
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 19:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070211; cv=none; b=XDxN5IkohHW0XD7fmf55Qv0pjmpJ7bBQawoGMMW1UjVVD7z5n4XI7Grvq0HXcjDn+f4XGFKxErUZ3W0L740PgpmICajHUAQRe6IvZHVC/s3wPMixRmFbabB/AQOYYUxFCRl7N4Kqt7CZXRKxcJaRFchUd86IiJE0WWtja9XwQUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070211; c=relaxed/simple;
	bh=4lMWEzGElE2pVJ8OZonjNdXRoPHPPoNkEfNzRMvzHMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=az66QWjc9E+aUiFsQRrrQzj19RDaVcnVqmELvTLLxWE0aAQ4Uht0yFU4jT/fmXldEMP4uiYeZpI7XkT2cQQZ1DRuBL5+JPjITyCbcomdlax84YP55FRccW4TVoOp52SbUSsdnOaERTSszQ+dfaECoCwGUfaKZQtNW2KmQDsD2ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yo+EjpI0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yo+EjpI0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74E51F00893
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 19:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789070209;
	bh=4lMWEzGElE2pVJ8OZonjNdXRoPHPPoNkEfNzRMvzHMk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Yo+EjpI0jZXdgFN5YWr9xrCLq9wKDoXfitIA2Bw3D1ydadQ4E8lV8m3TbOd4OqEHL
	 4JkNKkBEf4h39j+gtrJvoKcGvHn11udYkrRDQ670QcdKfySl/x8v0YZLbqVzSBWWm2
	 QbV3WwH1g1Pez5D3pET7waFk6M3T3oJQZKwC4Sw9Z2owWWYH/adrbOaSp6VSqPINA+
	 CY2BuO/AwsxlmhU2HkbWqLJdNoUduaVhI5WDcXRbVC18kY4GviBYzgQIsa0ane3jdc
	 +nbnb4wWRa3eKMu6s7bNjwZE6v8ZVhcEe0wXKSKbmwQR5MjrHwXIbwA3c1MSOmPo05
	 UggAwNsyBzNBg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so197620e87.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 12:56:49 -0700 (PDT)
X-Gm-Message-State: AFuF++mW6na2uIYVJCqcBopV12EJQAG2HdqnG0YxJctjnNRy31ujGINZ
	amT/y2OpYL5p6xSIpQ+4JqBMfuNoWgAyFLTApa8Ljpicz16oYzEfjEY7OHR2GqYLWOw9MRX16w9
	a9wxKR6pWqMJHDo6EcyrAZL/oWv6jpLg=
X-Received: by 2002:a05:6512:3b93:b0:5b7:c68e:a501 with SMTP id
 2adb3069b0e04-5b8a033850emr380842e87.33.1789070208515; Thu, 10 Sep 2026
 12:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909-ks8995-to-ksz8-v11-0-0e04411a559d@kernel.org>
 <20260909-ks8995-to-ksz8-v11-3-0e04411a559d@kernel.org> <20260910170117.362821F00898@smtp.kernel.org>
In-Reply-To: <20260910170117.362821F00898@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 10 Sep 2026 21:56:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLnHLJpBqdy5sUm2mhKqqGBdBX7C-5dibO70_2FNwWaX+w@mail.gmail.com>
X-Gm-Features: AcwNN1X47wxWvPCgxs8pnnEn-xhw7AYQgX_AoFzo7hCGp5V_1Qh45pAzLIxuTKM
Message-ID: <CAD++jLnHLJpBqdy5sUm2mhKqqGBdBX7C-5dibO70_2FNwWaX+w@mail.gmail.com>
Subject: Re: [PATCH net-next v11 3/4] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 7:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Hardware Reset Timeout: `ksz8_reset_switch()` erroneously appl=
ies a PHY reset to all ports, including the CPU port which lacks an interna=
l PHY.

Again this is a non-issue.

This is what boot loaders do, it makes a proper reset of the switch
and it is tested on hardware.

Yours,
Linus Walleij
