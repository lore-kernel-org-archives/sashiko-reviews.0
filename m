Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14343AC0D9
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 11:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978644; cv=pass; b=jR1m52p4cx13OfwmjFvGYnn0qnRKV8sv7Y5xlZgjRE84yakxkIgiHx+8waKnQy1x3xt2tPfA8FcQ0TpXr7mH/wAbhyEoZjPcnIVXJh3k0RPdnYfGkcp2mee2lA0A02OMdQoGGNOTovEojDjhUA7+AxCSV7X7zHOH1rWsDxYIRl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978644; c=relaxed/simple;
	bh=YzE367kx9h5ucZyKgNsjxCV6DacyE/ZX6U4dDTaRoHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fn3VteBeeCEPGTvaKV24THi3Z/xPiwDlmBapPds/jtlUgEQysH6SPp1/LiT2K4rlGtyWN1X7Qb17tsFuea4JZScpdgIn4I47OPHu9LaD75PRUSaGTYdg7UU3KKL5ldUMhxozD2G0VFXLaHQIs0VgeLw90yqMmOvcpYdfQNEadTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HloNjEUG; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HloNjEUG"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so28236f8f.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 04:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791978635; cv=none;
        d=google.com; s=arc-20260327;
        b=WEqp2TBqALh28Fj9umvMIo1eB346YrT8epUf2ALCY0/di51x5OkIOUluyrmtWhxDta
         6rHodBKETb20Tpg234A5ks5V1RO6tEENWChBFhv8yy/lfPdUiJ0gyhyIg9vc+ixUBgrH
         iLYN2Og3CBVUdQ1WW8YEmAalbprJqs97tKq8Qf5estwxwT0xWxwCQ8dsz/b10T0QqrAF
         GcHm4Pn3BUN0D6awBWimkIuEVuMt1xb1XuTqchrIo78ysS5vMyt+sP3nPE/8WEcatU+8
         P20d5PqjYs/qMR1m9GVkMPKN+N0/sJWJNKvbMpM8uEJIO73r86JHDS3fXSLsJ2BIr0FB
         eTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gsB6r14qi7ICCBa3crZHyjHVyyF0McKRspvIoEcEfgQ=;
        fh=wiyUzaAORhvND/cCxIQVPhmBs2QyjRjA0wGO9ExJtKQ=;
        b=iBmXsjd0kBpNZbfE6a1OQemWzBomL9l5qSc/Yilfnc7TIgY+ejjgDS1EyMNB7oS6Bu
         Tq7SfV0JitHljt2yl4/Etdj1ycNpSSS7y/xQ3vQUAkoHEBBxuDX7GxRljwihEhAB51E/
         vkCCUizXEc8uE4ZTPCMnTps69jKH7DdjMz81tQIZS4M1ojRF0ZAgeO7FTh55aIMhWsv7
         tXmVerCWrFfrrblROKvcUdLPz4tlRLqB0Hq4Iqolwc1V9aHfK1iKBtOg6LXBEPwH4lcA
         O9hTmh/vCuiuKB7nKy+H3EYcslWM0omeHEIfx6uItb9UdcjuEdhqAzVgBjGVdyVaDnKu
         apew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791978635; x=1792583435; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gsB6r14qi7ICCBa3crZHyjHVyyF0McKRspvIoEcEfgQ=;
        b=HloNjEUGdlK97VspGJuSH0tt+rdWeZDHFVFV/DXoWLtLGiKekIc5C1Mzqfdnho47T8
         mUM7BoSslPAsG2wtVSP0T1RRmCKKPOWyc2fx6avonOZ3qUVPUmt37eYtly9M2tuZvyd5
         xeP5gbhl4NVk5pJTX+TtaxorGmQOotCHqD8CEQswI7DUMDwMZRCtPEQMEkZsRMXc/oqV
         LKpPn9e3UKlGj9FEdpswbK+N+03v7matAZo2R5f3Ms0TaYCOw+gIRqlbXw7n1qX8O5mb
         9ccAy9eXqUJLiuCJz5jJiys2r7imdOGPkTV03gnG7AHC0+jzT2EVZopGp9bsyWvFuKNb
         qsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978635; x=1792583435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsB6r14qi7ICCBa3crZHyjHVyyF0McKRspvIoEcEfgQ=;
        b=RPR7wmn+Ge0DzQiGFtyKNuBNyJ7Ag7KFlVixPYitD2fHiTsmwCtyst3HYiBFWTOB3O
         YoAEVSpMCHuVervsud6t0AKF+HWp47WoYFzjisByY3vSiPvDLwJYoAC+h4D1CuyIeCyX
         /B3rdXB3Rc9eP5eprhqFaT/1MMsPzXZ0TmQj+qktOZz0Pcf/eRbaVFuiE6/ErTGesm3y
         jMqJ7u/GJmCgOJYY2X2x/v2O+0hyNBGHWiXhz67jZW073Xzjh90GjlTbKUSeb3Ytqm6l
         pPgGf6AufTmUoXA61xirmRt1FEA5wOSk87oaaRb8NE+oyp5sFJf5fYwSt5EShm46wgED
         YFDQ==
