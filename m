Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3436F38BF69
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 08:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786351405; cv=pass; b=eWIIC/s/G3QzD6Xkd1o76VoLeeBQ/XfPKdwUc5a5URm2P8d7euqwWUeKutfYq3qU04u212m+1va02sjZmKektRVLVsOlnEdZg7uNWYIbmkXk449UzC2j8/6xBhV/WLkjp5FFXnyBUGJ8x/CiMF7adRQdxYMrS7LgmEawE4JUCzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786351405; c=relaxed/simple;
	bh=vsOKCOkyS6rUiXdWk0fb9QExEqjNoSQv6E1PbSa1uqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeWgMLK4F4MdShI7vRLAK9ZyTo5Rf2a2sGwOO/Wc2+OLUABc/iLcF4F6UHGXZwAZN/8b+v0WYhb2HVxDj+TYmODf9c66j+nFA/IJLbVJurWWQw8vutHKl5lKbxYpvEhwamie3CGrx/oNYeEMeI/geooPPHpHtqYhmpCpiy7xSkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fF/7Ue5y; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fF/7Ue5y"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso2141891a12.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 01:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786351401; cv=none;
        d=google.com; s=arc-20260327;
        b=GLuPxo0EIPwvSZB+zwrVptYGnf2X4s2I+Slpaqv0WHtAnsHlDtr/aNWRe4SoJ4igp3
         qdgjDs/P9nctcLOCb7PTnI43j0g0KujLrWdwRiqEx+007VvajlsPiUQEPaygEWKvgYFD
         3DOPvTSPI5uTYo29xLmrWg2DSMPof08+n8+l1UuozX6uzYtZBJz+V3+qfwkhKnSsqcyU
         oMAggWwtUDGcqizDHJceF/6BmmJt6Z42wtlNu4rIMwpkJ/ShcM4Uot6cVNADtFz7bpfX
         w5fKqZluAAaMBgNaDKTUq6D9feqojggV4cQAc7NGBFg2dDVg0H2BAaIinPrUNe38SEkK
         SaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ibzUgXOGiUGkOiEFkYb/0y6YpV4m0bbnGovRuTHx8eY=;
        fh=A1f3dstwGzfpKZXepw6TX2JLb44agyHWjwxVeDLr0Ss=;
        b=AD9C69HQiDlffD7qnUU4CvBK+t7tk3SuWleNyAa0VibgdRE6zJxnBUwcc/b1C7SjTj
         fpH+WCBu/8S8u0wtvxNv/poUuwqXOwemQiTxH3tTPmME6E2akyhmoMGVftoIbb3v2e6X
         TzYEG+YLhEJMOMCQ9t3uH0LDFYkpQL6laJ+io/tb/gGDq8vD6cbgLOPT1uz34dQuMDOt
         ScBqaACYDR+nbBxlWG0PD1lyPKp6bi7aXUy1Bjp72SiCIOUeStkbFwweJBMvSGlhRSdM
         8yepK2x9WifcC67dozP4te9ofSx2obcULfS1msYoMZwEonjqoFfLrBaY0A+Y1Ccf0eL6
         svWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786351401; x=1786956201; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ibzUgXOGiUGkOiEFkYb/0y6YpV4m0bbnGovRuTHx8eY=;
        b=fF/7Ue5yoJlIC4HtbaGZ8R07EHWGuyr5pw/KMxF+Q/LBplrMnTq60Ztqr+DT2bRuKD
         hcA5x9M2bz8b+Azc4yhfDdTlB2rcJ8/pWw1y/7LY/yzF/m9LRieDzgLedG2Ws7oWUaE4
         qa+a+i+kaMlpoMjpPrydx3ZpqRYQyNzfpirJp38XCCklT4z4Tg52AySeyXoe6wQB/V4k
         xJycpjGluO9sOjPK2wkQo5qwuuIw4velboUBSoGZvMQ+wXgEZIljLspuUfizeckbuKz9
         34hsZpQt6CftWdryL0QNkkfnB+1m3ohAMr3kzS83Kn9dI+neaH0Hn6Hh5ly1UL3ahXJH
         b4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786351401; x=1786956201;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibzUgXOGiUGkOiEFkYb/0y6YpV4m0bbnGovRuTHx8eY=;
        b=kXTrsaiJuRHSC3pbkMa6r/+T7ZAHcHnOLN3ApcCMxmub2FxO0VkQrrqsjwbA2K+CZ9
         0oQ4W/3DrNVYWi2F0DBq/6OdozbNBiY55CKMZm8yThGWRWtdsbyiHyhv1Jocwl7TsEcI
         lTrVK09Lg9+LyHxX1mTpj506xO0/JdbS/UyQq+y7wQFY9kzMAwCM/3yAX7p4gnDM09GI
         aQ1BxGnx7ujs6XNhOYLT0mNrdGN06MlnRDh/AtZ6JjaI/5IIS/6huN28B/3nvy+grLPC
         UQHz1GOShfNGMw+OV4E5Jr8eUpciAsjf9HMF8z6Lm3uIXc4l7N2Jl7Dpw5W4Ioph9nLm
         h/Fw==
