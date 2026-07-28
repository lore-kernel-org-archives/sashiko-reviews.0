Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D26744C4FD
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 14:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248974; cv=pass; b=bbVjP3+fN7cYpc8muuHy7zs09ce03EtNg2VkHcUvXWkqV3gicl60LTr+Ac6ySLFoSDtDABtHZvHJE4bj4pRcOOdssW2jU3/m8edH8a+nuawwJWAGX7+nvTejIZRKnqoOsoInadQo2X29m+40CHfYRRicd67nGrMBeX6b699WNSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248974; c=relaxed/simple;
	bh=aBO/20PF/cbepZ0EQf/uUevfGfIQ0Byx0XwsWiHsoHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbO5ocB7k3zrgrFtCg1Lo1RI0tXXHYK7PUJqH4sFnaDv5L4FjHK4yOGibs41Ud4yl68/6CrBvTMNgqfSR+hgGqw9YdNWD2xYktYUd4C/+ZMGhy9OfCIsDTYg4+n86uRKynUwER7OY3Y2C2zOBr0ftBFv2MChrs//bjzF35Td04U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7BLHICe; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7BLHICe"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so6429457a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 07:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785248970; cv=none;
        d=google.com; s=arc-20260327;
        b=KHQEV5gpSjDQfOmVu7RLLcQq6Dv3vRn7uLDcW8HNbjWikBjYBrAsOn8sxIW9gZrkMC
         O1saXt21tVbh9Drm+kVDiIAcOLFJvCvPdaRf/RuJp7J+d1Nx14jovYw6K7RsVKdnj+7Q
         FrNMjDGqtC3ktJqOo1EIx+SwECbZ6P5MSI2aLSVEJR/7hoys+QQrbOz6/khFqzS60MiY
         suZi9tXZvvJqHd4TtG6R8RlF27xWKGVfS8AmJIwq7smcr/1y1eZx+vFniRwoLMxrSUvH
         gF6JwnfJIz75a3pggz0IMGsRonJ2tSh/cdrCizO3cfkd7/cyikWDSe9rVI7Yvzoc402T
         VrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gfPUbsImxlUHQ9/cY4ABZiuyT2n9U6cBlsKn2xcvoS8=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=EQiuis43JdJsM++4km2ZcaNaZ0l/fD67bx6m7Ft++i7uRF08GI2guK7IWI2BapYd8q
         oyCqgGkCkioESwN+LRqwwyGDzF7eW9bSH1swAhTkCHTLgZD6YRTB5GZjbO0OF/XpO2PL
         eVqBoQih3BhTYABslmKbeuRS/xxvDVLzmRpaglmfBvuXr5VCPg1cS0X8Cm0XQM0ETuTN
         4UsgV4yTDp0fnTZlbtgutesZAxZ+SjLiMgL3ZR9iIDcnQ5mGFr2eMcMHqONh3TkjaGuI
         xBWs0/G2RjVIpwx1QsWQzdTgfvQOinSe3jgYXlxR7Md4FoLL4JOGrnyt8M2R3JUdGJcd
         TmqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785248970; x=1785853770; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gfPUbsImxlUHQ9/cY4ABZiuyT2n9U6cBlsKn2xcvoS8=;
        b=Z7BLHICeR+hK6ZZ3G3ED2IdRSae77jzo0BoTHlrN6ZIZvyhF+tQYewzbVVgxNkDNkl
         fZiO/pz2UucJGO0K0+sV7L+mqQfsMboyqb+dEtpzZP9hrF/zMGtLNz4yEUanbr4/AN/X
         yIrZn4x8JIyWc2k0XDBiirgQZZcTQaE90Oo8DQ8v0Dg8ioDxWtCBOwYBvLf/aVMO+ni1
         g/F7wgKzwIzc4mF7uFVLj8QagR26JXlVMatqAsMRXvEZCKV5tDSN6NPMfh5g35gmTNqF
         lAapCQtI3j3wWxuFo/xtI2pO71bcQKcqe4BqFp0nQ8Z/FBqGfKGLLNSgasU4vMsbPLyZ
         Fr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248970; x=1785853770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfPUbsImxlUHQ9/cY4ABZiuyT2n9U6cBlsKn2xcvoS8=;
        b=jG50DCEzOZNcIzspeu+Dtmq8ZEOh7cCOFkiRfLhgFmmkYnWSYW7c72q8RnWEWHRPpG
         dRhQD1lw0GpRvRmVeqPbSmcze3XvMSAPrI9M0SpHYomAkdvlKk8RGgaxUV/Rg6lLhN06
         FGuX4VVr3NGlbT7Kqaiv4Ur+duZUrTVm8B8b/59pohAZX6hd/l1KJHW1qJ4qgcjwD1Mf
         tfSaN9/kErBmGhu6EWGxRFeu/hFNE4OpZui8/eP0H0TdZ1sae1V3lGw0U/YroJUh9idJ
         pAUKDIe2LEYicvT0I6q+dpUQU40xYBTOqDh/C2XR/fJc7KmOqWJ//szzd/pDb/QLNlBV
         QvLQ==
