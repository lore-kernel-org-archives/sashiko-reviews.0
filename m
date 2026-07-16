Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA95B2931DF
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 05:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784178071; cv=pass; b=CtpjZY4bFWHYolt3dDUsbNK9TMIHRSpoLLPwW03S9UEjQhDoWgYkfzkcNKZXknmgf/u0JWb56yEWNl0wem6dvsgtaG8gJKQbO/JdBiqx+nqbMv2PcYLj3L1PLrUCK1/cstoHmlcHj6ErwQb4kE8TEYIIXMFJo8T2W42OBYdET3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784178071; c=relaxed/simple;
	bh=IHDO4pfQ1RwtqxE6jXQnDmb8Q83xXvkBKahrI0yFd0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afpMBq09afmRhJpgQdlENNGcG+YcQd08zj/OYmL0v3Ytn4kQDu+tyBXNpwhOHx2NWP6/Eoie25MNGcV1gMjaTQhVFMJumeSn+Tj5vUczovRrJKC6WM+G+PK7uxFwg2TY8/8jRZeCO+UNcu4pPQF/+onZCpRFeFQKQVPQDfVLlVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JCpL5FqI; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JCpL5FqI"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66807ba2f0fso2830214d50.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 22:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784178069; cv=none;
        d=google.com; s=arc-20260327;
        b=FOLdnnpVWBtEC/gQx0a1bWCPvmXDEfoHyNHNFmKikXmPJ0h7ufGXVyXh5upHv0UVAY
         ikjOKnRrC3A3s1pUKxmhqh0OafS4ZmEhSUpAvxgtKeePp3tpvfCUzU9bZ59tiDSFmlhF
         h1JriXmgE/lSvhUinwHgLzeHbRW52mKOv4R1SLpP6026ST1zswgrcH9CYPu5m1WCdPkW
         1cI8hKKeD9sNtmqUW4cqqhX6wAWaomH+Lqn8g4xGTubVbDxH6wsu9KRt6X8e8m5FJMmv
         O8u7teoOXZOa6nDd4ivAFu4y4HbGkmCYTpbJfKBV7zY6wosVD9Aexix5bNOg244qlIfQ
         854A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1BOXU1ObI+PFUCX17oIQNJoe6CKqml9x7GPGmHcf1jM=;
        fh=kgUYGj7kl2S0wuOPJuUG25Yzn/6Fjl8v8tI2Yr8h8mI=;
        b=FV5XTUOh0hZqwVzTnOVSWMLZkLEpSnih9XSAdep9JhI2jlohzNOfGithEoNVeHk6+I
         IdZ/mEHjSg/steVvNnlPppVgDC890g7H0EPa5Fx5mfSw4jmYrNc3mluwH7ZQ/G+7iSZ6
         +Fl3UoDqubt0aHg9Mnk1y8X7FC8tDPjHYDygJrp+aiFXLi/J2nUG70Z3UrYlV8dTayra
         Cn/H0lP+JDIPAlgmHq0Zklsuzoyxtw4g3J+knk5YYWNRB5tTd1JbKixI8ZEggem5TYkg
         /aCLjOzkoB2UtP5/Kv/GF1qm0KiabTCI5GIvZL1z++t2NF5oVLjKVBSkWvqgki3BXzNS
         1pcQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784178069; x=1784782869; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1BOXU1ObI+PFUCX17oIQNJoe6CKqml9x7GPGmHcf1jM=;
        b=JCpL5FqIgy+c+p5W8Zeq3PlZYJ7rkniQMgDs2GUFgFfaiROQUblF1/FJ+rni3VYJJQ
         3YuiveQ+BxA8Z1oSdQcuDfkT6hCJxX3gp9CGrPr0ZMsXnSMu0EHxy6CVA1M1hHa2ai+g
         pgsAEcC78d+QhEKzB8A3Wh5sJDavBDtc9TTmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784178069; x=1784782869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BOXU1ObI+PFUCX17oIQNJoe6CKqml9x7GPGmHcf1jM=;
        b=Z316lzBb3f6iOeFwY56DOshfyMTdKqWDJTajvnUYz+W/YYjlgAA5+pLSwi5/uFPXoB
         p8Ws727/KFqMFN5bvca/T/P0zmY55g9PM1HQ4QBh+KUzlHy2LI2+T4733AVCjAIzhpf0
         bBokgiMl5IqOhhwBxBhrXXAcGqpiBfdoaP/qY0ZVKF3nJs4mvOsaT+gI8e4s4GNSyZO0
         qqS+MyEYnpJM6quV4KNVdKEPG5iYu0JBWzmQAGqIAEuyawcXCDAvGHnudGED9s3JsrcW
         qodPwOzs9yzk+jEd6/EORAosMsm1Ors3IIvtaq9fJ+7jpgCzW8xenoPbG+eQwNDWkOi1
         2vqA==
