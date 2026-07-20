Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6AB394462
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 03:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517846; cv=pass; b=fNyfM5JmSgK1PYw5oZgr2+k3KfqYMSiV0sBXkSHTQGIK1UdxotdJUNSRVoDmuz7Cvtz7a7r0jqlaogGnqxU6yM0gNQMQGyuSfO8oj7pEzd8czwbYoC7WSqbtQHISBHIPQhCvG5ivCTvhGASA9l5tWBhchJHkQ75Rb7ii+5VF+G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517846; c=relaxed/simple;
	bh=oRIe/84zUcYPF7WKctWcQse43kn0k7OaGkq/Am/HD3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pFgYtdvG/CTRxUJ6in8MkjZgFh1QjDNF3iPoUKh4QX2zYNg7rj+H7uRYJlZ7txV4UtOxLys127ff8aw3O6avLfmIqgz2jfT7yBvasVhSqhDx08PXKS+5SpMLeP9qME0sm5q8Aew8Xez0JMmFYOBXiuuigTxBEygWUS15c12FBnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxJxGMrV; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxJxGMrV"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15d111ca99so994412766b.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 20:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784517843; cv=none;
        d=google.com; s=arc-20260327;
        b=gM6HcAlNPR9vxHevdTN7SZHPkeDyEbAqdmXKTuz4Da5WTyfjPXAClCRwpDmfop7YyR
         WQJ0Ab1HGsWxQHUAz+JI+LlAtgYPZB4yxWwUQWE2W5MfosFYkdXxobZLYCwk6154Mlk7
         vsN6c06OP/QlTtVp9w6I/bqBugYXnDT4FFI/Ao1M3nzmbJdI2iI8kqFigo2YAf0iliTE
         TOiTnuOtgHrv9AbFzrsgibE5qx6pO9IbP8ozjE2voXFMkvnPCWnkj2HYhwWncT4/bxdZ
         tTVKm4yAh7f1yLUkkiHrlK50s05EofZc9zee3HI5ebu5kKwPBZiq867JBMQll1POv7gN
         3ZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8V+cmq0ObXqhIAMf/P6Sid/1xN3TypvFqnYYrUPHLBo=;
        fh=N9Z87eG/HzL8ti0cgBStMTEqiW810YfndzyMugtMrHs=;
        b=fSc0YvzbznzylpMqflyZ0eLzNMvvvtm/rPTGMCQWxrSEhTXjCdyTgSwIOWuBU6G1az
         PUk9AkAz4sK49z92MyfHCzrdzE70rTY+5ao9HHpg4PEabIGksCDyYZb9VAuO11DWUFLo
         n0EZa7FzRRfCf5WPILz1XFo0S/ktf6ikQvWUlz8oTzLqLr3k2EBtMhxEzAOFgJNyNEL5
         h0Ya0zckJC9xsGP/p0gTNaWKsvLQYsUwm+dROG2J9CwMOtKvUb5hPwdN2qoOhjjX3oxm
         cEoOxMYZuYgDAQoyY1sDP8Y+u0o9prRLtn2gY9ZLUyLsuBAdmKYraYk2AsE9L5/+iRau
         hcvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784517843; x=1785122643; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8V+cmq0ObXqhIAMf/P6Sid/1xN3TypvFqnYYrUPHLBo=;
        b=cxJxGMrVcQeZoQ6Ox8vCAAN/uFJhzR8IenMAHbQw4odKb5wHGdRN898AHqIgwtGtph
         mBsfmZNDedu1L3c4i2kXfZ04+IvUut7Devu3GBw/ehEMrlLEyWYarNpz2/atblrl6a2t
         rqWoGGc7HUTxxRn0ZJX9DvYO3FCj859MHwC1NFIaaUYzSGfxpEVwi4ORFMYTiRxSb+cb
         CliZPjLEiS9yObQU1ILl9l7PoUV0kXAp3dwpBsASkpNUmyUKQdLXmQGAXCIQBkU8YE6X
         UKkAt/oL/oKKPcC4TKBxmmSFGhsXivoGuI360IGHPu/xikeVrvlR5oJEYkj9t/9I2om9
         CgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784517843; x=1785122643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8V+cmq0ObXqhIAMf/P6Sid/1xN3TypvFqnYYrUPHLBo=;
        b=QAH3EZ4mMFtAT55a//xLs6HaY80+LSU6Ebe9+aQhxjBNxxDET4O6QeCOzWhvzULLSl
         Jh3inkRy2kHMczBo2RGoioT8w9I8kY3hEOQatIif76nyxFiN/elmEpwe5Pq/cLU4qNYp
         Z8ClV4NUnb+dR1O4dQBabywDXWazb/6aluFVsqCZRc2TBcYbqohg2fDS8yGwNRC1hECC
         kQAJ9c1EH5VZ9D6/XbtBjgN1Ffed2ecQ2HwgrAbEQvUR3oFOY/IQLrV3WjBUVTVF6HMd
         YjysuNBmPawmQf9OBSS8w/5CxakrdWupqq4cgQIlGW4CzURpUcJedVlhDc3KrPKISRez
         3cCQ==
