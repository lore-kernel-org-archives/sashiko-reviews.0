Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E94B3FBB50
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 10:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333196; cv=pass; b=Zag6XUyEZmcsgZFsQbNOG2GGruCH8oJXfE6nPteZKUnhvT+2ks8KHcaKgnt6WpiPF0DJ84cqYeMvx5GdEGg5D+050jgsBHSruStAAPNuHDBOyf0940FOYmq5qTKcwDE7Bza2dJNmIWI/y9ty1TFgSJeKswFnU7X8UA/sqcG6KGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333196; c=relaxed/simple;
	bh=PJQ5UmcsxmykSC0BE/ND2jQEE712lBcMOooWOb3phaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IHW73/90Ir8WUHIrcpABlg6cmwdfW5TavmG2QF284py+yG3bX4Yg7is8B5KmAtp69cAMkGDi0OjpVMkYdA4aZ/pvrGi+H38Ic8VO0dnkap6DV96fShujFqIBVpfLoy1Hhd6BhqIjFGw5AtLjIALFUSUxkJJuUJVwE0GSDttw9O0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEgA4GWS; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEgA4GWS"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c08acccf4a4so345776266b.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 03:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783333193; cv=none;
        d=google.com; s=arc-20260327;
        b=lRrLhRTYWbqNdaFdinllpsZHACUQxuYJKosUerMVBj/UytIGA4S6vw4RjZpk5GgYQh
         DEltvy919MwXc8mv2Y+8yDPmG2pfamRuhqImytvceh4s859j00+vN2S85hDQVOW0Kknh
         BOGq4hiCNFhASbQXdGy9tcviq5NW8Od1WVA1hLACc44KO0JMxY+lqcczWw72Wrdr33na
         TfR+P84YQj1wZEurYuukIP4p9B9WZmBtXFKulQYRlz2UMqkkDiOO8O7NCn5XeU1cCnDp
         PdxCPBEBlCjHkzN0FsYffeEL/byG+NqXCd4YvP0apZnHmk0cWyeTYPu6Q9leTxcJuwT5
         Mhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fm0Kcy2K0oJ4B8QIP06f/MQz75S5ZTjRepITBSZjIOk=;
        fh=KuJ2Hk8403uXhFB5EQMBDemRfI/XDKtQFAy5V9k6LUE=;
        b=RUMw8LXMT85x0d7rnoF5VtieTurvkBwlS+DbOYI15OMmjiSHxR8IFZT9ssBLlz8QlQ
         qbg8v2V/IYMO+4PEU2WaL6eUsrx4xafu5QsVei1HUu+ACZ+YgwPx4dXRnnCMYJVwPjqt
         vLxdj5o4ONq0/wofF0kDPfNVIqW8894+do1peHuijyrBSehf/QqzJbslQId29R1a82jM
         xLV1c3m50ijyvzGtP69e8mchuMuwptj82TMB+yNTbJy8ChpMZQs2s15cr8vF2+zX5BDg
         /Abi+tK+hm3+YKUSs+yaG5OpuGmi73cULTDjQaz3ki6M4uKMWRlIFb5xPVCc0cPzZo0k
         MIEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783333193; x=1783937993; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm0Kcy2K0oJ4B8QIP06f/MQz75S5ZTjRepITBSZjIOk=;
        b=CEgA4GWSpZXfn00zfjpdh4XjA70qjNFjo0+Pjt1s4oHR07hJj8ijyjUtwoyKHTZEkY
         P/rqQncyjX+iSAmCF8DRXOsy0Cl3uGrDssU43iDmpd5J35C7HV5X70Q5h895GYN21yCd
         uBl2YY4JddY8rfio6Wk+wGKm47JSyZ5kd2BNgEXmqQYu1pF1MOfonbzUrMUbWAepReSk
         nGjCPvtVHeMzWj2ZxNVl613zR5HNXiwIdcU5q82L7pJV1fpJnJk93rbFz2JImntx0Vug
         5Sb3+OVAKGHK8l4ESJ/CSSrzcf4XyKViVPt2rout9SIhooKpOopoRDkv7gPIod2JRkmu
         mxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333193; x=1783937993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fm0Kcy2K0oJ4B8QIP06f/MQz75S5ZTjRepITBSZjIOk=;
        b=LRYL1fKkr4QpEDITld7gq53Z2IQnwEM3aLEJEXZT2U/PJwfk0PepfGHysRrK8x+cHV
         lgWF3YSyBw4fdqG1c5kI7U3HX54PFSiB9Btn6BbVMvaV447LSzmrj57Owtyz0h814aiT
         PS9/TMrZY3yFSAGrzIVdIMnkoLA13s79slISneQ7zvU4nZs8bGcdPxbUmoQrH2WElhMZ
         P92P7O34wUPYNd2Jyqm95wnYcXdezSVDNrTa8shrVJCxZR2bAIw92qaaO1lLrvNks+GQ
         xdtT9c2b3CWl6qZ5YTgGMlN3oGc7PE5n0WwMSYepK9AOc2oiJkkba1lcHeXOAkBQwKOt
         BiBw==