X-Gm-Message-State: AOJu0YzalPwE5vcFsbo1E6Sy5uWiH2b71QRoAvzAGR90TVp0KFRNIx2C
	8NgeHW5Fnh4BwWLcN8Iij/9w5v4AD1RvPPipYvPaz7RowZAE3BNOg9WnPyekqKtlcwLiGMDgatF
	k+codzVAnuYeonA5mv4Z74Rb8rIz+n5RDIYD0AMzEEmjHXKlJTy0=
X-Gm-Gg: AfdE7clOvMYxUd3CP2qNsSsp+j8tMRuSL1bBRp/Ne4IT8pucEjefgjfTceLnyAjYJeN
	+DhO3A9HAFqLaxcY9LUQPSZxUoQhOntwSbnY6oBjOB5IC16FCHxV5pzjQMVaH0XIxAJnphFbTTS
	uoSfkisM9VPerw+oM2lNFwoNUUgxk+ohrQQ44bYdsfscIo1WDhw7sbu8NWr+k4PaPjOKgqplOo/
	L22ELgpJmqcpssRx7xpzGb5GYUlx0kgI/ZN+xlyeADQwkTY3D0304PisAd4HZ+Dd7RAkchn4aPx
	2Z47VAMFavu7GqXj
X-Received: by 2002:a05:690e:b8b:b0:668:2b54:8cf4 with SMTP id
 956f58d0204a3-6682b5495a1mr520495d50.72.1784178068705; Wed, 15 Jul 2026
 22:01:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-2-wenst@chromium.org>
 <20260715090310.26F5F1F000E9@smtp.kernel.org>
In-Reply-To: <20260715090310.26F5F1F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 13:00:57 +0800
X-Gm-Features: AUfX_myRAMngI7RW0JtHLajnxuyPdfwVsueSic_78CnabftGnuXr_AHxR2Pwgj4
Message-ID: <CAGXv+5HQ68BPzu-G8FHoEpFyncd_78VJCTm3vNDBQPsomX4H7g@mail.gmail.com>
Subject: Re: [PATCH v5 01/16] device property: Add fwnode_graph_get_port_by_id()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The patch adds two conflicting declarations for `fwnode_graph_get=
_port_by_id` in `include/linux/property.h`, which will break the build.
> --
>
> --- Patch [1]: [PATCH v5 01/16] device property: Add fwnode_graph_get_por=
t_by_id() ---
> commit 88979df4c2fc6de15d7726e00adc783bff896bbd
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> device property: Add fwnode_graph_get_port_by_id()
>
> This commit introduces a helper function to retrieve a reference to a por=
t
> firmware node by its ID. It includes a flags parameter to allow callers t=
o
> specify whether incomplete ports should be returned.
>
> [ ... ]
> > diff --git a/include/linux/property.h b/include/linux/property.h
> > index 14c304db46648..480ba8646bcc8 100644
> > --- a/include/linux/property.h
> > +++ b/include/linux/property.h
> > @@ -505,6 +505,9 @@ int fwnode_get_phy_mode(const struct fwnode_handle =
*fwnode);
> >
> >  void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
> >
> > +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle=
 *fwnode, u32 id);
> > +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle=
 *fwnode, u32 id,
> > +                                               unsigned long flags);
>
> [Severity: Low]
> Does this cause a build failure? It looks like there are two conflicting
> declarations for fwnode_graph_get_port_by_id() with different signatures.
> Since C doesn't support function overloading, will this result in a
> 'conflicting types' compilation error when the header is included?

Indeed. I squashed the header change into the wrong patch.