X-Gm-Message-State: AOJu0YwydCQYpZipSNpki+I8y6c8K3jI7BhwJvUIuzF2/a8ItVd6P5MB
	tAyUJO0NAbFEVpKe4WEXfbITPzkytk884ojyAQcgcZsPiwaQz9Ym0BHvViNMRyA6TuJh7hFNVeq
	aDR5p6Rzov/iGf0i0QWjOsSKYcwF+CUesIRcS
X-Gm-Gg: AfdE7ck7miyEyB3HTnowHKngfkT9ookTgfIJXrw8h1/lM7FvZi5ukOogiUVA6iIP3fp
	ogV38kCjshJtTv75nccQrqbimNgFyT00qZpL1O0MuU3IVDtmK72pHHA5fhbyVWv2LgczuIWC0dd
	QrRJsoOcFW0Ce470y8r/gtWIrlnYAjisp3JKevh6XntY8tUXGkGRf83ApHM0qtxJwARtqiL/h3e
	cUqW1AvssHRcb5q5ztcERFkePnePlL4uHD5OE/qlBSwMHRk9jlPYWyudD3lAajOa1gRZHr3Abhw
	sN8vQ7XdvohczWa2V0k2
X-Received: by 2002:a17:906:7947:b0:c12:9b93:61fd with SMTP id
 a640c23a62f3a-c16b46aa27amr427440366b.6.1784517842957; Sun, 19 Jul 2026
 20:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-1-a55147958fad@gmail.com> <20260717210439.356FF1F000E9@smtp.kernel.org>
In-Reply-To: <20260717210439.356FF1F000E9@smtp.kernel.org>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 20 Jul 2026 00:23:50 -0300
X-Gm-Features: AUfX_mzsv1aeyFo6ikWaI5--bnju7xbF9TV1ObqLQI1Nx-0zHSbgM8sQSA2VqxQ
Message-ID: <CAJq09z73W9rtS75K2802jmZpHcAag-Sz6roKQW31cYANH4gjFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add binding for adi,adt7470
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The binding defines PWM output and thermal sensor provider cap=
abilities but fails to include `#pwm-cells` and `#thermal-sensor-cells` in =
the `required` list.
> --
>
> --- Patch [1]: [PATCH v2 1/6] dt-bindings: hwmon: add binding for adi,adt=
7470 ---
> commit 6372aff696282f1ac0ec9a8f1372c186734704a2
> Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>
>
> dt-bindings: hwmon: add binding for adi,adt7470
>
> The ADT7470 hardware monitoring chip supports PWM fan control and tempera=
ture
> monitoring. This commit introduces the YAML device tree binding schema fo=
r it,
> defining PWM and thermal sensor provider capabilities.
>
> > diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b=
/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> > new file mode 100644
> > index 0000000000000..14bb6359c91f2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> [ ... ]
> > +properties:
> > +  compatible:
> > +    const: adi,adt7470
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#pwm-cells":
> > +    const: 2
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - The first cell is the PWM channel (0 to 3).
> > +      - The second cell is the PWM period in nanoseconds.
> > +
> > +  "#thermal-sensor-cells":
> > +    const: 1
> > +    description: |
> > +      Number of cells required to uniquely identify the temperature se=
nsors.
> > +      Valid index values are 0 to 9, corresponding to temp1 through te=
mp10.
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> [Severity: Medium]
> Should #pwm-cells and #thermal-sensor-cells be included in this required =
list?
>
> Because this binding defines the device as a PWM output and thermal senso=
r
> provider, omitting these cell properties from the required list allows
> incomplete device tree nodes to silently pass schema validation.
>
> If an adt7470 node is created without them, dependent drivers attempting =
to
> reference it as a provider may fail at runtime when parsing the provider
> specifier.
>
> Could both #pwm-cells and #thermal-sensor-cells be added to the required
> array to enforce complete node validation?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-adt7470_=
thermalzone-v2-0-a55147958fad@gmail.com?part=3D1

It would be nice if Sashiko-bot could have previous submission threads
as input context. It would be a great way to avoid false-positives
like this.

The ADT7470 can be (and is, in real-world devices ) used as a PWM-only
device. Likewise, nothing prevents its use solely as an ADC for
temperature sensors. Because its use cases are modular, neither of
these provider properties should be strictly required in the binding.

Regards,

Luiz
