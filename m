Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93C113635E
	for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 05:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780119614; cv=pass; b=Ue9ynHL8UbjOYCyG/RfkTTAYf46RB7q7wknuvU+sqw9ILZ5h+iNgkiLN8k628lkCbZrQ3igtLgIRT4yA53DXrr4aC4AZ9bnLkhFNvLX8YUR4l+mzvmhS0NsExB7HyFS70Kuc5I2eb606e+JWEubO5UN5a7/1XUa+yTgb6IMvFS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780119614; c=relaxed/simple;
	bh=fcMiBykd2m247M2S8w3zuUBx++iTdz41/pyQA3cMvZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mj5cHkPLaKKQuvL3hay0Cx4dxcTMXHc7rmsTbh9dZXVk9posazHAObzSQ+DsSGmqUeFMlYUzb4lCDvZI86maKC2YAaHFj+cuipuY34t0o+/FhM1nSmodHTqF2t2vifliLGPNIKTz37xUyPkM3iM5q5HVHHKug0ZVEM5+0Y+dKXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTQwayyn; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTQwayyn"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ccdef9f3d4so19606276d6.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 22:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780119612; cv=none;
        d=google.com; s=arc-20240605;
        b=MRfpnrhHTmV3F7NBImgPz/PEDXx/JwO9BJNX/Wiqwu4ez3m2EpevqJgka3kY0vjpKr
         gGwiHAEjgbY8Eb0g6rtopM8zykreWuvGSBp37xm7Db+VkGDcIAC9YEpVFlhGvFiO4aRC
         nMqsjn/icupXqhX//2mgIGAkJNg5/G5702VyLPvoD10XgqNdFJ1LU1Jg7pJ4iuks5zll
         bjuwlKBl6udoWXvn7jORg6Z4GhEJWeR8XOiq5hTAJ6ZR2I84pVYmIDlojXgSzNxmfMqD
         ow6ITGYn913e0lzGNfcIOAfhdA5/c0z7gFFn7hh84qtlaSUQVeReRfHw162ozjzlYJOr
         jZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Lip9dASBZ4072fUZd4OlCA8STD2eKlIyWdvqrb/3yE=;
        fh=M1R/gWDo0vJmmK7j4ZPq4odrG9pMnT3/6DWsMyim7g0=;
        b=Jamv97+s+6OxPtkMGP42nt7m7r3Ht6qbAYkwACXm48q6qPCF8/0LanVgpl+bPNnj1t
         A0FFp98cEzCLTgH2ubwsVyYg+MCUjbV83lV1LwdPQ7RAdX90uvfjvhDDZFsrdH05dmWq
         n8htSNMyrwPbnr45N/KIDNqdk/MGLqiN5RP+cX7z5peLJuIkUhB7re5B/oPHT5elVyqI
         cCDfpm3CVvGoP9Eo4I1gAfJWXUowIwRNLyt3UJ/oE+J7YkoWLftnndwkRGe97fv2kgvh
         h4QiCh4V9YqL0FWIOf7wj4AsUkDxnBa5kmqfvPcaQSJCueTPJS6hTH9cb7Rxj8zksPMu
         gUMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780119612; x=1780724412; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Lip9dASBZ4072fUZd4OlCA8STD2eKlIyWdvqrb/3yE=;
        b=lTQwayynaIhweAG/+pQNNjH/J+JYCb/8NN+JIJISfokQhD99m+XnxFVqwOqZTf6bDQ
         0otpfAJw4zO5CEmo8npCw3k3MZJO5vCvDB8T8nLonanl3o7dbc07DZIbDQ60QD7qDtNs
         fI4rDuvjnXk1iiTMhaX8s9q4f58viP67InsB/m24TwnFeOgD9QkUmRm1YSDfdmw4GtoA
         8JtskA6ded+sIF6JFSnuzpY5tfYKd8c8xBx7TPvNM37J5vj8WbZ7GWVb/FsbYnlrYiOy
         L/bxOSzbToM0kDYDjmY7UUxkoPbHiYPA5CZGma7U6OrFTpq2/SklQp3mGG84ygYyNh3N
         iMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780119612; x=1780724412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Lip9dASBZ4072fUZd4OlCA8STD2eKlIyWdvqrb/3yE=;
        b=LGLjfjt+bqFnm8WvxwCxdusE4Bi4U6kL5+tPOoqMenIppTAMISmcBmpJD7OID8pKdx
         YfgAOnFFKdfMoSVel1tV+wjEeStecFV/GQHSf6u3AfL1Ig1FTpLqlJQuuk7XKRADoZw4
         6qDX/rXal2C2Ki+ILom+yqbQPqp2oq095grvcPXEW5nNoZZA2tBUVy+ifMWFzaS2PC89
         jWmG0kcPWApYa+O/AntZSdyzE6paiqDbPVoAjR0f1mkh/q9DXzaDoi6gi3HegHmTATNw
         H/beGgwyEzZdW06Phf01tD30A8ws+HLgP2SEJ9neh0Ypk8ooZtOobtehA//lfMRMuude
         zB3g==
