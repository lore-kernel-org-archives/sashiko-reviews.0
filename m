Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D146F41B8CE
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 17:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777442; cv=pass; b=IamuM6ked5W84fg5PU+vtECTHjPZlIHTf/Qyk0Gf9dg7L5Ga9G9zpFbSzn+t9o3DLpvIJpZaNtNMV0YVCOj0xUTntV/me0iIq/1z5bTK68szqL2waDm7UnFeBywk23Kvs+6WZeg535yK0sWce207tkfXpGTmnrFzWtHBXXPGfq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777442; c=relaxed/simple;
	bh=/aIP5kdHRv420QYAn8jtf5FUqXXy259JWuHla5LMYPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8ekCF749lcjDLTV8D2pDjWXkkOzftSXQQ7eJDeS/W0y30XSNgPFWjcGTcQR8FqTWwy33qMurh21gphn8lRQXdikeyXhXYlTaejRCWu0JRjYSBpWrl04cd7YvIOKlIbab0eTfM9LbX2bkJt5/yVtyZm6ezERKKYWMmi6qr+SZ4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaHAhK1R; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaHAhK1R"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a051b73866so5894016a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 10:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785777439; cv=none;
        d=google.com; s=arc-20260327;
        b=GZgiqtL+nBtSQc6eVlMAMHBeBU/PbjLOvAb7HDD9s3No/cQLlJ/o1SV0b5t+oW57Ef
         YUROklhTkyUvpr65myxRAvlUM15tET6YbZIDCuPZB+DjZe4ZTQ/uwfQ75vpbKE6dj79H
         CPpMMGWfQkTqX5sWswy0Yq6YZo4ZqD2fYzPE5yHQEPJa5Zxtj9Z55I14oqQNvXVjzdyo
         ouOSKlBq7k/7d9ZIUQ9w6LM8MrEaAVHznSTnFubPmrw6IgRUVnKkiX/M19Le+zbb36TI
         XsZ90697VJOJeKEifIdy81n8y0QLlw5NOT4fXwGcE8CIn25GXfnD8ZQCA2BOXyrd7dmG
         skOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CR0UMYa97mM85aqJSl/JOVNVWw7zagx4FNFrcVMGQkk=;
        fh=l9vJziDWd0MXyjtmVCV+SfUYONNnafOPqiAc6xzJVLQ=;
        b=dbpGfnUrRJJSJLco/QpCVFYDH6FggSqWCh93io1riu5IL0/21r18Rs7e7hs7IBEsIu
         hwN21uz7c6SEQRicxpVmaybxeP1SfCO33vfmwHBwUckN7eooRMTa2XtgVdNG2EgpXURf
         Fy/af0FkTRq7yMlMm7VBEBUTzLXtIh0fzpoI2e/iiDPqWGnToaSjCHFUbY/Qt8BX9d1x
         oQHGMYMHe7qiRSLv4GO5FfxYOxc72tbpelSOFzrd+vuLWIOO92Vmt3IfGiDDWPQg7l4+
         56Cvm9P1pm4cxFyPTLzSElnRQGew4kqfhpy8989g7DWgDIlYT35T2iM99dKXwpgP/C6D
         aB3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785777439; x=1786382239; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CR0UMYa97mM85aqJSl/JOVNVWw7zagx4FNFrcVMGQkk=;
        b=HaHAhK1Reak6jT1/ObM5DSkrEb00LqeZqkY0cJ3xG97e6VAEB8qhuXspsj3U2DXYfD
         KXkgNr//nP4TfTKv08Z5JrtGXfSgn9xu6VA5xVGyTE8EqD1Pmy5b6FaloCVyTAhLDOim
         6tBaet7m/0rqyOdZphflYTei39lUVM4MLNUpTrQDeBOrChCjXhfSGGlBzGABeEL3Es1F
         UtwSgYPXig8fW/lJrFHrw40Cs+zmfMTeJvfSCU9FrTtFZNsI60T7fS887SZQmyg75IwT
         QxzDGWsZCJEUWgqoejyhQ14J8Y0wM41bXwU/N/0A2VHyD+q4ucAkJiX2pKh7dsfLP7KY
         L3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785777439; x=1786382239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CR0UMYa97mM85aqJSl/JOVNVWw7zagx4FNFrcVMGQkk=;
        b=bv8YyKrKV1G0zGt4uOn5wqmyHg9b9ckxBOakpHrt8DqhsJlnsy54jEjD+7xmeDA+GS
         tL7HYAyRfGa6o/VBGOUlqZwJeLDTt3nm09Wl2aYNd81wV/FKJgvMFus19K5FTppyAFke
         8rOme5tH+8Blri8Wgy/9s3Dw66ybQM1mMWUxLPPudNWxQd4khUfkdBD6UXzzj2io4HdH
         BC5Tn7vbcUiSkCvY4JeEELBrewLEWoy7NAJk1OB2l+f2Lw4oG4RRE9SMUNVp3U5P6gcY
         9EeZi8ij7lhETAzaFS0xRpamJiG1OBW6TdXElqDoMrl3nyc/BKkXjCvUJm40n331NPZ7
         iUDQ==
