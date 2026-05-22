Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E856386424
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 21:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779485877; cv=pass; b=sP7m91HblyiDCQXh1RjqodoltNRQNEaFPBOdZxNIPcx0Ei44ZLZYl6EvMjiCM3qqbtN7qcFZVlDQXQAiKKaJ+/2tydUCfO73PdhjomQkcfI6+J6k2ccVeZ0bwRpt08BcwZeqVCy5BuTzJGHHtj+MI8l6AHORBLPsHnZnXOtmXbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779485877; c=relaxed/simple;
	bh=1TyT37xR7LChang2oHJC0H7cE1jVc5Im3FbgnD3myWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJUP9jRVW3uXfl9KkaT+1CHa0EN6izgGawYWxBuy+YVBtzLhu/xIBtk65+u0A2bodYLGTy9sSt9eX+n7lH+nEOPquYf1H0EwyjMCNFnFCKN43W1YCAOBc7+Aa0kjz6DqUJGNjFXxaBeSeZYvsKTp3tq8mtssTpTE9wmCuIDE5aE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dMQASQMe; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dMQASQMe"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-132d1b2519eso230131c88.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 14:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779485875; cv=none;
        d=google.com; s=arc-20240605;
        b=H0e9DHORhK6/1zxSr7RFbgDSDZx1H4irwIo6Dqbt/ffiJDGVJlOadcjnFPWnxZ3zi6
         j3BfGib2VQjF29PAU6UEFfTPU7W4hk7u8H1peq8/1WEKH1389jbbO7u8vgxxLQdhTQOr
         6LHs0E9TnNxBZd/WIgXGwhTXYXuUP89sjIcfMqW7WVIeYasU0C5UHoWIoSaAUCEubmQO
         VHJkW8gbBxxPKyaQep45UHAphNnHN74hbQHhi2CeKdXzIKXlJxzwDhP/aCACiHNSB7tp
         Q9tPPR3eh7taqWeIter+brTXgVTH/4NK/Psl3igocHYeU36/k3CKqj5RFqQf20O6aFxj
         sXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zSm7l63uLGYvmvNDjzx7U0ucFLWNLmiIMJFYAIeXl4s=;
        fh=kcRmEvKuUr56T29pmcj1pltt3w0eGbocMmUdu3r/3OM=;
        b=G8qpz+ffgZjblUk75I7b0BOcifJAAr/6P0OAudlyY8acqy8JzakrM3y9Zf5vHnv8TS
         IBlxkO3xrrgwIS6iV2QerRQAE21+62U8t3wZJMAs1QORPNKbDZdM3EWZU8mWJqq05kvs
         6x2vcx23BOeom1qYWBEHrhoIHCZWGqlvppWmc0xSXmn+J3vp9eqRICqxESckG7YUqqKD
         DKpFTGLIZaCye6rfHhDBvRUegoN7RilkKiG1Zvl3ZtpVddZOc4X1mIGFJe4LMix7rnId
         Pnn95Zyx2i00Ru45exRxpUjuFcjYFbyyKjuOqxQIhu5jiJhRMPYwXUvNTZp/eMl6FmBw
         GhmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779485875; x=1780090675; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSm7l63uLGYvmvNDjzx7U0ucFLWNLmiIMJFYAIeXl4s=;
        b=dMQASQMeS8K2YtjRJOzKABIboaIQKy2YJ4WbUr/OLwTyN/kCZ9o5cmc/Mk3G7tTr8C
         uNA5wwAwm/YGDDJmGSqHSbPjOocrdLsVQJ7dt7OE0Zz+3dhQzDf8A0dMmr2/PcsJ04BV
         +9gpE2FDd8T5YNIeQMdj7paoV4cV+4rJhIvGUuz1yHYk/xg21rMieYpMsLeercfrb7hX
         wI3vi0ko8xi0CHDhIPvxTyz3HTcBvybX13U1qKGwcXLjmRXhWNJPknhtZujfCPmz3kqR
         1Q1SIUH/OnXF0b6xxdtKOEq3+T7UIFRQ2PoPCw7PbG5w3axdmr+0+JKT3Nk8d5MWDp9E
         wkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779485875; x=1780090675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zSm7l63uLGYvmvNDjzx7U0ucFLWNLmiIMJFYAIeXl4s=;
        b=KMRhqgKR9gv6j2j1DlIH6D4tjLUafgaKaX6mvMHGA6g1J19nOtj6hHFHtXuPy1+xGe
         pxuN5EqZHU0Q0omkd+vRgkaYJc/pfUPPsBvJhMnwrgakS2GmC9C7XHRE2iYiliEHKp4K
         s1AswglHMfG7FuqEg+KUBYrXl30WbUOtpHKkn7/04h6+4QndRgU7Jq5uAa7Ei9Y22giJ
         xbmISshBPy0K6jwNtVLQc5ZnYIq3NE9Asn6H1bXW4oQRXNschNyBlVKAbQH2/U14HhrJ
         xRWG2ApPqguGGPICpbDdjbN8eYS1duCg+qhPErre5OZoDxCwFZJZg6WrThcMism9lxDT
         wkJQ==
