Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE293D4126
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695115; cv=pass; b=qyVq+YNF3GkSVFywhidexFIYQ6HhiaXIx54DEqiGMs2flKaMwlaN6XEUWvdZBtJqHxStxK5XMo9xZUIs8bI5k2MfVDnDeGjFJRwXrPBj5ZOvoz49XLmMzuLD3IeDPc3jsu4kdK+DfnWTtop5jmGAQRggZ202uuEiJOGues0moq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695115; c=relaxed/simple;
	bh=nqsZdMf/BBR6bmZa7PHlqIirSjOFDpDYL5VK3Qr4DD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyfv7UcgSyYwjNPL+yT7mR2gf92kbtGgHPpnyMfh+fWGXsMmegeJ/iCnoz0Rsv16VtmXaWSxc8maHyIEf9oAqsoBTJjPtWjv02Od6+a/kcBn6h2U/1RTpVh4RHKpL9QQO2e5Oq6lTOjtUa2WC7Yb8sodE1UJI5Nd9pEqQcTiTlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpcG2AuK; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpcG2AuK"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bd8f9725b30so968416066b.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 00:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779695112; cv=none;
        d=google.com; s=arc-20240605;
        b=k9KRUs8jAjnndJtecGPYngvXEBh7G8eAHoNbq+qgrk6ZW5kTjaSwTe16USLaVdY6ws
         SvRauZBxxZj7buuXgHMlOozpt0gH73r/d4Eg0GGHXdviUQxYsJEk8tMh8AfGraDzrN8s
         qZqKaIARHsu++hjHWnPWWkHgy6EI2G0RI/XyJ5LVHbddb1A9HfLvnlE17t6pcobtqU7t
         Kbiz43IKR6vog68us4nQ864Z97sHkqB3eYoYUVVbJ5Rz9BvmVXunFq89EIJKNCdXGfCK
         sdkDDUFZmJqYyKDrnXRkwUJ6cQNnRbF51I26goByXa5X8JdVdW3Xpc/txm38+bsk3RMr
         xQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=11TeJZv77ZnpXb/3P3ZRF+nGs5n1ErGbq37h0PDsIHg=;
        fh=9bZIoBaZjUs6up4MgdH7nESOAOWois6aFen+DBmiMTE=;
        b=So0gtjAq5IeA7/MmtldSuLUKw0+I1JAQgYyIQtkGA5+PYHMDg5NFJeXQu/IPRsFkIT
         z6qtEzJlTh80roOBAZV/4dxSfopvEy+T2VmrqhuAZlPi1qRDBfuZwXT9p3oLhZEN37sl
         DcoUgJrLUpgW9ArxPlsamPXzc2tR+8j/Q1z9HRlQq7zQ2/lcLpzeR+AG5yJLmtpk7ewh
         h1aPJfqPi2sYC0mNWxahiF/I1dxKNRgmOFlDDd9vdYPmNMqUkLwQChf7XnMXY1vcImdl
         h3Z1IP7+rjxMnacp7T3+qhErshsCfL+0TSvoHiIB+fxdXjMnLJ1D2l+ZkV+s2Z/s6jmZ
         x30Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779695112; x=1780299912; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11TeJZv77ZnpXb/3P3ZRF+nGs5n1ErGbq37h0PDsIHg=;
        b=UpcG2AuKtCXTI6zrMcto4PIjFPAvSB1ZvSXRGpbTP5EtLjs8NYg9dvWh3N+4jobPUr
         ozhiNaYAPtxiPR1eBKdI/ACuvNhhWOd7sq6ARhnW5mFDUb6+zP/M2CXz1CZ/ZoivbeHr
         T0tvwfDZe7fiFbc8SBDWLO3+lhwsZ9tzsiXzZuQV6v+MK0ARc0+feoIkSFr3bHp8eOB9
         fnEZwX9iSyVzNCqV3xhfCSQMR7WNvlLxD0WG13+FL9N7Y6NfRK4v7wD4rpYq0Wqfl2s4
         6op7NmFcjYcK3Rl65Na53QH8SZf/bTwyfuL+1Zf7ZJ6wvioF0GZ8bakoPt76jaKNkl4V
         nCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779695112; x=1780299912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11TeJZv77ZnpXb/3P3ZRF+nGs5n1ErGbq37h0PDsIHg=;
        b=TOg6SODI43qdtpv0PwtB4yRlJ3FkARaJ1dasK+0sAGegfrqjhC14k4ZQ3Qjy4xE91k
         gE1sI2CWnoJyPllA9BZODSaSx96LA9NTKsvTeT21lfVbnjP0ppvbfq7ojJcl9s9R5jel
         rYP/XmxPEnU7NMUg9nwaN1HEnXM1Vnj/+k+61LW5vOH9s+HVUSkz+/QptzTCyMj19E16
         P9SXlb2k3BxwEoMg67BhCy4Sz3Q0kZGegI5leodRkHSfqoI9bjCiObWFHDzX2IohuM9L
         dtQk/Hqcz3qZBSUqv9vDBWCO4gBhNYI/7o4Hilq3/iwVU8PJ6dTNiifSMfg5zLnaJjM+
         /PJA==
