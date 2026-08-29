Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EA33346A8
	for <sashiko-reviews@lists.linux.dev>; Sat, 29 Aug 2026 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788034638; cv=pass; b=D06z6M27z6eanQo/v2HDyiGTtHB1pP9NeJ6o+yzLmyo6HEOiSmqQbuJS8rHwu4fmeSFqRkLr5rh1bkMr0MTFss4C7ijGaB4PD3BeDP8NCJMAYByP8bDGR6lNDxostASLBAQJjTmWjglJsa82wdnjGJplQiRCtacTY9eiL57TgG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788034638; c=relaxed/simple;
	bh=zV+6p4ubGKbiLmgem3EajeC60iHzJEHcw1TiAsOWq/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQTlcWX2k1fPH+aXxwMvm1SJaptJms7r4uH7b/QkwykkFv5Bp5rcMZfPTF8i/Ogi0EWfalAvxLuFMFDGN483OLNzAleNPycWG13e3ST09gxoZ0O5q7YANIXNoutkksK2A+R199TBW4DA3aFvXRrb3o5d4tA/RWS76GBiWSWk8Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c20e70a0962so283334966b.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 29 Aug 2026 13:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788034635; cv=none;
        d=google.com; s=arc-20260327;
        b=s65CX/I2BHNx/BDlUXJ4bddBZP/tLZ1TWdJcA3V3tuBnCmvMmTjUn8vfvSyDa61kVw
         0DFbwSlXCx/lQY8qgyDjyCUAxX1RAQLwHk1OJzKhtT9m0/TO5iXTZ2hK1R5djkPEEpGR
         mhvZ2gjlSeOBZw/X1DJxkYgMU/iOmeUpUKe2A4nwc8RNrvcLok8PR3t9Qm6dts5j+r9Y
         xEfgNFw6bsibjNpEZiiiBvRO/P2l/dPgz7I20lCqcCQJdCqzLz+CrIm7amnhysquZXRd
         yyXk9dSpROHXzc6mmFsAwTUvkNlNfpMl4dH0cMcq+3BHpvHmHl3Fj3caeLpHIjPTY7Tn
         9Apw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=6C6ojXuUuOCnp6lQZBCyXJ7Yhmo+q/tVeeyZp6SEgy4=;
        fh=xPpY1eJncIbZYzB1EwAwSnJKmF4AWv783JvkNJMI/QQ=;
        b=hwT6bEpbZtz4yilWAOq7kfSrR/29K7T9OUXP83QZ9qxHmBLPGKKdhmF5vQyMNoG7Kh
         Uoi0SyivZXkE3dkZxRZY4yIs99ZH7/DG84KDCIc1KZEiL/1hOVsD910pY1A9Xjvpn4p+
         HGMbX7mrnHAUgjNvUUZHZHwdpxQN9Mc3y8O/1tj5corHz1Oatg4IrO1z9vXff7zfcwfG
         SDrB4k0g2HKqpIqZihP0KaUeBGXU/exDDvcOq74FFs2+z4LCUyDuSoBVQyavk1v9Wd+V
         B/5VOKrFlqPD+JJuIC0gG8uFr4RGLaJnCVR3wfXjAKAhK6KcxDfzbQL3claD95S1iRES
         zxJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788034635; x=1788639435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6C6ojXuUuOCnp6lQZBCyXJ7Yhmo+q/tVeeyZp6SEgy4=;
        b=lWO8A1rxGUsELVZHFy1hKiBbiqeMQQzGrhq7tOqVyFnsIjtI4kHcEzKXImvvyvIxXC
         YrMii36AMTj7GsCxVXrbIn10CHH9Jc1Y/isXd0d0MDBWVW6sTfIbb7xmU0VuJvO3OzRG
         Fkzp/0uurEaQp/4NC/voNsDFaHkw4G1dP0fc02kNKwWe4+SG/nBeFvOh80wICNOJpbPQ
         wIUi/T8OBtiBnA+WoYu4wYOehdteepJXFOMBucXhQo48MxjpDMWKtIC69MxXTlIELwrD
         niM4Tkt4FnwIXNowTA/KGOSbNlPiyuHlw2bV0VlhBSnICmChl2ufYWV25E8/JUbKoE7k
         ZNpg==
X-Gm-Message-State: AFuF++loAP7zwQvGYOZGWYBWIxT9nFYmFIU1SV0J7AVB4bN91MwJEd5H
	XFQDsMXLnaKcFctZOXhpF+0lNxoHC2DddWWrXz4lgmqqRrqq9AJfq96gv+zmbseqw/X6rUVFyja
	/MyPgqznOuVAqOOZ/mNYfvVEH1pwERmy3gmeRpTM1PBNXitSZaqoESrxwPWQ=
