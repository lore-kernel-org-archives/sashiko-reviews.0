Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBE03E5EE2
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 09:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702839; cv=pass; b=m5MOSiv+obeCj9QF7ZWKKaidxzCruTZWyyCwfdTKMU76Rf5ipBs6JIQs/LXpNsY//FGLkubizdhk88NqkstEyQoruUzBpfaq9xNcTITB42bcYYqWTj2VBe1jU3CAe3BFBru9MmAYx7oKqmHolWPso2dwstipY70x2Z+suannibU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702839; c=relaxed/simple;
	bh=9TUVUM631fkXgOeQauKTVy1Pir25s4xdaUauD1SJh94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lBHijOweALaDETs2+SExyE/f9bG26NcjGAvsXQqKWHPpxgSu20arY0o1MsNOPXbxLiep0TQuyxei2IWSDFTZ2CF32UuCdDy5FbG7/WPDjzm8nGJySUFEf09Zb1MN7uTZuLd68tewQhJhq6ql4dIYSWnGQbsZSsbPiVFrnZeQs7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=pOG1ktfB; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="pOG1ktfB"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68852a4fc68so3823138a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 02:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779702834; cv=none;
        d=google.com; s=arc-20240605;
        b=hD4TSxeKgb8KDTs/ltFee/H1N5XwIpVC599vgba8Vx9Lf9ezWbL/njOVGszLkQVidq
         GlTaZSvDPUDUonzEQsqXFhGFg7Bni3GoLfYg719oi+St8A4ii6VyFdMk9WfqwTk7HOAJ
         s32NXFjDYV5Wi1Ud5s7HRKBx1psSyBAP5cv+xVa6hjYyPtWmdUmbJe7a1t19oYnWiEm2
         +J+wNVvvV5uU3bWE0p1aUA1ZMcxPUpJC9Hz5oT3twjr4ZVD4sclvh9xdgFI0XKEWw2P+
         TvV6c57RXBoe5ygO7G7m95eh7cFb+kUJnbx//Acvxz7pXuy6utDCiAI0MjA5E/CNysEz
         eoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e0mRTzemrrXVivpXOaPKIL2ignRf6ovf+dcZAtCU0OY=;
        fh=vz3pN3PK/bu+NRXdfIvIk2p5+cHuimYs4qHOOK8kDks=;
        b=KwN+AOxOVAKz+N7WjTL/Iog9yNEMzxBKJMDjhZo863SvnayJO09rrsYOj+Q5q1Ohcw
         jI/FojUKrew6sL99pzUhtvVVV+aM/Qg/oTwrepAXXINzQxVlO+hREbegDVaYVDDq2CCg
         soET6VIlhu7ElAa+sAsU6GD/N4UEz/93UisqWjbXJJsq3bBIld6wUyABkiF0aUW4W3JR
         4ARKxXgzpROzxFRTcCt/ajTltOS/YFqk1u8bXk6paF0U1mqHmn1nB6T5d+NJleSew/uC
         XVYagGkB9f9E41dmI26Uyk6MMrd05DIjEIEIdxGgiA0ZAnvCoFK9SpFYcB2r5iqEEynY
         HsZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1779702834; x=1780307634; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0mRTzemrrXVivpXOaPKIL2ignRf6ovf+dcZAtCU0OY=;
        b=pOG1ktfBPFmVUia6IyfdXyHiLi3oA6ta66XmLgRZ8G5F3cFEatklcaeJo2U1JzrD++
         gsEbS/Hw6RAvE8eGJQcOtU59GZVLBIemhX/qlRm8Q5mw4jzly/FWvFRX3+DmqkomSUPn
         nKeNJiMYo2ZD09nF2r6MNjEE7faFkknyp5vxqDpYlJ3KOv/QZxFAnlNSB5YjVINTWm1X
         5yRaMJg3IW0ymd6GA354xMjl3Neh817N8ALbXR1wxqnXjC97uRsqwseQN5puSt2WxboW
         5Qv3ycQY6QG9qX5KzKeueuC1AXp4YEJggVW6llCTxuFiwJdLbB/SlUw1xsOTjBHEwequ
         4pDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702834; x=1780307634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0mRTzemrrXVivpXOaPKIL2ignRf6ovf+dcZAtCU0OY=;
        b=Sm5HSZbxl4RPkW1G0tL7ORTZiyIE/Az/PJe41fLEiRSv1P2pTTO2vPegQg7aKicOIM
         rnFmEyx2R9TGfEa4KGSK6bJGglPrsKZBIvI9y5GbthvgQ+JiCCp0jaHCAGdRltVUpxx0
         iYY19ENtqW9gpc6M6KHHVr/qvmLhYno7DH+oyC02ntcHK4pl32Mei4zvwe0xXK99Kbck
         BSsEFY9H1kyVf8sYSvcC8LxE+lkHGN+SwQmux6M8DicfzHouf5SKtSN5E8hooUZFX8UK
         4JnY443h+GUpU97jyW7xATdhVkzs97Fg5fp2WygIbfxm+RWk4pwxUjUmj5rIUEltWUaO
         KWUg==