X-Gm-Message-State: AOJu0YyoxApeyFlQ7Va9FZ1a9++k46yVQhZfo0OKEYgbR4EcNRCRwym0
	Oj9xOhweHJjewvzvR4m+9H4XqRg6nGBCSliJ3gCUIzbcEJgNGOtq4I1bLzsBqwWU/RBw7LhHkrJ
	LGX9bg1J3THPu47AWnokCjifl7ys4ki9krsjmv55GsYnj
X-Gm-Gg: AR+sD10qX26ytpNuOyJBmKU14kmmqxTrjYxMzpuhj1580fB91LHW2l+317HAQ9QqbPs
	vY1W4pWq8ujbHkHh1VnMK2TYO6FTXk0kVihvnLF9nDoJT6A6RpJvZxbm5DcLFgaxnjybFiFnmR7
	OWYSl54cMWFC6jts5fwZcHTXbCJul35VehY4/0zyVwVFUkAN8ao3iHboKZzLXHPDd2grVUOmQTf
	XezzqldmQkctuBfU5HHXVFH6iTbOTb1MScmSjZldNelw3HW4GqJbhDCY7hFdKpq89tG/G+CzAXz
	jIj30YH1z3MWSn+n+SwMq1EaShRNQGg8xKUdxgaQKZLNkseo+Q1OvhoXJ/pjwzI5lqRD5VbtZVy
	XNtgwQ0aaezUJVJ1GNRndWAJogbZfboa35UqPe5zj62id
X-Received: by 2002:a05:6402:a51c:10b0:6a0:c9e1:181d with SMTP id
 4fb4d7f45d1cf-6a0c9e12cd2mr4720601a12.14.1785777438858; Mon, 03 Aug 2026
 10:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
 <20260801-hm1092-driver-v6-1-5979f223748a@gmail.com> <20260801130150.5BDB41F00AC4@smtp.kernel.org>
 <20260803143241.GA3364728-robh@kernel.org>
In-Reply-To: <20260803143241.GA3364728-robh@kernel.org>
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Mon, 3 Aug 2026 22:47:07 +0530
X-Gm-Features: AUfX_mzBSrMqhs8O1alBT0XAhQBr__EPtIEyVLNZtdnsmHlUUvRwv9-x4Su1tZw
Message-ID: <CAJTcUFQ0iBF=2i3Bqs8PmBRNeqeYjdazNYU4HPzL1eM+UGuhwA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, media-ci@linuxtv.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Aug 2026 at 20:02, Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Aug 01, 2026 at 01:01:49PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] The schema fails to restrict the `data-lanes` property to a =
single lane, allowing physically invalid device tree configurations to sile=
ntly pass validation.
> > --
> >
> > --- Patch [1]: [PATCH v6 1/2] media: dt-bindings: Add Himax HM1092 NIR =
sensor ---
> > commit ee5879a0923ec6b56edc74d8a66ff697b111ae09
> > Author: Ramshouriesh R <rshouriesh@gmail.com>
> >
> > media: dt-bindings: Add Himax HM1092 NIR sensor
> >
> > This commit adds a device tree binding schema for the Himax HM1092, a 1
> > megapixel monochrome near-infrared CMOS image sensor. The sensor is des=
cribed
> > as outputting 10-bit RAW data over a single MIPI CSI-2 data lane.
> >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092=
.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
> > > new file mode 100644
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
> > [ ... ]
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> > > +
> > > +        required:
> > > +          - link-frequencies
> >
> > [Severity: Medium]
> > The commit message mentions the sensor outputs over a single MIPI CSI-2=
 data
> > lane, but does this schema restrict the data-lanes property to a single=
 lane?
> >
> > Without explicitly defining a data-lanes property constraint (such as
> > maxItems: 1 or items: - const: 1) in this endpoint block, the schema in=
herits
> > the permissive defaults from video-interfaces.yaml. This would allow de=
vice
> > trees specifying physically impossible multi-lane configurations
> > (e.g., data-lanes =3D <1 2>;) to silently pass schema validation.
>
> data-lanes should not be present, but that's probably an issue on a
> number of bindings. There's not a great way to so this other than using
> 'additionalProperties' instead and listing all the properties used from
> video-interfaces.yaml. But then you have to list 'remote-endpoint'
> everywhere which is not great either. I'd rather just allow the property
> even if it doesn't make sense for the h/w.
>
> Rob

Thanks for the clarification. I=E2=80=99ll leave the binding as-is and won=
=E2=80=99t
add the data-lanes constraint suggested by Sashiko.

Regards,
Ramshouriesh
