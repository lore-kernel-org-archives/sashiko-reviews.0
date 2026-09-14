Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF3A47ECF6
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 14:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396015; cv=pass; b=J9GpHTKYj67cEbBM38Ewl8faH6oUqiYpEXUX6I43IBzxa6ejScNBzd+kni3M7IyWvDpSpW51CY/BiGana1MkJZ/dFF0ih3jXnz9bF6SrnEpD21sJbnqNl1TFBXEl/+Peo/GECpbsde5wNVRk3MQD6CGsaCJdsI4seE7205KsgZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396015; c=relaxed/simple;
	bh=81vJhDkEw0hvn3+KQOXHxZ2yc0dONF02B9FfrP65Cdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMD5wDQFMzTchKuVDrKtApWFzPbXlthyGECIUi/WZT4Pvhc0YOaU4pg044TNeC2K0YbIsSeUiueaICymsNcV4cLerY+fPqwInhnfraFF2d9IodsscFdZhJ9NsNttJvSFM0t1owfutlEtyRrBFrTSI0QTLXKYnm6mQAUSRazK9Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=NWM0bzfj; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="NWM0bzfj"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c294183384fso539420066b.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 07:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789396012; cv=none;
        d=google.com; s=arc-20260327;
        b=ZLLetdV50nLybHB/T9e/a6r+cjm3saaA+WFCx829mRijTHHbcdp4clo1KIN7IlAH3h
         pQxpoto5FUs3ZvhIS/3KVp6ZE4n2rrjkudoNjMFCLDy0GpLBKo1CtA8fA+6/GZb0w4Ez
         uSwbtW171w1MGV0CA6eNhRUt1fpRNhMt7crUQB6vpacXiWXqeO+AKocpqdubIPvJdM1d
         oY13Qbgd/NyJDAPylmcVRYglo5hgAwn/RC05umV+QKuN7u7hXG+MAVFvYebIg3PgU+OR
         d9gfL7X4NJIWuni5zbtIv6rjHzM8eCnsBh7fFKZiJLvKO/RPzBbS7zHuNWsQPL3FWYfk
         GVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3SRl5RlCoBEMdB/onhWIkx4Vv9NPOyhwv41Rqd2HgvQ=;
        fh=6j/Dplj3AXGxO/ku1ACIUV5HaNtPbcETuaNBxeCMOdQ=;
        b=USpOIffBVWuk8hvb5yfJUEd1yfaOnjPi78NH1szB7ZjVzPXWarTIWuKbKZiP+QWZqp
         yW4maxJ7w3NzZMfxnXrvtWPDW7n+IvxaYGpRCBmy043yafAGpCZguD4r0XsKh5+JYfUd
         4xVgj+45n9rxs/SlhIG1HOCj4qqXe0GOx0jR97A1NIU+JAdEoUpovpEKlX4glo0hqCsK
         TjZ1I4DLXA6BFOyAnvTPd1YgEFBJEpPUB+QXtmnj/wB2n31jPhEMXMWH4M2h+6ETJNMb
         CxkMlDOZBWFrTTKN0BjdBadpH8GQyCovVqnmn/AMuZYArlQ9u7FXoQg9fMtxVPXvFOs/
         rYHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789396012; x=1790000812; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3SRl5RlCoBEMdB/onhWIkx4Vv9NPOyhwv41Rqd2HgvQ=;
        b=NWM0bzfjuGwVd9Ovtams+A46oWIVPXg5wp5zdhiiNamhkbSbh/tLa50ONIj2eUmPHp
         fvwTwi74YOVrbJh3wLkQfU0RE7IdwWB0VDgS94cxo+RA3JGloRHWH0euRKXbf321hWuf
         Z52DtgX68S5wowcYvnBbppkN9NtRwl1jc9BM49m+j+LjQz8CMKcMyRJApQr63eVOaGo4
         fq0I9i+yoVQQnSPp++qoCZuqd6VJhpX50SfTpsyqDyC6jS5obB07zWAjKz9av8VHZe3m
         0VqCrHIKV6woOMXgqtAs5MyGOpckxQ/wKS0mfrGzrOTGqLph/ehbBHfUxFQLSV//zts9
         xLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396012; x=1790000812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SRl5RlCoBEMdB/onhWIkx4Vv9NPOyhwv41Rqd2HgvQ=;
        b=Xn2p9+9iDp+EcokyvwO6IHsGP1p0guS8iP7e/s9eB6FqIYGJqS4oPodU/sSCiLb0eK
         idCXNLj0UzNkyuaxZCB9k2/StxluAefzyUepwifDG99r/kS7LWjv8o73Dx/ISmP8Kro4
         E1dkjxHaLxiMafjGqWghaQp7EyTdae/PY9k4DRcFmMYSHCj7VF5p7XldMZss/+faMx7z
         F3mf8v+r305BZDRX3d2vCoMRAtG4uBNfICsteJ3/US1Yg28kYPSwhxls1MQ1PaA8F7j/
         3r3i3ygrjCcYU53oTewMDGJToPlPI4UfqdVWigCh+Xe0GUYIK69LDqS7RI0R8ufs/9fk
         QyOw==