X-Gm-Message-State: AOJu0YyXvwETK06tP6v9tAQQB9ZaEudUfiiKX4CTitNL+FJqXnmTHbtg
	F752nqNSqu2uPULoLntfGh/yNTtRoElBPm+6NQrhccX7fqKO2S6wzNhJXNr04xKj4NCInZjm01y
	U75pnm1KljaCs0/QP09DwR0pwpmU8rW7HKIHn1Fw+XHdwoVLKKTN2g0+g6log
X-Gm-Gg: Acq92OE5JEb4NCuIY0Km6pgeweUYn3gRzerrOgiXLl7La6IWfQ9oIesVd2eoaVeOxEG
	wp24O0aRVDH+Y6kDfx0AFOKpXmV93lj0flmbN98qjLNWH5ZrwrD1yGOGEQ7gcbp5Vep3hZQlQTG
	ovJ/LgL3p4xSDb6kF+UPcj3UaeLSzmEN7o5SRXCzaaep63SjBrFwBAwpOvOLlZBZFUr55RGlBw+
	KFL0gkzcfNt6+47Mo+mITC8u76oztmygX5RllU/01DIm7VgytBpRZ7ZdXMk/sKEGuvBLeV/5Z3m
	jAHqdoK9LsylGWTxH991ai6dMB1UOBE+NqVkcHQrkpBOXHIJ66A=
X-Received: by 2002:a17:907:7703:b0:be2:11d7:8b05 with SMTP id
 a640c23a62f3a-be211d79063mr44830266b.24.1779702834376; Mon, 25 May 2026
 02:53:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525-nau8822-reg-v2-1-7d37ae393e46@flipper.net> <20260525092932.711941F000E9@smtp.kernel.org>
In-Reply-To: <20260525092932.711941F000E9@smtp.kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 25 May 2026 13:53:48 +0400
X-Gm-Features: AVHnY4Li0Dn-doAlVFWhwDaAildAQH7ofwuLtWPuB8AVZZnwi6l94z_pEObcXw8
Message-ID: <CAKTNdwFhkwxzqqzMqT8cXqtOCZBdYZKa7A=ajowxZx5gW4gCfg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: nau8822: Add supply regulators
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 1:29=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Typo in the description for `vddspk-supply`.
> --
>
> commit 2a0698dd10cf90a92b31e252ae2cfd2a236cf2d9
> Author: Alexey Charkov <alchark@flipper.net>
> ASoC: dt-bindings: nau8822: Add supply regulators
>
> This commit adds optional power supply pins (VDDA, VDDB, VDDC, and VDDSPK=
)
> to the NAU8822 device tree binding. This allows device tree users to ensu=
re
> correct power sequencing before communicating with the device.
>
> > diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.ya=
ml b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
> > index cb8182bbc491f..cf4c130382411 100644
> > --- a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
> > +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
>
> [ ... ]
>
> > @@ -30,6 +30,20 @@ properties:
> >    clock-names:
> >      const: mclk
> >
> > +  vdda-supply:
> > +    description: Analog power supply
> > +
> > +  vddb-supply:
> > +    description: Digital buffer (input/output) supply
> > +
> > +  vddc-supply:
> > +    description: Digital core supply
> > +
> > +  vddspk-supply:
> > +    description:
> > +      Speaker supply (power supply pin for RSPKOUT, LSPKOUT, AUXOUT2 a=
nd
> > +      AUXTOUT1 output drivers)
>
> [Severity: Low]
> This isn't a bug, but there appears to be a typo here. Should this be
> AUXOUT1 instead of AUXTOUT1 to match the actual pin and driver definition=
?

Indeed, it's a typo in the datasheet text which I copied and hadn't
noticed (NAU8822 Datasheet Rev 3.3 page 3).

Best regards,
Alexey
