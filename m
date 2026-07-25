Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DA43515CD
	for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784977454; cv=pass; b=C+OXxZu3pSzP4QXdI6buiwo7b9IYlaQIqNMmwWPMqFTxpHFqQifEI+1bp8IDdqg9rq3nYSyGBCa66ZSqssWkjS4paWdabYj3O2CM3mjRQwjtct3oqoglMHQ1MnJ+KPysS63B0K/DQFREj7DC3/cfId8+U1cL//UKpeA/ZtBRQns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784977454; c=relaxed/simple;
	bh=wcjDIyZ1mnJ8cH/GZH1fTS6gxU6s/wkKmDJziA1q9FY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/wxfqCw4kpDzUGaTy4qVJujxUC7a6bjaqIBiTyY3pkCpd6QMEbnaBnpjCZYOO29fBryFyj2+GFtKGCp9+oV1PMUKK/a04c7WFSSC16Ow0EvyIlDmUMzPYpH3TC02X9vbUfGZWmVsSKanIKaNDf6+xVfc5J8CSdUQJAjcPk/m2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SveqZ8Li; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SveqZ8Li"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-668296d0ff3so1326407d50.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 04:04:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784977451; cv=none;
        d=google.com; s=arc-20260327;
        b=UsgiQhwzLnj0KdtuQCfAWxuuLAz00twhFyG8IHSBKVY2/7dYOiV96Z+JSwJNAoQXgB
         ieKap9qCAcVJXciSoYyS/nZwoyEsb/NQYUAKIEJ6BZmM3Akco/FylvgJ2cL0wcR7ZNwR
         yiNDtEFt7yZwxPQwPO8SE9zAIoM/vqQfWcl99P2UAVoGeBUDg239tsfSOamYWbsceKuM
         EXBMjoWvZP40fpeOMZJsvrLZa8QsrR8iBwhCcAqqmbQnmpVwY7txMCJEnwa7b+NtQ1FO
         pVZbjKFM2KnGufLZfAyQAdLQBd28omkKYAo1tGxVIN2IN6514qGakWrc1GszeNyIf3KN
         1vlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=srA1KnFMtAkfLylpBOd38/AYtNBjKS4SQUhSrptcxzE=;
        fh=BtRFuWxQ0Jq0SdPet/iN8ngoqrXWSjOp5I6xE65jI9w=;
        b=der1kmJ/7nacBoDJOmrn3Gb5qdQKo4y6dx0qYC8sBzxaF6miYLYeSF4ET7Q/2VHtNV
         RDwGE42hRyHBb/X7hT4fNYOy4FZAy9U5ktNMljIe/3eyxrjvAPmWFMgiQuxhrSMWv1UR
         3MT80PNSJ5OX1ojEyzdSa0QyniA3e/dyLYgANFXNoouYTgUMddnXdUfpOMg/6+1zOCVC
         SbJHYFd284YgrNIRU4hwH8qgSVS+vxDvyKDcxjItDaYvjpUYNI9tlXcU4flghP5gjG1A
         DYNLMZuTnguLY3CUZYRSU2oz5kTj3pjcMdrYLH6On298dABb6TnKl2XPJJz9TBeFxUOR
         6DHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784977451; x=1785582251; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=srA1KnFMtAkfLylpBOd38/AYtNBjKS4SQUhSrptcxzE=;
        b=SveqZ8LinVo3K/oHZP+HOkfMFJLnbAGBkrvkHthht3CcKXkfgOSB4GlGvnOvOhmtJQ
         XIu2bOC7btn/rNV+uBeA3U37Q2xkVlHfK2Fv3GSCDgMrAn7CqLVpmCl2EpfCq/7/XFCJ
         wh2cOvmPO1ZoFc0VtlsAhjsuH3puUNF6+mM0RDvGWIE2fbEFLO8OE4fygDSdMuo9cYPn
         ifKWl4m+XoZlrOhbUXIYtOKuo7F1DrF6vERwh5Mez3HtIRW1NINyslkqp11XeEhtEbbo
         UF26QMEhRb8/5PJD4tBKQ+w+db8IvFCHUnHaow5In30eugprFCEXg7uPAPFWmKgsJC/B
         A+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784977451; x=1785582251;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=srA1KnFMtAkfLylpBOd38/AYtNBjKS4SQUhSrptcxzE=;
        b=XJeqfQfPCdwYp5ioqsPGov9/KMGXL8PMQFgsh0wkar2gmG8c7D0fFUn2lf8wHpHa43
         +MgjjwdcbyhLN1t0E3ZyJHOQL7QG/pdvqjNX35w2x/tRxERxMhhuBp6HP4S1kr6TRGHx
         bMBJMaZdSDiCxa/QZSTC1YzWCK0+3qHiOKVJd/eSqpfvil5/qUcnlnrnJtj2TcHbuGMH
         zUimzWOBBuOLixKNQUyrz0nSUxhuLJniXRwRR7Y4qdj354U/ygcWcmSbvQV8thrIqk76
         q+mtW/fjEoPMqAaq0Si3aZXG+1LirkOug55CZDptmsmC/aGeysx941sCNzbQ45BlCDTa
         ewsQ==