X-Gm-Message-State: AOJu0Yy94fXB3tvI95zVu4JaCAt0eZRCibJeWmVY7XRdVMFCvR1UJkZS
	+yZ3yw72p8E8PANUxv7d3uKnaN5J1awQToELq8cQ1kfl3mNaLEC8rpKzN/p1dLQMUUNyV98CEF2
	YTGn9wqC4FXIgbQmqH4eaxMerHPwmSWE=
X-Gm-Gg: AR+sD11lqubMv80sC1u/AGnzvkifLc0vrricFF1wnlvtlyWiC8OpUoWIDcQyIYimqBQ
	7zu300FeqKWt2XTvvTdfFyygKT+0xvMWEFv8xha60SjRjzr6OwW5LBItmmMIf1mugOpGR/vFZP3
	xaD8cWNSug37Gxel29ZZl7Y71OlCo1pyccH+v1Cs1P/0njOxz0XpCjzuFOaJzCLgByzHDyQ5chT
	QHndHp7TC1ISDgWq25LVgzol3UbyrPcvf5YHJ13v1VWihpyG+uHxrgyUnUBnNc7M75SYAq3WRB5
	Z/Bb24S5AvU5N8bH6d8xhv5Yms9pywX8JCUncmC/25LrNWY09NlcJxPzG48=
X-Received: by 2002:a05:6402:a0cf:b0:6a0:a4f5:f4eb with SMTP id
 4fb4d7f45d1cf-6a355d66d8bmr212253a12.4.1786351401282; Mon, 10 Aug 2026
 01:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604095647.108654-3-biju.das.jz@bp.renesas.com>
 <20260604100619.75EC51F00893@smtp.kernel.org> <aliM3iVA1LY7tW38@monoceros>
In-Reply-To: <aliM3iVA1LY7tW38@monoceros>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 10 Aug 2026 09:43:09 +0100
X-Gm-Features: AUfX_mxbp2F6C1EJALTGqqu13oGNxfjr3ICGyNcoGi9RkqGNZfVYjkhbDxxzl_o
Message-ID: <CADT+UeB-gV8QnuwpTUrHV-GvYPwebYg=RE68PcApZkACO4ENDw@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] dt-bindings: pwm: rzg2l-gpt: Document
 renesas,poegs property
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, 
	wsa+renesas@sang-engineering.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

I have clarified the use case with Rob on [1], and he acked on [2] .
See the details below

[1] https://lore.kernel.org/all/OS0PR01MB5922756F1836AAABFF62C04786049@OS0P=
R01MB5922.jpnprd01.prod.outlook.com/
[2] https://lore.kernel.org/all/20221215205843.4074504-3-biju.das.jz@bp.ren=
esas.com/

Cheers,
Biju

On Thu, Jul 16, 2026 at 8:50=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Rob,
>
> On Thu, Jun 04, 2026 at 10:06:19AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] The `renesas,poegs` property improperly encodes the consumer=
's channel index as a phandle specifier, which is a Devicetree anti-pattern=
 and breaks standard phandle-array parsing semantics.
> > --
> >
> > commit 9d7f9847d3f320fb715022b6159c9c7e869aeedd
> > Author: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
> >
> > RZ/G2L GPT IP supports output pin disable function by dead time
> > error and detecting short-circuits between output pins.
> > Add documentation for the optional property renesas,poegs to
> > link a pair of GPT IOs with POEG.
> >
> > > diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.=
yaml b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
> > > --- a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
> > > +++ b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
> >
> > [ ... ]
> >
> > > @@ -245,6 +245,28 @@ properties:
> > >    resets:
> > >      maxItems: 1
> > >
> > > +  renesas,poegs:
> > > +    minItems: 1
> > > +    maxItems: 8
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    items:
> > > +      items:
> > > +        - description: phandle to POEG instance that serves the outp=
ut disable
> > > +        - enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
> > > +          description: |
> > > +            An index identifying pair of GPT channels.
> >
> > [Severity: Medium]
> > Does this property correctly follow standard Devicetree phandle semanti=
cs?
> >
> > By Devicetree specification, phandle arguments in a phandle-array are
> > defined and interpreted by the target provider node, with their length
> > dictated by a cell-count property on the provider.
> >
> > This definition appears to invert that model by using the specifier to =
encode
> > the consumer's (GPT) own channel index rather than a provider argument.
> >
> > Additionally, standard OS-agnostic DT parsers might fail to resolve thi=
s
> > because the referenced provider binding (renesas,rzg2l-poeg.yaml) enfor=
ces
> > additionalProperties: false and natively lacks a #poeg-cells property t=
o
> > dictate the specifier length.
> >
> > Is it possible to redesign this binding so it doesn't encode the consum=
er's
> > index into the provider's phandle argument, or at least ensure the POEG
> > provider specifies a #poeg-cells property?
>
> You acked the patch. Is that review concern by Sashiko valid?
>
> Best regards
> Uwe
