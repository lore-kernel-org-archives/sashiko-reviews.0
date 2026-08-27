Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF1940F734
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822811; cv=none; b=ErIeNuvZX8O0Exkal/ydzjxsu1wpqileHiQcZ8GRGbZC+eI1MIDcRZ2756i5InWISx8FhTixt8mXwuGoH0EvA+eSILyOGvaD/IOjZDANe8e/4fNbW9YGZ+7qxNfrPVZIMTcVpX+GA87MD0ENACdFWF9QusNCNNRnB6Er2cHPu54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822811; c=relaxed/simple;
	bh=CSb//Yyfi6yM9PjxFa7J5F68VS2QYfjeIUlC13z5vwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMBWM2+lfJTQtkyIvXN3CsOPMiPUknE4RMtqopBQ7TB9gyaGlukhJXRnz2tWDwBEknuCHxgo6V53kp3kWb8rFaGP3Ulxknnx0NaPeF9hicFmNx6Zg1uYaF8nTGn1M8kKlZI8zIW7aMG4ocgM+Dgxz9y6oX3IESco9efHK3/3RqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dTlnNwZO; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dTlnNwZO"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482c58a8683so335589f8f.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 02:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787822808; x=1788427608; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CSb//Yyfi6yM9PjxFa7J5F68VS2QYfjeIUlC13z5vwM=;
        b=dTlnNwZO6J+t/+bWwsgbh9Wz2ttg3GYZf/KVpTZwJFaJSP8l05bVMmWaHxNZPT37aY
         OFkD+6BvtPBMRe9isJghxOTzTnxPDv0nZcyxgtcqr+XFn0DF88Mhvk3z54y0IzIGixR+
         rHkSAucg1vzOs0UVDAXrWU8k9VuKhMH/mZboghhHhdmKgTcaBOrOmmHJt1M+dluAHyZ/
         waVWvO4EgnO0ZiFwkXjoCs+YJwdhZAQWZd2FeBQFE8TyBohhEMrlsOQGsmzddTY5527o
         PFmBZ+XupvVmIXDy4Rk2GnvzTkXT6lGOKy8mIpYMeQPPROmmIBgfh7YcxKK/6ecGoOXz
         YsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787822808; x=1788427608;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSb//Yyfi6yM9PjxFa7J5F68VS2QYfjeIUlC13z5vwM=;
        b=i0WEw3nonI2Vobs+IdHNesu/Ls/Fwg/8pn5yKC8SDjW5KJ2zfQdQDxnHyt/O2aBU6O
         VbZCP4bs7u2oRxGhFX7i7lNCOXUn4YUBjidX2b4pDWybWnfwPp1JlNghm44aAclds4xz
         qlaCHHo/08Cn0qqHhudEQfE9lZMzqjcw/MW/lA1LxTkOrqQdHRQbFxygz+MWHJyt/qtU
         NWEheOuUyjJIY5P1ENdi77ZuIthQSlZSO3Tk9kliQ+XNVBY4/FIbZ0V5OPPZzJVZP4bV
         Un1L/7QXQEW0eqlylb/LXdKvnHmLZvsLZAuJRBtQAk2J116tgE6H7sqSnOesea4n1tKP
         FMeQ==
X-Gm-Message-State: AFuF++nFJxBLDAEcaePmS+T4gWNucd9L81Pc3ZKaDtDuvuK/4HYcKN8j
	yg84S3Yi3DcnibpcR9t9uYvXof0f2wwvWfqtT9JM2F+sJ6TtpdfoqfNBlY03mdaFFO4=
X-Gm-Gg: AR+sD122kMH3+HO5FhgWzPlaeWphv4hxdFl3nme+twSPdenaX6J8Q84DgR9xFj5okWD
	4ryVdCVKifUYw9fJgmimdkNDe6TCil6yxg12Wa8cddc+FFoV4pvscl6q5L5aPVaWLYmWKRPS9AB
	8Iq6rwrezXu2ZONzbZYm6QM7Z5NQQoxLkZ3oSo6V6HgX+Q4JRcU/VT+CspNyM/DumCsODEsbLqR
	iaYQcWo1FAbuQOFa/FqEq6sxGgcjxEtX/b9sNAP7wWE0b1iIWl0Fg9fG+Gn2BBSEq6kL60/t8yw
	JDGqxYEK2T/JqZIBM9yIiKo/e+jvuYWeC3Ysjo8djneEj01eXUKN812dYyn3agBIxEPzFW9XyUK
	KXF2pTCeVjoHbPpAvLIoMns+EgQqh8rs7vF2mnY8gVwLeY3mI6iDiLmMc1Omo3WWXAnpdYLLP9w
	wIeESl5eZlMrtLY3mFwgNIeWk5VUblnPXMyypijvZzaNTV833WMRoofNy8xsFdvbw=
X-Received: by 2002:a05:600c:c87:b0:499:d22a:8973 with SMTP id 5b1f17b1804b1-499dc6f47ccmr119410575e9.1.1787822807532;
        Thu, 27 Aug 2026 02:26:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc6446sm32113475e9.7.2026.08.27.02.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:26:46 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:26:45 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, tj@kernel.org, hannes@cmpxchg.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <linux-mm@kvack.org>
Subject: Re: [RFC PATCH] mm/mglru: fix ineffective memory protection for
 non-kswapd reclaim
Message-ID: <apABJglqDFcB02VO@localhost.localdomain>
References: <20260826133054.88529-1-ridong.chen@linux.dev>
 <20260826134733.051941F000E9@smtp.kernel.org>
 <0c606cf9-2b5a-4549-8ab1-0be619487412@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xzefaujiz7w5j4fo"
Content-Disposition: inline
In-Reply-To: <0c606cf9-2b5a-4549-8ab1-0be619487412@linux.dev>


--xzefaujiz7w5j4fo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH] mm/mglru: fix ineffective memory protection for
 non-kswapd reclaim
MIME-Version: 1.0

Hi Ridong.

On Thu, Aug 27, 2026 at 09:29:13AM +0800, Ridong Chen <ridong.chen@linux.de=
v> wrote:
> On 8/26/2026 9:47 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> >=20
> > Pre-existing issues:
> > - [High] Integer overflow in `effective_protection()` calculations on s=
ystems with >=3D 16TB RAM.
> > --
> >=20
>=20
> Thanks for the careful analysis. You're right that this is pre-existing in
> effective_protection() and not introduced by this patch.
>=20
> I'm not sure it's worth fixing in practice, though =E2=80=94 the overflow=
 requires
> systems with >=3D 16TB of RAM, which I've never encountered
> myself. So I'd rather not fold a fix for it into this patch.
>=20
> I'd like to hear the maintainers' thoughts on whether this is worth
> addressing separately.

Machines with >=3D16 TiB aren't completely out of reach [1]. Then
configuring such protections to attain the overflow is another
condition, so I'd consider this a nice to have but not a
pressing fixup (separately, with thorough review of occurences where
total page counts/bytes might get multiplied).

HTH,
Michal

[1] E.g. https://aws.amazon.com/ec2/instance-types/u7i/

--xzefaujiz7w5j4fo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCapACwBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjofAD+NsuFu0PDFJHyrulcXKzI
igkF85NY5/lYAU523FvrLmwBAKSa/iEpzYpKL0GrbsrBCZng/5QlqrJuwRFlL0SD
bvIF
=UNaW
-----END PGP SIGNATURE-----

--xzefaujiz7w5j4fo--