X-Gm-Message-State: AOJu0YyMqIamRP6ZesUxJgaI1OeTcBpEsrEwvfsESe8OkHtjrD3P6tWV
	+T/OZUCzVYPkux7ATKsxBJF5qwzbAhwC0VWGy6ngtNwyQxe65NMuYjeH53U8HcGGZpxsl1tZH24
	fIDnZKwgNwGqyGaV6vMXdZxEEq3T4msM=
X-Gm-Gg: Acq92OEu2Q0L08vFQshs5lWAFUkAsEqw/Xbk34bolDn+yGjVqXP24Aa5EmfCiwEozN1
	mdDMPpv1rt6wlfil61BuQkqEOmJvyTygTw1ccZGbbCTVQ8zoSR2OkDVWckcASt4v/1SYIMfh80w
	UCqyjvaXQ7zgT7GCoI9UrZE6KB/+7ORJBMqqH3CjSesuw2UxUJqEfmux7TzZTEtx45VeRk+Jesf
	MlAhPmrjw517dQy8+LDIzknXt21+Kx0MriBlusFLxCZRplRj5W8qysVTzIABFnRpStpySIrQAKb
	3C8z/GQYsGsAF15GZi7Fr7V9utP3pqaluIxrOCMBjZtc6jdPgS/Z0v0n0VwUZuruEOEyhGCmYst
	MffCN
X-Received: by 2002:a05:6214:da6:b0:8ad:87a2:3c1a with SMTP id
 6a1803df08f44-8ccefe014e0mr47109986d6.46.1780119611758; Fri, 29 May 2026
 22:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260524094616.106660-1-manishbaing2789@gmail.com>
 <20260524101513.A76711F000E9@smtp.kernel.org> <20260525-radio-ungodly-9725b95ed67a@spud>
In-Reply-To: <20260525-radio-ungodly-9725b95ed67a@spud>
From: Manish Baing <manishbaing2789@gmail.com>
Date: Sat, 30 May 2026 11:10:00 +0530
X-Gm-Features: AVHnY4J4LRcPDSm1Jb4TgJEmvmkzMlak8iXI4y-cVUJQB65oF7f3ugFuB7bHFKI
Message-ID: <CAJvdc_fabG+ks-DaV5yF0uc0ZxGkOrJNqzn0jt9rKvzGt+kbpQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: mellanox,bluefield-dw-mshc: Convert DT schema
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,
Thanks for your review. I=E2=80=99ve already submitted a v2 that address th=
e
unit-address mismatch based on the Shahiko bot=E2=80=99s feedback.
You can find the updated submission here:
https://lore.kernel.org/all/20260524111528.107251-1-manishbaing2789@gmail.c=
om/

Thanks and Regards,
Manish


On Mon, May 25, 2026 at 10:11=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Sun, May 24, 2026 at 10:15:13AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Low] Mismatch between node unit-address and `reg` property base addr=
ess in the YAML example.
> > --
> >
> > commit cdc4e472d6093984a0a6b661575b015b013ec9d6
> > Author: Manish Baing <manishbaing2789@gmail.com>
> >
> > dt-bindings: mmc: mellanox,bluefield-dw-mshc: Convert DT schema
> >
> > This commit converts the Mellanox BlueField SoC extensions for the Syno=
psys
> > Designware Mobile Storage Host Controller from text format to YAML sche=
ma.
> >
> > > diff --git a/Documentation/devicetree/bindings/mmc/mellanox,bluefield=
-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/mellanox,bluefield-dw=
-mshc.yaml
> > > new file mode 100644
> > > index 0000000000000..32d50e45ddb86
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mmc/mellanox,bluefield-dw-msh=
c.yaml
> >
> > [ ... ]
> >
> > > +examples:
> > > +  - |
> > > +    /* Mellanox BlueField SoC MMC */
> > > +    mmc@2804000 {
> > > +        compatible =3D "mellanox,bluefield-dw-mshc";
> > > +        reg =3D <0x6008000 0x400>;
> >
> > [Severity: Low]
> > Should the node unit-address match the first address in the reg propert=
y
> > here?
>
> Of course it should.
> pw-bot: changes-requested
>
> >
> > The converted YAML example uses mmc@2804000 as the node name, but retai=
ns
> > reg =3D <0x6008000 0x400>. This mismatch typically causes a unit_addres=
s_vs_reg
> > warning during dt_binding_check validation.
> >
> > > +        interrupts =3D <32>;
> > > +        fifo-depth =3D <0x100>;
> > > +        clock-frequency =3D <24000000>;
> > > +        bus-width =3D <8>;
> > > +        cap-mmc-highspeed;
> > > +    };
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524094616.=
106660-1-manishbaing2789@gmail.com?part=3D1
