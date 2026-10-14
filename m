Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB7E4EFFC5
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973036; cv=pass; b=Cjnyz6fNY5Dw/uwdp7FKkhD+ApcglIyZb+rXX08KX7ZLHg+gLR+VCHkvh+OHwKqU5kJ9nNW99x/miDpTJzpghVbxZk77wlXX65htJcDbjkkgJztl6hggynNQbtkIBrbiz+Hggq2dbtIR09wbABDho1B/HQg/a2NG0PMeZV4keZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973036; c=relaxed/simple;
	bh=LTP7G2+FpL1LCEYiFsbQFD9nCHZqmwYYze7/kvg9fxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCUJX/Mto1GreaeK+IOUvvW+XdjcRkrpBJqU5dGrUNw2OslqWPf5+sG4XUnM1HWNkkIWIoqmW2CT4Eyf0GFuk+fZPe+xU58YA1IKpOnayYeTbU/n8vi9NhOcN0qPc1cEuAirGUIR5T/BNkFZRDsLJWygqlAVggf2iQcQs+z29Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d6zgHieF; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d6zgHieF"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-677bc4704cbso3573652d50.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 03:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791973024; cv=none;
        d=google.com; s=arc-20260327;
        b=rBgXl4YVvGcmopFwI6/u2Oozayx6rIYn0brDYfK/3FEVJeje1bZLZFU8IfKv4ugmyy
         EOj6Lgzf0kfU0c4w70TGWEAhPeAwYt5BeElTEpGPmBb/RHciBa+UoJvI02hFl3QOGT9W
         RHxYRp9rhooKnw48l/AZGDE7MWNARk7La7U6us1XKmR5Bzg7ZU7pglV4cpiCW60I7BMG
         RxUFKSGpmsXyZYnOk8TULkIngdOFNRY41e88q5RzSh8U3l7iGAfDm/Hggj4oIp/eYQum
         y1+ftTuTRADvBXL14gmG3lIQZ70Oyz5v1pK/kwEwQAk15LWe2MG7svycyRKY+d9tMuo+
         rydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        fh=N8Tpi1ukL8J9LVlCdKWGGueHCM/+j8ChwXkOgpbbsUM=;
        b=Sx/gjbExLQQHKjGjxV6J8fMmuimrh0p5R45NrvfRRh9I6Dhyz8jHWDnFH3NEHZxNXY
         qWLRsbXs10n2djt4z5olL9z3djS579OMMrMKOTunhN4mFd2psSAXUtqvWkVYf9qcO/+W
         R6rPYLyF0QP8buDib//hGtJV62pIHwQaip4zE3YxUFM4phS+p1o5tSzwIfuxn2OZ96VA
         RmsXlu/QHa4Jz1kUMeTpAyl75/IzyH9HqtOljanlDvCWhOaFdSrdDsg6sGXNdlDIm6Cl
         2f9Qxv+s5oMAE2uKolLBMFxrkKovAXTsBlMtAA8W+LjH4taHy547X5yNrCyd7OzXw8vM
         j4sg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791973024; x=1792577824; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        b=d6zgHieFPBg7PzhPFJKodrJOgMXtVLiShUFl3jDlArCXpHMvzzzk7InAEMglzL/vxG
         v6rbGmVzuNv47tBFNT3CscP+rNUniFyH8YEHqu9Zwla2P3Kl9InlQD0JQ6SBEIK/J6SD
         IGW0lNqMh3HFYEIi8SZHMgHrUuZvw7f0+u7/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973024; x=1792577824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        b=nHIew9BmYf3mIhzTUQqr/OqQTotWQbpxC5I0l/6jheL6Hw6B/rj+NsxYUdTAEGqU37
         K7VV/S0GIj6ykrUYptuqlSDBaDrkYwLoXruDve2WU5HP41W8lzBnsD/PqdxK1/bA86xe
         2GBUOnP+Qq5mRM255/Vo3sH9sXF8TX0x+bmeo2PPmsgT695UETQPALGA8EHKlWi8X8ty
         eaoz1e6rQzyetfgaxQeb2jw/taF2hvKWIdVLP3UtSi4oMVrYpCcoF2wqdxv9qWaLp7jO
         Kwqy8VBV+RgUqm4N2j4QdjRo9cA0ZjiT4iMKCgvyUOkJZMQjDR/Xi6G4XHrowmyXYxJ2
         aRRQ==