X-Gm-Message-State: AOJu0Yzs8sw7/UhbvXiOZiPYeHJJ5hcu1mJrawy49mrRTHeRuXU4+lCr
	JrF0mwfYw/huHe3K+Hi+jGJv6QTybtmkAAD2DOJkNvZCIRUPchQ7AiLCIBD2exYQcRF95D/zLce
	lk9sQGY0TKhulHUyTvrMlH7SoMCLN7xBzraCGjAD2e0AoWA0sUnT2Qg==
X-Gm-Gg: Acq92OF/dN53xfqyZGOhjiVZ6aMX7jSbBmzuNJyZp/5Yn+y2uHvhGc10aoCq+Bxv0He
	hGCV+GiXXPgzrrh37I3zCnQ/v3gxE2gipJFqURxcfpijey2JYNSAhwGVWp29Lfi+v0qfkUQUwwP
	+9DlQO4RlgJm0PzoctT3i1D8NxD8p7SC9YKl3xlJw+p0k/YzrBkFSv5QfnPa2X+KlvNO+WRcEcB
	a+RuK3DG1qzgD3oFgycVcmzkvSInzuSFM1I13SrOBe37lP5kolpHUDrQbAfIW06VhpekiOC00QO
	hjdguI5I0dLel6P0rA==
X-Received: by 2002:a05:7022:613:b0:134:feba:3fd with SMTP id
 a92af1059eb24-1365fd7ccb7mr2727225c88.37.1779485874567; Fri, 22 May 2026
 14:37:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522202410.3104264-2-dmatlack@google.com> <20260522204400.4C7E51F000E9@smtp.kernel.org>
In-Reply-To: <20260522204400.4C7E51F000E9@smtp.kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Fri, 22 May 2026 14:37:28 -0700
X-Gm-Features: AVHnY4IjqQqs870qR0-ohQ72DF2PWotw1xJ6wHuzXsXUHRQz5rQ4D18AzHyAyvs
Message-ID: <CALzav=cZsFx5dpbELx1cMHUa1+4+uv7cYEWAWAtZkXeB2d9mMw@mail.gmail.com>
Subject: Re: [PATCH v6 01/12] PCI: liveupdate: Set up FLB handler for the PCI core
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <tatashin@google.com>, Pratyush Yadav <prty@google.com>, Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 1:44=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Missing `kho_is_enabled()` check before calling KHO preservati=
on APIs in PCI Live Update FLB operations.
> --
>
> commit b0cb2fb154fba1aa85d63570fe0186e243353fb7
> Author: David Matlack <dmatlack@google.com>
>
> PCI: liveupdate: Set up FLB handler for the PCI core
>
> This commit sets up a File-Lifecycle-Bound (FLB) handler for the PCI core
> to participate in the preservation of PCI devices across Live Update. It
> allocates and preserves a pci_ser structure using KHO when the first PCI
> device file is preserved.
>
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/pci/liveupdate.c
>
> [ ... ]
>
> > +static int pci_flb_preserve(struct liveupdate_flb_op_args *args)
> > +{
> > +     struct pci_dev *dev =3D NULL;
> > +     u32 max_nr_devices =3D 0;
> > +     struct pci_ser *ser;
> > +     unsigned long size;
> > +
> > +     /*
> > +      * Allocate enough space to preserve all devices that are current=
ly
> > +      * present on the system. Extra padding can be added to this in t=
he
> > +      * future to increase the chances that there is enough room to pr=
eserve
> > +      * devices that are not yet present on the system (e.g. VFs, hot-=
plugged
> > +      * devices).
> > +      */
> > +     for_each_pci_dev(dev)
> > +             max_nr_devices++;
> > +
> > +     size =3D struct_size_t(struct pci_ser, devices, max_nr_devices);
> > +
> > +     ser =3D kho_alloc_preserve(size);
>
> [Severity: Medium]
> Should this code verify kho_is_enabled() before calling kho_alloc_preserv=
e()?
>
> The commit message states:
> "Note: There is no reason to check for kho_is_enabled() since it can be
> assumed to return true. If KHO was not enabled then Live Update would
> not be enabled and these routines would never run."
>
> Does this assumption conflict with the Kexec Handover subsystem guideline=
s?
>
> The guidelines mandate that all callers of serialization APIs must explic=
itly
> gate their usage with kho_is_enabled().
>
> Calling preservation APIs like kho_alloc_preserve() without the check can
> silently add tracking state that will never be used if the subsystem is
> unexpectedly inactive.

Sashiko keeps leaving this comment. It seems like a false positive to
me. KHO maintainers, perhaps the KHO documentation needs adjustment?