X-Gm-Message-State: AFuF++kotDHc6rXfGcpBBiSPluQL8Tgj57tdgGOXXZy3tKPH8oYT8AqD
	nlRdLrR9ei40wS8HxgG42VmnshqJqm9x6IqnbjMRHvK5zpRFtM2GV4wIiILupncofiHGvi6thXj
	FzWf9rdWxMUDz6T9OP7Whoob1/RoiIe0Sm2j89a8J3xFWKxWX5KVb90Q=
X-Gm-Gg: AYBFou1S/ESnZVP0XFe4Fjhm3xb1xZQCSm0YKJF+GdjRtEm4GvefxRR9qupAmgtzUWp
	URejTrlKiSNTpoZdF1ClMGijXyBpOm9yc4WZmUDN08NpIROTkLax58vl99YQj2Afnpi6y+yBsj0
	3AP3J8/QG55AjzuDU8CslivKF/M1udHXgMiWP6DxSvfo9mwDKiZveogMXqEMAqgdw3O5Q4lxxKn
	fnQs9Hxg6gP6Wz0AtMucuzgav/G0PAVg2g2rEHPqnSUuj+9uoPr7KkYYfsg8y3DwjU3yn6tw5mz
	MKRIPGMu09lnAz5s93OGybA2+fEwMIBB8B4HY2G4FcUIf51LjOcU4b8=
X-Received: by 2002:a17:907:1c1f:b0:c29:3bc7:c13 with SMTP id
 a640c23a62f3a-c29b861ead8mr178688066b.4.1789396011638; Mon, 14 Sep 2026
 07:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-bq25798-v1-1-dc5e2ec343c4@flipper.net> <20260914140821.269AC1F00893@smtp.kernel.org>
In-Reply-To: <20260914140821.269AC1F00893@smtp.kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 14 Sep 2026 18:26:44 +0400
X-Gm-Features: AcwNN1URozr7S4_r01G8CCPPRVZ26CghHbia4XeX1NY-TwCeIavw2uWVQYPLnZ0
Message-ID: <CAKTNdwGnbzJnvxdGJa58wf_ab8RPBurjPSt7uxXno-z8sqdqxg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: ti,bq25703a: Expand to include BQ25798
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 6:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Adding an array-based fallback compatible string without updat=
ing the `if: properties: compatible: const:` conditionals causes the new co=
mpatible to bypass device-specific schema constraints.
> --
>
> commit 37d04d6cb52639a3cc4ba9ade1878fa540a5cb3e
> Author: Alexey Charkov <alchark@flipper.net>
>
> dt-bindings: mfd: ti,bq25703a: Expand to include BQ25798
>
> TI has unpublished the BQ25792 charger variant and pulled its docs from
> their website. BQ25798 is a pin and register compatible replacement. Expa=
nd
> the existing binding to include BQ25798 with a fallback compatible to
> BQ25792.
>
> Link: https://www.ti.com/product/BQ25798
>
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml b/D=
ocumentation/devicetree/bindings/mfd/ti,bq25703a.yaml
> > index cdce83f058041..43afd232a6142 100644
> > --- a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
> > @@ -11,9 +11,14 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    enum:
> > -      - ti,bq25703a
> > -      - ti,bq25792
> > +    oneOf:
> > +      - enum:
> > +          - ti,bq25703a
> > +          - ti,bq25792
> > +      - items:
> > +          - enum:
> > +              - ti,bq25798
> > +          - const: ti,bq25792
>
> [Severity: Medium]
> Is this a regression that causes the new compatible string to bypass
> device-specific schema constraints?
>
> Later in the file's allOf/if section, there is an exact match condition
> for the ti,bq25792 compatible string:
>
>   - if:
>       properties:
>         compatible:
>           const: ti,bq25792
>
> Since the schema const keyword mandates strict equality, it will fail to
> match the fallback array ["ti,bq25798", "ti,bq25792"]. As a result, if a
> devicetree author specifies compatible =3D "ti,bq25798", "ti,bq25792" and
> configures out-of-bounds regulator or current values, the device-specific
> hardware constraints for ti,bq25792 will not be applied during validation=
.
>
> Could this if condition be updated to use contains instead of const, or
> otherwise include the new fallback array?

Fair point, will address in v2.

Best regards,
Alexey