X-Gm-Message-State: AFq9FYJsjmCnDD5mpVV468SlwovAW2Bjy6QcDYTw77zqr+ZWwBuHn3YG
	toGJArFEBTmNgzmK63tBF8tj5YDD5y6G1LA/ECXiOJmbvBiiZRDSAokctnVN/5vqckpB1vJSo3A
	jpm9i2TP728L2r9ZIj2l/l+JEX2zG5C8tRBnIrdM=
X-Gm-Gg: AYBFou1laXAZxfGHaQ06/YY2HvqATvCkSacAH9h5w0cFs6BbTA5IkHkZzvIooLFNw+x
	zLlbvrtiQPLTeCwim0vWh5qVGUUCU2qfR/XMQ2fsNnN5kIZZordxNUiFc8ly8Eqnw0DUrzzAzJR
	fUv3Dmch1W7aAd0a/OUBKfTTD2Xjf86Yiil9o8ynwZNH/YH200HDjcUdDUN6c+Sl9f+QNkmqho8
	lzHOgFR7aAepU2Ih7mWSM26bXgpXhtOLffNQkPR8XhzsbzP5pzs6iSF20vlTQ5wlx2L93rSyMqL
	TPp9SANn9sIAHgYmjI3Q0TqvZL0hLmoqXjc19mlp8haBUIdaJyLLG2poz/MvwAnsDQ5ZbxCLGp3
	K8MlquQ1bz13sF/w2WSGXekz/I5jkx+WuOb3eLFfut51yUU4lOpPGANF7H1kJsgABfVc8wK1Djw
	==
X-Received: by 2002:a05:6000:2506:b0:48b:946:c1f7 with SMTP id
 ffacd0b85a97d-48db94bb90bmr29562583f8f.31.1791978634671; Wed, 14 Oct 2026
 04:50:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261001154326.754314-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261003013310.D30A61F000FF@smtp.kernel.org>
In-Reply-To: <20261003013310.D30A61F000FF@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 12:50:08 +0100
X-Gm-Features: AclHuK-yCqqeOjMwwFQaMKLml8XUsF3SK8FdUMhRnNk9iZskJVvyr9TZ3F42bUI
Message-ID: <CA+V-a8u-xhSopVPya+tZRZrn8mSWYzsEAXHpRC6eTwCk4DUmnQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 04/12] dt-bindings: net: dsa:
 renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 3, 2026 at 2:33=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] dt-bindings: net: dsa: a5psw: globally requiring interrupts br=
eaks backward ABI
> - [Low] dt-bindings: net: dsa: a5psw: missing port count restriction for =
ETHSW variant
> --
>
> commit ac61e34c73e390592b92437f35f98d8807997f55
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW su=
pport
>
> This commit extends the A5PSW DSA binding to cover the ETHSW variant used=
 on
> newer Renesas SoCs. It updates the schema with new compatible strings, mo=
difies
> interrupt and clock properties, and accounts for the 4-port topology.
>
> > diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5p=
sw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > index fab6aa6237e93..863633185912f 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> [ ... ]
> > @@ -73,14 +145,48 @@ properties:
> >                phandle pointing to a PCS sub-node compatible with
> >                renesas,rzn1-miic.yaml#
> >
> > -unevaluatedProperties: false
> > -
> >  required:
> >    - compatible
> >    - reg
> >    - clocks
> >    - clock-names
> >    - power-domains
> > +  - interrupts
> > +  - interrupt-names
>
> [Severity: Medium]
> Does adding interrupts and interrupt-names to the top-level required arra=
y
> cause a regression by breaking backward compatibility for legacy device t=
rees?
>
No, because the existing SoCs already have the interrupts and
interrupt-names properties in the SoC DTSI.

> Existing device trees for the older renesas,rzn1-a5psw hardware that do n=
ot
> specify the interrupts property will now fail validation. Since the Linux
> driver does not currently utilize interrupts, it is perfectly valid and
> functional for older device trees to omit them.
>
> Should these properties only be required conditionally within the then bl=
ock
> for the new hardware variant?
>
> > +
> > +allOf:
> > +  - $ref: dsa.yaml#/$defs/ethernet-ports
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g077-ethsw
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 24
> > +        interrupt-names:
> > +          minItems: 24
> > +        clocks:
> > +          minItems: 3
> > +        clock-names:
> > +          minItems: 3
> > +      required:
> > +        - resets
>
> [Severity: Low]
> Does this conditional block need to restrict the port count for the new
> ETHSW variant?
>
> The global patternProperties for ethernet-ports allows
> "^(ethernet-)?port@[0-4]$", which globally permits up to 5 ports. This is
> correct for the older A5PSW variant but incorrect for the new 4-port ETHS=
W
> variant.
>
Agreed, I will add a check to validate this.

Cheers,
Prabhakar

> Without a port count restriction here (e.g., overriding and disabling por=
t@4),
> device trees with invalid 5-port configurations for the new variant will
> silently pass schema validation.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001154326.75=
4314-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D4