X-Gm-Message-State: AOJu0YzkjirhbHD1QOuvBJWYJaamSCHPuISSvXt7Vo2urx9Id0HUA7Fm
	1ZgRuHP1MwFAT6KV4dpv50MaXT1bXeC+ODRRw65fXHy+fv9+rLDYs10HLpMHyPGRAZNlKPtKP+7
	MuJr5HdCNy3Hzk7m+hpjLvisg4mBSzUVg3PPp
X-Gm-Gg: AR+sD13qj6kyyDMi2D06vV3hPqfsxBKLQguq3Yok7dTHkRogwvtleO25qsleXWzHDZr
	Zsppv8A76itKUAbEzn9kdkgp61Q+ZJFOJzBwNi+UD2Fo5si4FI6pp2t6fw4nBjICI/9Hu6AauV/
	BIGBnxSTw1Ef47RdyDUjQ5NTUrno4IrmQlJ0mySlUsZSUbyLmzod7a/lHml7uxxQ4Lz1nlKYHSd
	aFlyRZsJJJB3AsphL5O6IpqGjsF/RoiaTircE4nRgOG1GBwrtwPTjtLceRA76k=
X-Received: by 2002:a17:906:fe43:b0:bf0:2253:ad67 with SMTP id
 a640c23a62f3a-c1f72151da2mr161409966b.46.1785248970263; Tue, 28 Jul 2026
 07:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727075324.3555446-1-a.shimko.dev@gmail.com>
 <20260727075324.3555446-2-a.shimko.dev@gmail.com> <20260728075338.1402A1F000E9@smtp.kernel.org>
In-Reply-To: <20260728075338.1402A1F000E9@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 28 Jul 2026 17:29:18 +0300
X-Gm-Features: AUfX_mx705K6NE-AFVqtwXxKZSb3RkvcFnGpOcbTZc2YdsMjjKYQTIoskIK5A4E
Message-ID: <CAOPX747K9QrHdNy0Cn7bh3grWfi9mv2maEyo9RfVpVdA5B_4eQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: add DAPU Telecom
 DAP8211R(I) PHY binding
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 10:53=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: Low]
> Does this patch series also need to add the 'dapu' vendor prefix to
> Documentation/devicetree/bindings/vendor-prefixes.yaml?
>
> It appears 'dapu' is used in the filename and compatible string, which wi=
ll
> cause make dt_binding_check to emit warnings if the prefix is missing fro=
m
> the global registry.
I don't know.

But it seems it's finally clear how to use yamllint =3D) found the issue
$ make dt_binding_check DT_SCHEMA_FILES=3Ddapu,dap8211r.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/net/dapu,dap8211r.example.dts
  DTC [C] Documentation/devicetree/bindings/net/dapu,dap8211r.example.dtb
$ yamllint Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
Documentation/devicetree/bindings/net/dapu,dap8211r.yaml
  63:1      error    too many blank lines (1 > 0)  (empty-lines)

--
Best regards,
Artem