X-Gm-Message-State: AFq9FYKAKDRO7O2LdzvPyjeMkcSVrX2G8Lae+T24d5b68mswHjzGWnrf
	guZoWtTj7D6up8kHD9fOyu7adrUwarwWwW0GoNEY/ASSOb3Fcd1sZ0CQ8HK95MT7adiBbRNo/IJ
	5SXqVPYspn6xS4wqz42xUK8+zfWLbt0TY6tZ76wRqz8IroCV4Q8rhtGoH
X-Gm-Gg: AYBFou1efRcD4kwqh1hwPSfuR2Xf4pg1CqbleuxlQ8smfTRsBs9OXoMkX4K4gMZhtKq
	CiubPSAI9VXa9PF+TsMUrdPX2FyCgEbTDch31mmJk8L6J2YmjZ/1HPZBsfoQZy5FPJvzIGyxt+3
	8INeCyriifS9TDldoDpPplQGFQi10s35/Twyec+fRk6eA086nbhH4V52DWyP4ni/j+dlMji8ZCq
	SaXBQkvH4CWH+1/EgRVgdk0CNb6KOM+77tjL/dbmxYLzI82UqJvRzKtB2N+TUPlpdtmJqNu1HOm
	4IBW2wUzwBk5kFswSeBMJ2nxSCypWGXRuLvt8XqGthyuwtC0I8jxwMEf
X-Received: by 2002:a05:690e:b49:b0:679:8dd7:1d19 with SMTP id
 956f58d0204a3-6798dd71ef4mr307524d50.74.1791973024101; Wed, 14 Oct 2026
 03:17:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-2-wenst@chromium.org>
 <sashiko-outbox-171010@kernel.org>
In-Reply-To: <sashiko-outbox-171010@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Oct 2026 19:16:51 +0900
X-Gm-Features: AclHuK8vB58kVrwUvnG_FV1Bk2KZp5BcyBdkPIRhgzNfIxk2PQPvWDXOfCqkhAM
Message-ID: <CAGXv+5EuYc3iEpwNDNX+Sa2QXnPNe_C0HHH1PCy+j2vyV88xuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: hcd: Add downstream USB ports
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, 
	conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 5:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dt-bindings: usb: port@0 schema constraint bypassed
> --
>
> commit aaa6107663f4d524c266c3a18264c416a86a4bb4
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> dt-bindings: usb: hcd: Add downstream USB ports
>
> This commit adds a "ports" child node to the USB HCD binding to support
> connecting downstream USB connector nodes via OF graph. It attempts to en=
force
> that USB downstream port numbers start at 1, and updates the address matc=
hing
> for hard-wired downstream devices.
>
> > diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Docum=
entation/devicetree/bindings/usb/usb-hcd.yaml
> > index 45a19d4928afa..24df99dfb243c 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > @@ -29,8 +29,16 @@ properties:
> >    "#size-cells":
> >      const: 0
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    description: The downstream facing USB ports
> > +
> > +    patternProperties:
> > +      "^port@[1-9a-f][0-9a-f]?$":
> > +        $ref: /schemas/graph.yaml#/properties/port
>
> [Severity: Medium]
> Does this local constraint actually prevent port@0 from passing validatio=
n?
>
> Since JSON schema patternProperties only restrict matching nodes, a
> non-matching node like port@0 will fall back to the generic graph.yaml
> reference.
>
> Because graph.yaml evaluates anything matching ^port(@.*)?$, wouldn't
> port@0 be evaluated as valid and silently pass, completely bypassing the
> intent that downstream port numbers start at 1?

I suspect I need to write it as:

    ports:
      properties:
        port@0: false
      patternProperties:
        "^port@[1-9a-f][0-9a-f]?$": ...