X-Gm-Message-State: AOJu0YwtV47Q47youZ6BA7ceMcMZEJ8xabpW+b2gVvnq/qukTDaXIHSH
	0PekkvrBbhsN69nPQmKcnTJ0uaQ/gKFh4qpokuvoJ5Lnt1IAe0cJ/fJOFzAhT4AALepTeEnU06U
	ExEWrXw0KbAOe2FEeFBU+QCK/W+fW9xBX7qxS
X-Gm-Gg: Acq92OGRNp748XIvaQXQI0cmgGvbEQCTAV6Zm7NPm4QPQWBCCQyU+63Szwb6Iu0mvBb
	Gs9mvj223If1CF5sFOAZflZ+nd+PxPNaveeA5OITf1T8YLM8uIRY5z0jGrxrTsJMzen+Bn7s/3S
	D+SbBkxu+dA9IZ6FuCob1cERzKXl/8khOdH+ZkRwBRUlcOyMf5JipfW6/0DrNenc2UmxD1QE6XL
	juRHusHQzpZyLhxSw6MuOrQfzWnzdXNyOE/VjyjsxxMZDTAdB29Y0XTkA3CHp4I5AFKsCvO0NcU
	aN7yKIbvRA==
X-Received: by 2002:a17:907:271b:b0:bd8:26e5:d79b with SMTP id
 a640c23a62f3a-bdd2aee6e70mr587552666b.43.1779695111967; Mon, 25 May 2026
 00:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260524194457.479681-2-biju.das.jz@bp.renesas.com> <20260524195829.960401F000E9@smtp.kernel.org>
In-Reply-To: <20260524195829.960401F000E9@smtp.kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 25 May 2026 08:45:00 +0100
X-Gm-Features: AVHnY4L2cxrewHdjoi6U0d3gX5aaO0YVqb1OMYH4rfrIl1qNl3L7Ph_c-s2fQ24
Message-ID: <CADT+UeAYhrwpmApCWaJ9w0gK3zF4eR4LVptTTwegGucvF6mmiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bot,

On Sun, May 24, 2026 at 8:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] The compatible string 'renesas,r9a08g046-lvds-cmn' is used in the=
 dt-binding example but is not documented.
> - [Low] The parent node 'lvds-cmn' in the example lacks a 'ranges' proper=
ty, breaking address translation for its child nodes.
> --
>
> commit be595c0db2d85d9ea1396f0f30ac7ad75f4101fe
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
>
> Documents the LVDS encoder IP found on the RZ/G3L SoC. It supports
> single-link mode and shares a peripheral clock and reset signal with the
> MIPI-DSI interface.
>
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,r=
9a08g046-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renes=
as,r9a08g046-lvds.yaml
> > new file mode 100644
> > index 0000000000000..b1f6d020ae7b1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g04=
6-lvds.yaml
>
> [ ... ]
>
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/renesas,r9a08g046-cpg.h>
> > +
> > +    lvds-cmn@108a0000 {
> > +        compatible =3D "renesas,r9a08g046-lvds-cmn",
> > +                     "simple-mfd", "syscon";
>
> [Severity: Low]
> Is this compatible string documented somewhere else? It looks like
> renesas,r9a08g046-lvds-cmn isn't present in the tree, which might cause
> dt_binding_check to fail when it validates the example.

This compatible is documented and is in next [1].

Q1) Can you please reun the AI review with [1] ?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?h=3Dnext-20260522&id=3D51284d8b1dbcd7fa0220c49eeab29b14617e0d88

>
> > +        reg =3D <0x108a0000 0x10000>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
>
> [Severity: Low]
> Does this parent node need a ranges property? Without it, address transla=
tion
> for the child node's reg =3D <0x10 0x8> might fail, and dtc often warns a=
bout
> missing ranges in simple-mfd nodes with children.

I don't get any error or dtc warnings. Have you ran dt-binding check
before providing
such comment?

Cheers,
Biju