X-Gm-Message-State: AOJu0Yz6O40Usah6RJyyL+UT7xlgQNQDLPI3W/PY5KQedUcyEhA69gyM
	0NeQcxdmFY1iAKsqfS8UL3ewj1I7UzFYm9ImOH4hxxZK9yfZJoPrzj8qBqui0MDz3Y+AspxifIN
	whooAgsTIvpugch4gaPSJirHLr7KFvTA9lmo0
X-Gm-Gg: AfdE7ckkt++FlpaKtAN9wMg7FtvaDN+xGWMSPyeUK6O80noTYYFbrmu7fAG7gUWO26k
	QeTjLqlmMIJGvwYGudpoLsKEFvV9xTwvjkz8I16iRPAFoKucpxlJkY3NUQ7cn12hJNfyjHOuqae
	j2VR7fF2G08LNqhxcoOlSKVmxJHAdiL7JYVwRy9UPAc8m+C/X5sPCk1zyy1RkXrI7q4hcet3wPi
	2Z/fUlgR4OPOeuznzy6afNuO+q5yXxxkW8VHzvf0YGdQE2HVlU9ERQ2L81zudWo2FpS+WLBdnM=
X-Received: by 2002:a17:907:86a3:b0:bfd:6cf6:1952 with SMTP id
 a640c23a62f3a-c12e6a9daf1mr386845966b.28.1783333192619; Mon, 06 Jul 2026
 03:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
 <20260622155610.184271-2-biju.das.jz@bp.renesas.com> <20260622160548.04F5B1F000E9@smtp.kernel.org>
In-Reply-To: <20260622160548.04F5B1F000E9@smtp.kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 6 Jul 2026 11:19:40 +0100
X-Gm-Features: AVVi8Cf2Rtt9_ieWlUPGWmUBXQw2-mmoGRLmFkbx6A0nrEKzRFYI9JCxTbEcgQY
Message-ID: <CADT+UeD6x7KN-zd-22r7aeAbYzcRqot_0TSDHuZTOtPzx39hkA@mail.gmail.com>
Subject: Re: [PATCH v18 01/12] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L
 (r9a08g046) SoC
To: sashiko-reviews@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,


On Mon, Jun 22, 2026 at 5:05=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Relaxing the global `maxItems` for `resets` and `reset-names` =
from 1 to 3 removes the strict constraint for legacy controllers, allowing =
them to incorrectly define up to 3 resets.
> --
>
> commit 5bd955e3c9833c72a7847cd9926c293d95e5c927
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
>
> Document the RZ/G3L (r9a08g046) SDHI controller. The RZ/G3L SDHI
> controller is similar to RZ/G2L but has five clocks (core, clkh,
> cd, aclk, aclkm) and three resets (rst, axim, axis), so update the
> clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.
> It has an internal divider for all modes except HS400, and a 2048-bit
> divider compared to 512 on others.
>
> > diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/=
Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > @@ -116,7 +117,12 @@ properties:
> >      maxItems: 1
> >
> >    resets:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  reset-names:
> > +    minItems: 1
> > +    maxItems: 3
>
> [ ... ]
>
> > @@ -155,60 +161,101 @@ allOf:
> [ ... ]
> > +        else:
> > +          if:
> > +            properties:
> > +              compatible:
> > +                contains:
> > +                  enum:
> > +                    - renesas,rcar-gen2-sdhi
> > +                    - renesas,rcar-gen3-sdhi
> > +                    - renesas,rcar-gen4-sdhi
> > +          then:
> > +            properties:
> > +              clocks:
> > +                minItems: 1
> > +                maxItems: 3
> > +              clock-names:
> > +                minItems: 1
> > +                uniqueItems: true
> > +                items:
> > +                  - const: core
> > +                  - enum: [ clkh, cd ]
> > +                  - const: cd
> > +          else:
> > +            properties:
> > +              clocks:
> > +                minItems: 1
> > +                maxItems: 2
> > +              clock-names:
> > +                minItems: 1
> > +                items:
> > +                  - const: core
> > +                  - const: cd
>
> [Severity: Medium]
> Since the top-level resets and reset-names maxItems were increased to 3, =
do
> the conditional branches for R-Car Gen2/3/4 and the subsequent fallback b=
ranch
> need to explicitly constrain resets and reset-names back to maxItems: 1?
>
> Without overriding the top-level relaxation here, it appears legacy contr=
ollers
> are now permitted to incorrectly define up to 3 resets.


OK, will add the below blocks for non RZ/G3L SoCs.

--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -196,6 +196,11 @@ allOf:
           - resets
           - reset-names
       else:
+        properties:
+          resets:
+            maxItems: 1
+          reset-names:
+            maxItems: 1

Cheers,
Biju