X-Gm-Gg: AR+sD103Zv9SKq8sxLrY5yjanxkN3dTZwxU8qONTQztHRCUOKqG8gArrNYpn3BuJ/QV
	KmhKXdXjrSSQJmFEWPuTytLUPYrUkbxn8iSHpIewdO8e5/49X9MBwr2faoi42JRvVc+gA2Di7Jd
	gRu62cOZL8FGxGQN/SzXNaPWA0gtJjBDDSLbY2zERrko48oAyZ5okCNJsxlvP2U/NIkJumJHIN1
	vPdCkuDkvLr2a7Ya8MYpJ0sgyQFivrtfEuBHJrqHsbFC0PkZCkB/S5Z2nW36BheVlyMdE2UDBx9
	uAuTiJWDascayx0h8ROnT9/+NmpiqRvHe8rXWk8Q9YYuAUpboen2NqSYZmmedalhU/udlYQY/zf
	VzTcn5OQupXdHfr+6r0z2UHpQEJcFRZamRp8=
X-Received: by 2002:a17:907:c06:b0:c19:5572:d234 with SMTP id
 a640c23a62f3a-c2556c250fdmr1045810766b.1.1788034634928; Sat, 29 Aug 2026
 13:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260829-ipq4019-dwc3-migration-v1-0-cc66b54ce21c@divinehawk.com>
 <20260829-ipq4019-dwc3-migration-v1-1-cc66b54ce21c@divinehawk.com> <20260829194119.815D31F000E9@smtp.kernel.org>
In-Reply-To: <20260829194119.815D31F000E9@smtp.kernel.org>
From: Matt Eaton <linux@divinehawk.com>
Date: Sat, 29 Aug 2026 22:17:03 +0200
X-Gm-Features: AcwNN1Xj8NKGsRmzdt0hKXWDVNEsssaRHa4Edn_9AFU7qkNXFXgwIkcbj9GNJIo
Message-ID: <CABUBpLc=ebrTh65revLHEtND3KGFtMYsLXJEw+w8FUO9zG0tmg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,snps-dwc3: relax interrupt
 requirements for ipq4019
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 9:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Relaxing the global minimum constraints for 'interrupts' and '=
interrupt-names' unintentionally leaves multiple SoCs underconstrained, all=
owing invalid DT configurations to pass validation.
> --
>
> commit 245becf7a38f613732404251842cf1f13abb06d5
> Author: Matt Eaton <linux@divinehawk.com>
> dt-bindings: usb: qcom,snps-dwc3: relax interrupt requirements for ipq401=
9
>
> This commit lowers the global minimum interrupt count for qcom,snps-dwc3 =
to 1
> to accommodate qcom,ipq4019-dwc3, adding a dedicated if-then block for it=
.
> It also notes that several other SoCs relied on the top-level minimum and
> are subsequently left unconstrained at the low end.
>
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml =
b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > index 7d784a648b7d9..28e78302b814d 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > @@ -137,11 +137,11 @@ properties:
> >                                 only on SoCs with non-QUSB2 targets wit=
h
> >                                 exception of SDM670/SDM845/SM6350.
> >          - ss_phy_irq: Used for remote wakeup in Super Speed mode of op=
eration.
> > -    minItems: 3
> > +    minItems: 1
> >      maxItems: 19
> >
> >    interrupt-names:
> > -    minItems: 3
> > +    minItems: 1
>
> [Severity: Medium]
> Does lowering the global minimum here unintentionally break validation fo=
r
> SoCs that relied on the global minimum? For example, device trees definin=
g
> qcom,ipq5018-dwc3 or qcom,ipq5332-dwc3 with an incomplete interrupt
> specification (like 1 interrupt instead of the required 3 or 4) will no
> longer report an error during dtbs_check.
>
> [ ... ]
>
> > @@ -508,6 +508,25 @@ allOf:
> >            contains:
> >              enum:
> >                - qcom,ipq4019-dwc3
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 1
> > +          maxItems: 6
> > +        interrupt-names:
> > +          minItems: 1
> > +          items:
> > +            - const: dwc_usb3
> > +            - const: pwr_event
> > +            - const: hs_phy_irq
> > +            - const: dp_hs_phy_irq
> > +            - const: dm_hs_phy_irq
> > +            - const: ss_phy_irq
>
> [Severity: Medium]
> The commit message explicitly notes that qcom,ipq9574-dwc3,
> qcom,qcm2290-dwc3, qcom,sar2130p-dwc3 and qcom,sm6375-dwc3 are left
> unconstrained at the low end by this change. Should new if-then
> conditional blocks be added here for these SoCs to properly enforce their
> original interrupt minimum counts? Without them, invalid configurations f=
or
> these variants will silently pass validation.
>
I have a fix prepped for v2. Standing by for any other feedback.

Much appreciated,
Matt Eaton