X-Gm-Message-State: AOJu0YwlszbDFBMHq6l7HqmmLjuiBhq0Nc2PdlVBsaeUPXgb7R+RSZSh
	NJZuunKhUoi/m74Ev9WyoRNyLViae1X1rIZ9zAC/IQlMPz5GG0Ir8HlmDhlPd2csriwU0X16xDD
	Uefa4fekDf4Xx+PVntqSyRXrl0YN1b5M=
X-Gm-Gg: AR+sD10yfUju5vT1+Or2d4SOtKFC48tuodyGGwKixYtiCBlpD+yk61/A5o1z5YE/RnG
	W9ZzoF/uuABspfuj0bLgi+md9aC33SOW41+Zdza98F/6VB0n0HnaoSN9kpQ4Fvg+CU6zd35+3ag
	KoYwXmM5/ja7SeDhhbISA9h9DhoUC4Unhr86NjYpHeXzvqp16w0O7GaOcic2GZSltiXxcx068Qu
	jgERHjTjZLosALxpDf6TILlaS9filM8PPuSmlk4MHKjEspc7iQUxUEKTFyGPA==
X-Received: by 2002:a05:690e:408b:b0:668:9ea4:7752 with SMTP id
 956f58d0204a3-668c7cc6459mr701858d50.109.1784977451490; Sat, 25 Jul 2026
 04:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722123243.341346-1-challauday369@gmail.com>
 <20260722124415.63DD11F000E9@smtp.kernel.org> <20260722232109.GA2760962-robh@kernel.org>
In-Reply-To: <20260722232109.GA2760962-robh@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Sat, 25 Jul 2026 16:33:58 +0530
X-Gm-Features: AUfX_mxoYq1Nw4WTzKfbaV0jD0Ve86ial1pv1PtAGx0_6Mj1lk7duKXcz1N3sSY
Message-ID: <CAAj-GB=AP0m71Mm-+arX6kYEo8w8Eyah_aZp9c0e=4KQuc2r_w@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl:
 Convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

> > > diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
> > > new file mode 100644
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
> > > @@ -0,0 +1,107 @@
> > [ ... ]
> > > +properties:
> > > +  compatible:
> > > +    const: microchip,pic32mzda-pinctrl
> > > +
> > > +  reg:
> > > +    maxItems: 1
> >
> > [Severity: Low]
> > Even though the changelog mentions removing #address-cells and #size-cells
> > from the schema, aren't these properties still present in the
> > pinctrl@1f801400 node in arch/mips/boot/dts/pic32/pic32mzda.dtsi?
> >
> > Will their removal from the schema cause dtbs_check warnings for the
> > existing in-tree device tree?
>
> Yes, but warning is correct.

This means #address-cells and #size-cells should be removed from
pic32mzda.dtsi too, which will be a separate patch. Does my understanding is
correct Rob?

>
> >
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +$defs:
> > > +  pin-node:
> > > +    type: object
> > > +    $ref: /schemas/pinctrl/pinmux-node.yaml#
> > > +
> > > +    properties:
> > > +      pins:
> > > +        description: List of pins to which the configuration applies.
> > > +        items:
> > > +          type: string
> > > +        minItems: 1
> > > +
> > > +      function: true
> > > +
> > > +      bias-pull-up: true
> > > +      bias-pull-down: true
> > > +      input-enable: true
> > > +      output-low: true
> > > +      output-high: true
> >
> > [Severity: Medium]
> > Does this bypass type and constraint checking for the generic pin
> > configuration properties?
> >
> > By assigning these generic properties to true without also including a
> > $ref: /schemas/pinctrl/pincfg-node.yaml#, it looks like the schema
> > validator might silently accept any value or type for them, missing
> > mutually exclusive constraints like having both output-low and
> > output-high present.
>
> This should be addressed.

Taken care.

>
> >
> > > +
> > > +      microchip,digital:
> > > +        description: Enable digital I/O.
> > > +        type: boolean
> > > +
> > [ ... ]
> > > +    required:
> > > +      - pins
> > > +
> > > +    unevaluatedProperties: false
> > > +
> > > +additionalProperties:
> > > +  oneOf:
> > > +    - additionalProperties:
> > > +        $ref: '#/$defs/pin-node'
> > > +    - $ref: '#/$defs/pin-node'
> >
> > [Severity: High]
> > Will this oneOf construct silently accept undefined scalar properties?
> >
> > Because the first branch lacks a type: object constraint, a typoed
> > scalar property might trivially pass the first branch and satisfy the
> > oneOf.
>
> The $ref has a 'type: object' so we should be fine.
>
> >
> > Also, for valid child container nodes referenced via a phandle, the
> > devicetree compiler automatically injects a phandle property. Since
> > that injected phandle is not an object, won't it fail the $ref type
> > check here and cause spurious dtbs_check errors for perfectly valid
> > hardware configurations?
>
> I think the $defs should get fixed up with 'phandle', etc. added. You
> can check the generated processed-schemas.yaml.

Yes, it is automatically handled by dt-schema.

Regards,
Udaya Kiran Challa
